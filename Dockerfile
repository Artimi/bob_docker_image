FROM ubuntu:12.04
MAINTAINER Petr Šebek "petrsebek1@gmail.com"

RUN apt-get update
# for install add-apt-repository command
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:biometrics/bob
RUN apt-get update
RUN apt-get -y install bob
