FROM ubuntu
ENV MESOS_SYSTEMD_ENABLE_SUPPORT false
RUN apt-get update && \
apt-get install -y curl gnupg software-properties-common libcurl4-nss-dev && \
curl https://www.aventer.biz/assets/support_aventer.asc | apt-key add - && \
add-apt-repository -y 'deb http://rpm.aventer.biz/Ubuntu/jammy jammy main' && \
apt-get install -y libcurl4-openssl-dev mesos && \
mkdir -p /var/lib/mesos
ENTRYPOINT ["mesos-slave"]
CMD ["--work_dir=/var/lib/mesos", "--master=host.docker.internal:5050"]