FROM sameersbn/ubuntu:14.04.20150712
MAINTAINER sameer@damagehead.com

RUN apt-get update \
 && apt-get install -y memcached \
 && sed 's/^-d/# -d/' -i /etc/memcached.conf \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 11211
ENTRYPOINT ["/sbin/entrypoint.sh"]
