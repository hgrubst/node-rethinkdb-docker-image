FROM node:5.5-wheezy

#install lsb-release
RUN apt-get update && apt-get install -y lsb-release

#install rethinkdb
RUN echo "deb http://download.rethinkdb.com/apt `lsb_release -cs` main" | tee /etc/apt/sources.list.d/rethinkdb.list
RUN wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
RUN apt-get update
RUN apt-get install -y rethinkdb



