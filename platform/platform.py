#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import subprocess
import sys
import uwsgidecorators


################################################################################

UID_MIN = '2000'
GROUP = 'study'


def is_root():
    return os.getuid() == 0


def run_command(command):
    process = subprocess.Popen(
        command.split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
    process.wait()
    if process.returncode:
        print(process.communicate()[1].decode())


@uwsgidecorators.thread
def add_user(user, shell='/bin/false'):
    if not user:
        return

    # create user
    run_command(
        '/usr/sbin/useradd --no-user-group --create-home --groups docker '
        f'--gid {GROUP} --key UID_MIN={UID_MIN} --shell {shell} {user}'
    )

    sshdir_path = f'/home/{user}/.ssh'

    # mkdir ~/.ssh
    run_command(f'/bin/mkdir {sshdir_path} --mode=0700')

    # ssh-keygen without passphrase, without comment
    run_command(f'/usr/bin/ssh-keygen -f {sshdir_path}/id_rsa -N "" -C ""')

    # make authorized_keys from public key
    run_command(f'/bin/cp {sshdir_path}/id_rsa.pub {sshdir_path}/authorized_keys')

    # chown to user
    run_command(f'/bin/chown -R {user}:{GROUP} {sshdir_path}')

    # chmod recursive to rw----
    run_command(f'/bin/chmod -R a=,u=rwX {sshdir_path}')


################################################################################


status_200 = "200 OK"
# status_400 = "400 Bad Request"
# status_404 = "404 Not Found"
status_500 = "500 Internal Server Error"

# headers_html = [("Content-Type", "text/html")]
headers_plain = [("Content-Type", "text/plain")]


def application(env, start_responce):
    query_string = env.get("QUERY_STRING")

    if is_root():
        add_user(query_string)
        start_responce(status_200, headers_plain)
        return 'true?\n'.encode()
    else:
        start_responce(status_500, headers_plain)
        return 'not privileged\n'.encode()
