FROM nodesource/trusty:6

#install rethinkdb
RUN echo "deb http://download.rethinkdb.com/apt trusty main" | tee /etc/apt/sources.list.d/rethinkdb.list
RUN curl https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list
RUN curl https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y rethinkdb

#install rabbitmq and redis (how to start the services and actually use them?)
RUN apt-get install -y rabbitmq-server redis-server

