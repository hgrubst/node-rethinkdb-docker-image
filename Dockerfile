FROM nodesource/trusty:5.7.1

#install rethinkdb
RUN echo "deb http://download.rethinkdb.com/apt trusty main" | tee /etc/apt/sources.list.d/rethinkdb.list
RUN curl https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
RUN apt-get update
RUN apt-get install -y rethinkdb

#unset NODE_ENV which otherwise defaults to production and prevents installation of dev dependencies
RUN unset NODE_ENV

