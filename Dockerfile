FROM ubuntu:latest

ENV BOTDIR /opt/bot

RUN apt-get update && \
  apt-get install -y wget vim && \
  wget -q -O - https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y git build-essential nodejs && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y python-software-properties python software-properties-common
RUN add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
RUN dpkg --add-architecture i386
RUN apt-get update

RUN apt-get install -y xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic redis-server

WORKDIR ${BOTDIR}
       
ENV HUBOT_PORT 8080
ENV PORT ${HUBOT_PORT}
EXPOSE ${HUBOT_PORT}

RUN npm install
RUN npm install --save hubot-hipchat

CMD /bin/sh ${BOTDIR}/hubot-run.sh
#CMD tail -f /dev/null
