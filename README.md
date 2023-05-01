# mesos in docker
## build
```
# docker build -t mesos-master ./master
# docker build -t mesos-slave ./slave
docker build -t mesos-marathon ./marathon
```
## run
```
# docker run --rm -d --privileged -p 5050:5050 --name mesos-master mesos-master
# docker run --rm -d --privileged --name mesos-slave mesos-slave --work_dir=/var/lib/mesos --master=host.docker.internal:5050
docker run --rm -d --privileged -p 5050:5050 -p 5051:5051 -p 8080:8080 -p 31000:31000 --name mesos-marathon mesos-marathon
``` 
## deploy job
```
curl -X POST http://127.0.0.1:8080/v2/apps -d @frameworks/app.json -H "Content-type: application/json"
curl -X POST http://127.0.0.1:8080/v2/apps -d @frameworks/app2.json -H "Content-type: application/json"
```
For app2, you may need to manual `docker pull python:3` within mesos-marathon container to avoid timeout

## test app2
```
curl http://localhost:31000/
```