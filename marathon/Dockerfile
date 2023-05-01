FROM centos:7
EXPOSE 5050 5051 8080 31000

ENV MESOS_SYSTEMD_ENABLE_SUPPORT false

COPY entrypoint.sh /entrypoint.sh

RUN rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-2.noarch.rpm && \
yum -y install mesos marathon wget net-tools yum-utils && \
yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo && \
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.1/apache-zookeeper-3.8.1-bin.tar.gz --no-check-certificate && \
tar xzf apache-zookeeper-*.tar.gz -C /opt && \
ln -s /opt/apache-zookeeper-*-bin /opt/zookeeper && \
chmod 755 /entrypoint.sh

COPY zoo.cfg /opt/zookeeper/conf/zoo.cfg

ENTRYPOINT [ "/entrypoint.sh" ]