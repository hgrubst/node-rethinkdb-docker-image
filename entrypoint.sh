#!/bin/bash

#start rethinkdb
/etc/init.d/rethinkdb restart

#start rabbitmq
service rabbitmq-server start; 
rabbitmqctl add_vhost test;
rabbitmqctl set_permissions -p test guest ".*" ".*" ".*"


#start redis
service redis-server start



# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user

exec /usr/local/bin/gosu user "$@"