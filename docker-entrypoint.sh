#!/bin/sh
set -e

# Update the default config with environment variables
if [ -f /etc/nginx/conf.d/default.conf ]; then
	echo "fail2web nginx vhosts configuration initialization..."

	sed -i \
		-e "s|proxy_pass .*;|proxy_pass $FAIL2REST_ADDR;|g" \
		/etc/nginx/conf.d/default.conf

	echo "fail2web nginx vhosts configuration generated"
else
	echo "fail2web nginx vhosts configuration not found!"
	exit 1
fi

# Create the default htpasswd
if [ ! -f /srv/fail2web/.htpasswd ]; then
	echo "fail2web htpasswd initialization..."

	if [ -z "$FAIL2REST_PASSWD_COST" ]; then
		FAIL2REST_PASSWD_COST=15
	fi

	mkdir -p /srv/fail2web/
	htpasswd -Bbc -C $FAIL2REST_PASSWD_COST /srv/fail2web/.htpasswd "$FAIL2REST_USER" "$FAIL2REST_PASSWD"

	echo "fail2web htpasswd generated"
else
	echo "fail2web htpasswd found"
fi

echo "fail2web starting..."
nginx -g "daemon off;"
