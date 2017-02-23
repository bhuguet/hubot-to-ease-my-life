# hubot-to-ease-my-life


docker build -t hubot .

docker run -d hubot

docker exec -ti ${CONTAINER_NAME} /opt/bot/bin/hubot

Notes:
- hubot-scripts.json ne sert plus
- external-scripts.json ne servirait pas non plus ? 
- installer hubot-skype-bot: https://www.npmjs.com/package/hubot-skype-bot et lancer ainsi: bin/hubot -a skype-bot
-

