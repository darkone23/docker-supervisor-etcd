#!/bin/bash

COMMAND="su -c '/home/etcd/bin/supervisord -n -c /home/etcd/supervisor/supervisord.conf' etcd"

exec /bin/sh -c "docker run -d -p 4001:4001 etcd ${COMMAND}"
