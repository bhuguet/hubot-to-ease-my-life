echo -e " \nUpdate hubot-jira and serialjiracreator"
npm install hubot-jira
cd tools/serialjiracreator
git pull --rebase origin master
cd -

/usr/bin/redis-server &
sleep 10; bin/hubot --adapter hipchat --name hubot &
wait

