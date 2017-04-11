FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME "/usr/lib/jvm/java-8-oracle"


RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/ansible.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update  && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default ansible xserver-xephyr xvfb sudo postgresql

RUN groupadd wheel \
    && useradd -G wheel -u 996 jenkins \
    && echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers