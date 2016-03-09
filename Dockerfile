FROM nodesource/trusty:5.7.1

#install lsb-release
RUN apt-get update && apt-get install -y lsb-release

#install rethinkdb
RUN source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | tee /etc/apt/sources.list.d/rethinkdb.list
RUN wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
RUN apt-get update
RUN apt-get install rethinkdb




