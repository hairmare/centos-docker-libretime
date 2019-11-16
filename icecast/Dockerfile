FROM docker.pkg.github.com/hairmare/libretime/base

LABEL description="LibreTime Icecast streaming server container." \
      io.k8s.description="LibreTime Icecast streaming server container."

RUN yum install -y \
    libretime-icecast

RUN sed -i -e 's@<bind-address>127.0.0.1</bind-address>@<bind-address>0.0.0.0</bind-address>@' /etc/icecast.xml

EXPOSE 8000

CMD ["/bin/icecast", "-c", "/etc/icecast.xml"]
