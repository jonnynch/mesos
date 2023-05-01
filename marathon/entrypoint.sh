#!/bin/sh
dockerd  &
/opt/zookeeper/bin/zkServer.sh start
# mesos-master --work_dir=/var/lib/mesos --advertise_ip=127.0.0.1 --no-hostname_lookup --ip=127.0.0.1  > /var/log/mesos-master.log 2>&1 &
mesos-master --work_dir=/var/lib/mesos --advertise_ip=127.0.0.1 --hostname=mesos-master.localdev.me  > /var/log/mesos-master.log 2>&1 &
# mesos-slave --work_dir=/var/lib/mesos --master=localhost:5050 --containerizers=docker,mesos --no-hostname_lookup --ip=127.0.0.1 > /var/log/mesos-slave.log 2>&1 &
mesos-slave --work_dir=/var/lib/mesos --master=mesos-master.localdev.me:5050 --containerizers=docker,mesos --hostname=mesos-slave.localdev.me > /var/log/mesos-slave.log 2>&1 &
/usr/share/marathon/bin/marathon --master=mesos-master.localdev.me:5050 --disable_ha --hostname=marathon.localdev.me  > /var/log/marathon.log 2>&1 