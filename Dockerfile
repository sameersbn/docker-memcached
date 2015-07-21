FROM sameersbn/ubuntu:14.04.20150712
MAINTAINER sameer@damagehead.com

RUN apt-get update \
 && apt-get install -y memcached \
 && sed 's/^-d/# -d/' -i /etc/memcached.conf \
 && rm -rf /var/lib/apt/lists/*

ADD start /start
RUN chmod 755 /start

EXPOSE 11211

CMD ["/start"]
