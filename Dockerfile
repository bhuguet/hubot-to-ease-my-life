FROM ubuntu:latest

ENV BOTDIR /opt/bot

RUN apt-get update && \
  apt-get install -y wget vim curl && \
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

# Make ssh dir
RUN mkdir -p /root/.ssh/

# Copy over private key, and set permissions
ADD id_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts && \
  ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
RUN mkdir -p ${BOTDIR}/tools
RUN git clone --depth=1 git@bitbucket.org:bhuguet/serialjiracreator.git ${BOTDIR}/tools/serialjiracreator
       
ENV HUBOT_PORT 8080
ENV PORT ${HUBOT_PORT}
EXPOSE ${HUBOT_PORT}

RUN npm install
RUN npm install --save hubot-hipchat
RUN npm install --save hubot-jira

#CMD /bin/sh ${BOTDIR}/hubot-run.sh
CMD tail -f /dev/null
