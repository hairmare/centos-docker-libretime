FROM docker.pkg.github.com/hairmare/libretime/base

LABEL description "LibreTime liquidsoap audio playout container." \
      io.k8s.description "LibreTime liquidsoap audio playout container."

RUN yum install -y \
    libretime-pypo \
    python-configobj

RUN mkdir -p /var/log/airtime/{pypo-liquidsoap,pypo} \
 && chown liquidsoap:liquidsoap /var/log/airtime/{pypo-liquidsoap,pypo}

RUN sed -i -e '2iset("server.telnet.bind_addr","0.0.0.0")' \
    /usr/lib64/python2.7/site-packages/liquidsoap/ls_script.liq

USER liquidsoap

EXPOSE 1234 8001 8002

CMD ["/bin/airtime-liquidsoap"]
