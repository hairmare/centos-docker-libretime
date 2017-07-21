FROM centos:7

RUN releasePackageUrl=$(curl 'http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/' \
    | awk -F '"' '/"libretime-release.*rpm"/ {print $6}') \
 && yum install -y epel-release \
    "http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm" \
    "http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/${releasePackageUrl}"

RUN yum install -y libretime-pypo
RUN yum install -y python-configobj
RUN mkdir -p /var/log/airtime/{pypo-liquidsoap,pypo} \
 && chown liquidsoap:liquidsoap /var/log/airtime/{pypo-liquidsoap,pypo}

RUN sed -i -e '2iset("server.telnet.bind_addr","0.0.0.0")' \
    /usr/lib64/python2.7/site-packages/liquidsoap/ls_script.liq

USER liquidsoap

EXPOSE 1234 8001 8002

CMD ["/bin/airtime-liquidsoap"]
