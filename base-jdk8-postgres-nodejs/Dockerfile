FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME "/usr/lib/jvm/java-8-oracle"


RUN apt-get update \
    && apt-get install -y python-software-properties  software-properties-common wget \
    && add-apt-repository ppa:webupd8team/java \
    && apt-get update \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections


RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    && apt-get update

RUN  apt-get install -y oracle-java8-installer oracle-java8-set-default xserver-xephyr xvfb sudo postgresql-9.6

RUN groupadd wheel \
    && mkdir /home/jenkins \
    && useradd -G wheel -u 996 -d /home/jenkins jenkins \
    && echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers \
    && chown jenkins:jenkins -R /home/jenkins