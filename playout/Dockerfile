FROM docker.pkg.github.com/hairmare/libretime/base

LABEL description="LibreTime pypo python playout container." \
      io.k8s.description="LibreTime pypo python playout container."

RUN yum install -y libretime-pypo

COPY docker-foreground /docker-foreground

CMD ["/docker-foreground"]
