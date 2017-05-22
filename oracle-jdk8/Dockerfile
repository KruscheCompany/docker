FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME "/usr/lib/jvm/java-8-oracle"

RUN apt-get update \
    && apt-get install -y python-software-properties software-properties-common wget sudo nano libgtk2.0-0 libnss3 libnss3-dev libxi6 libgconf-2-4 unzip curl\
    && add-apt-repository ppa:webupd8team/java \
    && apt-get update \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get update \
    && apt-get install -y oracle-java8-installer oracle-java8-set-default

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8