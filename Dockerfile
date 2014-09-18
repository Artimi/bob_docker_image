FROM ubuntu:12.04
MAINTAINER Petr Šebek <petrsebek1@gmail.com>

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
