#!/bin/sh

uwsgi --plugins python3 --http-socket :3031 --wsgi-file platform.py
