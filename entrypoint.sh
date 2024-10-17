#!/bin/ash

# Secure entrypoint
chmod 600 /entrypoint.sh
mkdir /tmp/mongodb
mongod --noauth --dbpath /tmp/mongodb/ &
sleep 3
mongo heros --eval "db.createCollection('users')"
mongo heros --eval 'db.users.insert( { username: "admin", password: "admin"} )'
mongo heros --eval 'db.users.insert( { username: "duyhuynh", password: "user"} )'
/usr/bin/supervisord -c /etc/supervisord.conf
