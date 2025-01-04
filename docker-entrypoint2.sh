#!/bin/bash

mongod --config /etc/mongod.conf --fork --maxConns=1000
mongosh --eval "db.getSiblingDB('$MONGO_DBNAME').createUser({user: '$MONGO_USERNAME', pwd: '$MONGO_PASSWORD', roles: [ { role: 'dbAdmin', db: '$MONGO_DBNAME' } ]})"

exec /docker-entrypoint.sh $@
