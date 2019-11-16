FROM docker.pkg.github.com/hairmare/centos-docker-libretime/base

LABEL description="LibreTime setup container." \
      io.k8s.description="LibreTime setup container."

# We install libretime-web since it currently has the needed sql files
# TODO: split sql files into their own package on OBS
RUN yum install -y libretime-web postgresql

COPY libretime-init /usr/local/bin/libretime-init

RUN chmod +x /usr/local/bin/libretime-init

CMD ["/usr/local/bin/libretime-init"]
