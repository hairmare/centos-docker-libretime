FROM docker.pkg.github.com/hairmare/centos-docker-libretime/base

LABEL description="LibreTime celery async task running container." \
      io.k8s.description="LibreTime celery async task running container."

RUN yum install -y \
    libretime-celery

ENV RMQ_CONFIG_FILE /etc/airtime/rabbitmq-analyzer.ini

USER libretime-celery

CMD ["/bin/celery", "worker", "-A", "airtime-celery.tasks:celery", "--time-limit=300", "--concurrency=1", "--config=celeryconfig", "-l", "INFO"]
