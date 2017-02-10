FROM debian:jessie

MAINTAINER Lukas Krueck <git@lukaskrueck.de>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm


RUN sudo su
RUN cd
RUN apt-get update
RUN apt-get upgrade -y
RUN cd /opt
RUN mkdir cryptomator
RUN cd cryptomator
RUN wget https://github.com/cryptomator/cli/releases/download/0.2.1/cryptomator-cli-0.2.1.jar
RUN cd
RUN apt-get install oracle-java8-jdk -y
RUN cp /tmp/local_policy.jar /usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/jre/lib/security/local_policy.jar
RUN cp /tmp/US_export_policy.jar /usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/jre/lib/security/US_export_policy.jar
