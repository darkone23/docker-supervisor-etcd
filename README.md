docker-supervisor-etcd
=====================

packer setup for creating a docker image to run etcd using supervisord

If you have `packer` & `docker` installed:

    packer build etcd.json

Then commit the build hash as the docker container `etcd`:

    PACKER_ID=$(docker ps -a | awk 'NR == 2 { print $1 }')
    docker commit $PACKER_ID etcd

Now, run your newly created container:

    docker run -d -p 4001:4001 etcd /.virtualenvs/supervisor/bin/supervisord -n -c /opt/supervisor/supervisord.conf
    # some container hash

You should be able to see it in the docker process list:

    docker ps

And you should be able to interact with etcd:

    curl -L http://127.0.0.1:4001/v2/keys/message -X PUT -d value="Hello world"
    curl -L http://127.0.0.1:4001/v2/keys/message

To stop the container:

    docker stop $(docker ps | awk '/etcd/ {print $1}')
    # docker + ansible + packer = :)
