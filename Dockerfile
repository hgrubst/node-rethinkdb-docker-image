FROM node:8.4

#install rethinkdb
RUN echo "deb http://download.rethinkdb.com/apt jessie main" | tee /etc/apt/sources.list.d/rethinkdb.list
RUN curl https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -

#install rabbitmq
RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list
RUN curl https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -

#install yarn
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN wget http://www.dotdeb.org/dotdeb.gpg
RUN apt-key add dotdeb.gpg
RUN echo 'deb http://ftp.utexas.edu/dotdeb/ stable all' >> /etc/apt/sources.list
RUN echo 'deb-src http://ftp.utexas.edu/dotdeb/ stable all'  >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

# Add the latest stable redis ppa.
#RUN apt-get install -y -qq python-software-properties
RUN apt-get install -y software-properties-common
# RUN add-apt-repository ppa:chris-lea/redis-server

RUN apt-get update


#install rethinkdb
RUN apt-get install -y rethinkdb

# Create the default rethinkdb configuration to startit with init.d
RUN cp /etc/rethinkdb/default.conf.sample /etc/rethinkdb/instances.d/instance1.conf

#install yarn
RUN apt-get install -y yarn

#install rabbitmq
RUN apt-get install -y rabbitmq-server

#install redis
RUN apt-get install -y redis-server

