FROM ubuntu:latest

ENV BOTDIR /opt/bot

RUN apt-get update && \
  apt-get install -y wget vim && \
  wget -q -O - https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y git build-essential nodejs && \
  rm -rf /var/lib/apt/lists/* && \
  git clone --depth=1 https://github.com/nhoag/bot.git ${BOTDIR}

WORKDIR ${BOTDIR}

RUN npm install


ENV HUBOT_PORT 8080
ENV HUBOT_ADAPTER shell
ENV HUBOT_NAME hubotDojo
ENV PORT ${HUBOT_PORT}

EXPOSE ${HUBOT_PORT}

WORKDIR /opt/bot

#CMD bin/hubot
#CMD tail -f /dev/null

ADD dialogue.coffee ${BOTDIR}/scripts/example.coffee

ADD start.sh ${BOTDIR}/start.sh
RUN chmod +x ${BOTDIR}/start.sh

CMD ./start.sh
