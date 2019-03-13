FROM nginx:alpine

LABEL maintainer="Mathieu BRUNOT <mathieu.brunot at monogramm dot io>"

ENV FAIL2REST_ADDR=http://localhost:5000/ \
	FAIL2REST_USER=admin.fail2ban \
	FAIL2REST_PASSWD=youshouldoverwritethis \
	FAIL2REST_PASSWD_COST=15

COPY docker-entrypoint.sh /entrypoint.sh
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
ADD https://github.com/Sean-Der/fail2web/archive/master.tar.gz /tmp/fail2web.tar.gz

RUN set -ex; \
	# install the packages we need
	apk add --no-cache \
		apache2-utils \
		tar \
	; \
	# Get and install fail2web
	mkdir -p /var/www/html/; \
    tar xzf /tmp/fail2web.tar.gz -C /var/www/html/;  \
    rm -f /tmp/fail2web.tar.gz; \
	# Make sure the entrypoint is executable
	chmod 755 /entrypoint.sh

VOLUME /srv/fail2web/ /var/www/html/fail2web

ENTRYPOINT ["/entrypoint.sh"]
