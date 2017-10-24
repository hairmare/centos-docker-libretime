FROM centos:7

RUN releasePackageUrl=$(curl 'http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/' \
    | awk -F '"' '/"libretime-release.*rpm"/ {print $4}') \
 && yum install -y epel-release \
    "http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm" \
    "http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/${releasePackageUrl}"

RUN yum install -y libretime-icecast

RUN sed -i -e 's@<bind-address>127.0.0.1</bind-address>@<bind-address>0.0.0.0</bind-address>@' /etc/icecast.xml

EXPOSE 8000

CMD ["/bin/icecast", "-c", "/etc/icecast.xml"]
