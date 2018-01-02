FROM centos:7

LABEL maintainer "Lucas Bickel <hairmare@purplehaze.ch>"
LABEL maintainer.name "Lucas Bickel"
LABEL maintainer.email "hairmare@purplehaze.ch"
LABEL io.k8s.description "LibreTime Init-Container."

RUN releasePackageUrl=$(curl 'http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/' \
    | awk -F '"' '/"libretime-release.*rpm"/ {print $4}') \
 && yum install -y epel-release \
    "http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm" \
    "http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/${releasePackageUrl}"

# We install libretime-web since it currently has the needed sql files
# TODO: split sql files into their own package on OBS
RUN yum install -y libretime-web postgresql

COPY libretime-init /usr/local/bin/libretime-init

RUN chmod +x /usr/local/bin/libretime-init

CMD ["/usr/local/bin/libretime-init"]
