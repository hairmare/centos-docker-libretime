FROM docker.pkg.github.com/hairmare/centos-docker-libretime/base

LABEL description="LibreTime pypo python playout container." \
      io.k8s.description="LibreTime pypo python playout container."

RUN yum install -y libretime-pypo

RUN mkdir -p \
    /var/log/airtime/{pypo-liquidsoap,pypo} \
    /var/lib/libretime/liquidsoap \
 && chown liquidsoap:liquidsoap \
    /var/log/airtime/{pypo-liquidsoap,pypo} \
    /var/lib/libretime/liquidsoap \
 && sed -i -e '2iset("server.telnet.bind_addr","0.0.0.0")' \
    /usr/lib64/python2.7/site-packages/liquidsoap/ls_script.liq \
 && sed -i -e "s@/etc/airtime/liquidsoap.cfg@/var/lib/libretime/liquidsoap/liquidsoap.cfg@" \
    /usr/lib64/python2.7/site-packages/liquidsoap/ls_script.liq \
    /usr/lib64/python2.7/site-packages/liquidsoap/generate_liquidsoap_cfg.py

COPY docker-foreground /docker-foreground

USER liquidsoap

CMD ["/docker-foreground"]
