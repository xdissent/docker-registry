FROM ubuntu:quantal

ADD . /src

RUN apt-get update

RUN apt-get install -y python-virtualenv python-dev libevent-dev

ENV HOME /app

RUN /src/build.sh
