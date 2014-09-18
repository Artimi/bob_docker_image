FROM ubuntu:12.04
MAINTAINER Petr Šebek <petrsebek1@gmail.com>

# Docker image with Bob repository
# Examples of usage:

# docker run -d 8888:8888 -v <<DIRECTORY_AT_HOST>:/data artimi/bob
# Runs Ipython notebook at localhost:8888 with bob installed. DIRECTORY_AT_HOST is mapped to /data in container

# docker run -ti -v <DIRECTORY_AT_HOST>:/data artimi/bob /bin/sh
# Runs container in interactive session and you can run Ipython or python scripts

RUN apt-get update

# for install add-apt-repository command
RUN apt-get -y install python-software-properties

# install bob
RUN add-apt-repository -y ppa:biometrics/bob
RUN apt-get update
RUN apt-get -y install bob

# install Ipython with dependencies
RUN apt-get -y install python-pip
RUN pip install -U ipython pyzmq jinja2 tornado

# create volume and make it cwd
VOLUME /data
WORKDIR /data

# port where is Ipython notebook
EXPOSE 8888

# default command open ipython notebook at port 8888
CMD ipython notebook --pylab=inline --no-browser --ip=0.0.0.0 --port 8888
