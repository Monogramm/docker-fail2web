#!/bin/sh
set -e

# Update the default config with environment variables
if [ -f /etc/nginx/nginx.conf ]; then
	echo "fail2web nginx configuration initialization..."

	sed -i \
		-e "s|proxy_pass .*;|proxy_pass $FAIL2REST_ADDR;|g" \
		/etc/nginx/nginx.conf

	echo "fail2web nginx configuration generated"
fi

# Create the default htpasswd
if [ ! -f /srv/fail2web/.htpasswd ]; then
	echo "fail2web htpasswd initialization..."

	mkdir -p /srv/fail2web/.htpasswd
	htpasswd -Bbc -C 10 /srv/fail2web/.htpasswd "$FAIL2REST_USER" "$FAIL2REST_PASSWD"

	echo "fail2web htpasswd generated"
fi

echo "fail2web starting..."
exec "$@"
