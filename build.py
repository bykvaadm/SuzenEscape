#!/usr/bin/env python3

try:
    import argparse
    import docker
    import logging
    import yaml
    import subprocess
except ImportError:
    print('Import error.',
        'You need to install requirements.',
        'pip3 install -r requirements.txt',
        sep='\n'
    )
    raise SystemExit(1)


def build(level, registry_url, args):
    try:
        if args.token:
            token = args.token
        else:
            token = "latest"
        image_tag = '{registry_url}/suzenescape/{level_name}:{tag}'.format(
            registry_url=registry_url, level_name=level['name'], tag=token
        )
        flag = level.get("flag", "NONE")
        print(token)
        if token is "latest":
            token = "latest:1234567890"
        print(token)
        encrypted_flag = subprocess.getoutput(
            ["echo "+token+" | openssl enc -aes-256-cbc -nosalt -k "+flag+" -a | base64"]
        )
        print(encrypted_flag)
        _, build_log = client.images.build(
            path='chains/chain{level_chain}/level{level_vl}'.format(
                level_chain=level['chain'].zfill(2), level_vl=level['level']
            ),
            tag=image_tag,
            buildargs={
                'USERNAME': level['name'],
                'CONFIG': level.get("config", "NONE"),
                'USERHOME': "root" if level.get("rohome") else level["name"],
                'FLAG': str(encrypted_flag),
            },
            rm=True,
            forcerm=True,
        )

        if args.verbose:
            build_log_string = ''.join([item.get('stream', '') for item in build_log])[:-1]
            logging.info(
                '{image_tag} build log:\n{build_log}'.format(image_tag=image_tag, build_log=build_log_string)
            )

        if not args.build_only:
            push(image_tag)

    except (docker.errors.BuildError, docker.errors.APIError) as exc:
        logging.error('build error:')
        logging.error(exc)
        raise SystemExit(1)

    return


def push(image):
    result = client.images.push(image)
    logging.info('push status:')
    logging.info(result[:-1])
    return


def argp():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        '-b', '--build_only', help='build only, not push images', action='store_true'
    )
    parser.add_argument('-t', '--token', help='token, used as message to encrypt')
    parser.add_argument('-v', '--verbose', help='log enable', action='count')
    # parser.add_argument('-f', '--vars-yaml', help='path to yaml level vars file')
    parser.add_argument('task', nargs='+', help='task to build list')

    return parser.parse_args()


def query_add(qtask):
    build_query[qtask] = levels_map[qtask]
    build_query[qtask]['level'] = qtask
    try:
        servers = levels_map[qtask]['servers']
    except KeyError:
        servers = []
        pass
    for server in servers:
        stask = server['name'][len('suzen') :]
        build_query[stask] = server
        build_query[stask]['level'] = stask
        build_query[stask]['chain'] = levels_map[qtask]['chain']


if __name__ == '__main__':
    logging.basicConfig(format='%(asctime)s %(message)s', level=logging.INFO)

    client = docker.client.from_env()
    try:
        client.ping()
    except docker.errors.APIError as exc:
        logging.error('docker client not init')
        logging.error(exc)
        raise SystemExit(1)

    args = argp()

    logging.info('Start')

    try:
        with open('ansible/vars.yaml', 'r') as stream:
            yml = yaml.load(stream, Loader=yaml.BaseLoader)
    except yaml.YAMLError as exc:
        logging.error(exc)
        raise SystemExit(1)

    registry_url = yml['registry_url']

    levels_map = {level['name'][len('suzen') :]: level for level in yml['levels']}

    build_query = {}

    if args.task[0] == 'all':
        for task in levels_map.keys():
            query_add(task)
    else:
        for task in args.task:
            if task in levels_map.keys():
                query_add(task)
            else:
                logging.warning('{task} in not available: skipping'.format(task=task))

    for level in build_query:
        logging.info('build level {level}'.format(level=level))
        build(build_query[level], registry_url, args)
