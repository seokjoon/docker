#!/bin/bash

/usr/sbin/service php7.4-fpm start && nginx -g 'daemon off;' &
/usr/bin/supervisord