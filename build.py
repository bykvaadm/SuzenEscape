#!/usr/bin/env python3

import argparse
import docker
import logging
import yaml


def build(level, registry_url, args):
    try:
        image_tag = '{registry_url}/suzenescape/{level_name}'.format(
            registry_url=registry_url, level_name=level['name']
        )
        _, build_log = client.images.build(
            path='chain{level_chain}/level{level_vl}'.format(
                level_chain=level['chain'], level_vl=level['level']
            ),
            tag=image_tag,
            buildargs={
                'USERNAME': level['name'],
                'CONFIG': level.get("config", "NONE"),
                'USERHOME': "root" if level.get("rohome") else level["name"],
                'FLAG': level.get("flag", "NONE"),
            },
            rm=True,
            forcerm=True,
        )

        if args.verbose:
            logging.info(
                '{image_tag} build log:'.format(image_tag=image_tag),
                *build_log,
                sep='\n',
            )

        if not args.build_only:
            push(image_tag)

    except Exception as exc:
        logging.error('build error:')
        logging.exception(exc)
        exit(1)

    return


def push(image):
    client.images.push(image)
    return


def argp():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        '-b', '--build_only', help='build only, not push images', action='store_true'
    )
    parser.add_argument('-v', '--verbose', help='log enable', action='store_true')
    # parser.add_argument('-f', '--vars-yaml', help='path to yaml level vars file')
    parser.add_argument('task', nargs='+', help='task to build list')

    return parser.parse_args()


if __name__ == '__main__':
    logging.basicConfig(format='%(asctime)s %(message)s', level=logging.INFO)

    client = docker.client.from_env()
    try:
        client.ping()
    except Exception as exc:
        logging.error('docker client not init')
        exit(1)

    args = argp()

    logging.info('Start')

    try:
        with open('ansible/vars.yaml', 'r') as stream:
            yml = yaml.load(stream, Loader=yaml.BaseLoader)
    except yaml.YAMLError as exc:
        logging.error(exc)
        exit(1)

    registry_url = yml['registry_url']

    levels_map = {level['name'][len('suzen') :]: level for level in yml['levels']}

    build_query = {}

    if args.task[0] == 'all':
        for task in levels_map.keys():
            build_query[task] = levels_map[task]
            build_query[task]['level'] = task
    else:
        for task in args.task:
            if task in levels_map.keys():
                build_query[task] = levels_map[task]
                build_query[task]['level'] = task
            else:
                logging.warning('{task} in not available: skipping'.format(task=task))

    for level in build_query:
        logging.info('build level {level}'.format(level=level))
        build(build_query[level], registry_url, args)
