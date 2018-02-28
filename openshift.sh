#! /bin/sh
oc new-project nodejs-todo-api
oc new-app centos/mongodb-32-centos7 -e MONGODB_USER=admin -e MONGODB_DATABASE=todoapi -e MONGODB_PASSWORD=secret -e MONGODB_ADMIN_PASSWORD=super-secret
#If needed, import stream for NodeJS 9
#oc create -f https://raw.githubusercontent.com/bucharest-gold/centos7-s2i-nodejs/master/image-streams.centos7.json
oc new-app bucharestgold/centos7-s2i-nodejs:9.x~https://github.com/kerdlix/nodejs-todo-api
oc set env dc/nodejs-todo-api MONGODB_URI='mongodb://admin:secret@mongodb-32-centos7:27017/todoapi'  PORT='8080' JWT_SECRET='J1239jUIUIDFJjkjkhhhj'
oc expose svc/nodejs-todo-api
