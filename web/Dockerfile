FROM centos:7

ENV APACHE_RUN_DIR=/tmp/libretime/apache/run \
    APACHE_LOCK_DIR=/tmp/libretime/apache/lock \
    APACHE_LOG_DIR=/tmp/libretime/apache/log

RUN releasePackageUrl=$(curl 'http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/' \
    | awk -F '"' '/"libretime-release.*rpm"/ {print $4}') \
 && yum install -y epel-release \
    "http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm" \
    "http://download.opensuse.org/repositories/home:/radiorabe:/airtime/CentOS_7/noarch/${releasePackageUrl}"

RUN yum install -y libretime-web

RUN rm /etc/httpd/conf.d/{userdir,welcome,autoindex}.conf \
 && mkdir -p /etc/airtime/ /var/log/airtime \
 && chown apache:apache /etc/airtime /var/log/airtime/ \
 && sed -i -E \
    -e 's@ErrorLog "logs/error_log"@ErrorLog "/dev/stderr"@' \
    -e 's@CustomLog "logs/access_log" combined@CustomLog "/dev/stdout" combined@' \
    -e 's/Require(.*)/#Require\1/' \
    -e 's/Listen 80/Listen 8080/' \
    /etc/httpd/conf/httpd.conf \
 && sed -i \
    -e 's@/var/lib/php/session@/tmp/session@' \
    /etc/httpd/conf.d/php.conf \
 && sed -i -E \
    -e 's/LoadModule (auth_d.*)/#LoadModule \1/' \
    -e 's/#LoadModule mod_authn_core/LoadModule mod_authn_core/' \
    /etc/httpd/conf.modules.d/00-base.conf

COPY apache-foreground /apache-foreground
COPY libretime.apache.conf /etc/httpd/conf.d/99-libretime.conf

USER apache

EXPOSE 8080

CMD ["/apache-foreground"]
