FROM node:7.3

#install rethinkdb
RUN echo "deb http://download.rethinkdb.com/apt trusty main" | tee /etc/apt/sources.list.d/rethinkdb.list
RUN curl https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -

#install rabbitmq
RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list
RUN curl https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -

#install yarn
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

# Add the latest stable redis ppa.
RUN add-apt-repository ppa:chris-lea/redis-server

RUN apt-get update

RUN apt-get install -y software-properties-common

#install rethinkdb
RUN apt-get install -y rethinkdb

#install yarn
RUN apt-get install -y yarn

#install rabbitmq
RUN apt-get install -y rabbitmq-server

#install redis
RUN apt-get install -y redis-server

