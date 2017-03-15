/usr/bin/redis-server &
sleep 10; bin/hubot --adapter hipchat --name hubot &
wait

