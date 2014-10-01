FROM sameersbn/debian:jessie.20141001
MAINTAINER sameer@damagehead.com

RUN apt-get update \
 && apt-get install -y memcached \
 && sed 's/^-d/# -d/' -i /etc/memcached.conf \
 && rm -rf /var/lib/apt/lists/* # 20140918

ADD start /start
RUN chmod 755 /start

EXPOSE 11211

CMD ["/start"]
