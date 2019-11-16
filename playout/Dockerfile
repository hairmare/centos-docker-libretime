FROM docker.pkg.github.com/hairmare/centos-docker-libretime/base

LABEL description="LibreTime pypo python playout container." \
      io.k8s.description="LibreTime pypo python playout container."

RUN yum install -y libretime-pypo

COPY docker-foreground /docker-foreground

CMD ["/docker-foreground"]
