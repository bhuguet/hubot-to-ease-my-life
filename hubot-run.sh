export HUBOT_ADAPTER="hubot-hipchat"

export HUBOT_HIPCHAT_JID="..."
export HUBOT_HIPCHAT_PASSWORD="..."
export HUBOT_HIPCHAT_ROOMS="..."
export HUBOT_LOG_LEVEL="debug"
#export HUBOT_HIPCHAT_XMPP_DOMAIN="btf.hipchat.com"

#/usr/bin/redis-server &
#/usr/bin/skype &
#sleep 10; bin/hubot -a skype --name $HUBOT_NAME &
#wait



/usr/bin/redis-server &
sleep 10; bin/hubot --adapter hipchat --name hubot &
wait

