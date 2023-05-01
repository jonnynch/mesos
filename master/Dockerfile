FROM ubuntu
EXPOSE 5050
RUN apt-get update && \
apt-get install -y curl gnupg software-properties-common libcurl4-nss-dev && \
curl https://www.aventer.biz/assets/support_aventer.asc | apt-key add - && \
add-apt-repository -y 'deb http://rpm.aventer.biz/Ubuntu/jammy jammy main' && \
apt-get install -y libcurl4-openssl-dev mesos && \
mkdir -p /var/lib/mesos
ENTRYPOINT ["mesos-master"]
CMD ["--work_dir=/var/lib/mesos"]