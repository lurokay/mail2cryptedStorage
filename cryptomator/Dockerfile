FROM debian:jessie

MAINTAINER Lukas Krueck <git@lukaskrueck.de>

RUN apt-get update && apt-get upgrade -y
RUN cd /opt
RUN mkdir cryptomator
RUN cd cryptomator
RUN wget https://github.com/cryptomator/cli/releases/download/0.2.1/cryptomator-cli-0.2.1.jar
