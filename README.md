
[uri_license]: http://www.gnu.org/licenses/agpl.html
[uri_license_image]: https://img.shields.io/badge/License-AGPL%20v3-blue.svg

[![License: AGPL v3][uri_license_image]][uri_license]
[![Build Status](https://travis-ci.org/Monogramm/docker-fail2web.svg)](https://travis-ci.org/Monogramm/docker-fail2web)
[![Docker Automated buid](https://img.shields.io/docker/cloud/build/monogramm/docker-fail2web.svg)](https://hub.docker.com/r/monogramm/docker-fail2web/)
[![Docker Pulls](https://img.shields.io/docker/pulls/monogramm/docker-fail2web.svg)](https://hub.docker.com/r/monogramm/docker-fail2web/)
[![](https://images.microbadger.com/badges/version/monogramm/docker-fail2web.svg)](https://microbadger.com/images/monogramm/docker-fail2web)
[![](https://images.microbadger.com/badges/image/monogramm/docker-fail2web.svg)](https://microbadger.com/images/monogramm/docker-fail2web)

# Docker image for fail2rest

This Docker repository provides the [fail2web](https://github.com/Sean-Der/fail2web) server with a configuration suitable to use with [fail2rest](https://github.com/Sean-Der/fail2rest).

:construction: **This is image and its resources are still in development!**

## Build Docker image

Install Docker and then run `docker build -t docker-fail2web .` to build the image.

## Auto configuration via environment variables

The fail2web image supports auto configuration via environment variables.


### FAIL2REST_ADDR

*Default value*: `http://localhost:5000/`

This parameter sets the local address of fail2rest.

Examples:
```
DOLI_AUTO_CONFIGURE='http://localhost:5000/'
DOLI_AUTO_CONFIGURE='http://127.0.0.1:5000/'
```


### FAIL2REST_USER

*Default value*: `admin.fail2ban`

This parameter sets the default htpasswd username. **Only used on first run.**

Examples:
```
DOLI_AUTO_CONFIGURE='admin'
DOLI_AUTO_CONFIGURE='root'
DOLI_AUTO_CONFIGURE='john.doe'
```


### FAIL2REST_PASSWD

*Default value*: `youshouldoverwritethis`

This parameter sets the default htpasswd password. **Only used on first run.**

Examples:
```
DOLI_AUTO_CONFIGURE=somethingverysecure
DOLI_AUTO_CONFIGURE=somethingrandomlygenerated
```


### FAIL2REST_PASSWD_COST

*Default value*: `15`

*Possible values*: from 4 to 31. Be careful of the computation time for anything higher than 10.

This parameter sets the default htpasswd bcrypt cost. **Only used on first run.**

Examples:
```
FAIL2REST_PASSWD_COST=4
FAIL2REST_PASSWD_COST=14
FAIL2REST_PASSWD_COST=31
```
