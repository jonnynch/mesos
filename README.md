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
