FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME "/usr/lib/jvm/java-8-oracle"


RUN apt-get update \
    && apt-get install -y python-software-properties software-properties-common wget sudo nano libgtk2.0-0 libnss3 libnss3-dev libxi6 libgconf-2-4 unzip curl\
    && add-apt-repository ppa:webupd8team/java \
    && apt-get update \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    && apt-get update

RUN  apt-get install -y oracle-java8-installer oracle-java8-set-default xserver-xephyr xvfb

RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash - \
    && apt-get update && apt-get install -y nodejs

RUN wget -N http://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && chmod +x chromedriver \
    && sudo mv -f chromedriver /usr/local/share/chromedriver \
    && sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver \
    && sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
    && sudo apt-get update \
    && apt-get install -y libxpm4 libxrender1 \
    && apt-get install -y google-chrome-stable \
    && apt-get install -y gtk2-engines-pixbuf \
    && apt-get install -y xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable \
    && apt-get install -y imagemagick x11-apps

ENV PG_MAJOR 9.4
ENV PG_VERSION 9.4.11-1.pgdg80+1

RUN apt-get update \
    && apt-get install -y postgresql-common \
    && sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf \
    && apt-get install -y \
        postgresql-$PG_MAJOR \
        postgresql-contrib-$PG_MAJOR \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd wheel \
    && mkdir /home/jenkins \
    && useradd -G wheel -u 996 -d /home/jenkins jenkins \
    && echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers \
    && chown jenkins:jenkins -R /home/jenkins