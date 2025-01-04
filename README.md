# kytos
HackInSDN Kytos docker

There are two images being built here: 1) standard image based on amlight/kytos:latest with addition of hackinsdn/containment and hackinsdn/mirror Napps; 2) AllInOne image, which is pretty similar to the previous one but with addition of MongoDB to Kytos (one image with all we need).

To build those images:
```
docker build --no-cache --pull -t hackinsdn/kytos:latest .
docker build --no-cache --pull -t hackinsdn/kytos:allinone -f Dockerfile-allinone .
```

To run the standard version:
```
docker run -d --name mongo mongo:7.0
docker exec -it mongo mongo --eval 'db.getSiblingDB("kytos").createUser({user: "kytos", pwd: "kytos", roles: [ { role: "dbAdmin", db: "kytos" } ]})'
docker run -d --name kytos --link mongo -v /lib/modules:/lib/modules --privileged -e MONGO_DBNAME=kytos -e MONGO_USERNAME=kytos -e MONGO_PASSWORD=kytos -e MONGO_HOST_SEEDS=mongo:27017 hackinsdn/kytos:latest
```

To run the all-in-one version:
```
docker run -d --name kytos --privileged -v /lib/modules:/lib/modules -e MONGO_DBNAME=kytos -e MONGO_USERNAME=kytos -e MONGO_PASSWORD=kytos -e MONGO_HOST_SEEDS=127.0.0.1:27017 hackinsdn/kytos:allinone
```
