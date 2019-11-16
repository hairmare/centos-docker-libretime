FROM docker.pkg.github.com/hairmare/centos-docker-libretime/base

LABEL description="LibreTime analyzer media file ingesting container." \
      io.k8s.description="LibreTime analyzer media file ingesting container."

RUN yum install -y \
    libretime-analyzer

USER libretime-analyzer

CMD ["/bin/airtime_analyzer"]
