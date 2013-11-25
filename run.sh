#!/bin/bash

docker run -d -p 4001:4001 etcd /home/etcd/bin/supervisord -n -c /home/etcd/supervisor/supervisord.conf
