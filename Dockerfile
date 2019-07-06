FROM ubuntu:bionic-20190612
LABEL maintainer="sameer@damagehead.com"

ENV MEMCACHED_USER=nobody \
    MEMCACHED_VERSION=1.5.6

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      memcached=${MEMCACHED_VERSION}* \
 && sed 's/^-d/# -d/' -i /etc/memcached.conf \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 11211/tcp 11211/udp
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/bin/memcached"]
