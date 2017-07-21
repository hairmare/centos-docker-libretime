FROM centos:7

RUN releasePackageUrl=$(curl 'http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/' \
    | awk -F '"' '/"libretime-release.*rpm"/ {print $6}') \
 && yum install -y epel-release \
    "http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm" \
    "http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/${releasePackageUrl}"

RUN yum install -y libretime-celery

ENV RMQ_CONFIG_FILE /etc/airtime/rabbitmq-analyzer.ini

USER libretime-celery

CMD ["/bin/celery", "worker", "-A", "airtime-celery.tasks:celery", "--time-limit=300", "--concurrency=1", "--config=celeryconfig", "-l", "INFO"]
