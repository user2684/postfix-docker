#!/bin/bash
set -e

# copy all the files of the /postfix mount into /etc/postfix
if [ "$(ls -A /postfix)" ]; then
	cp -f /postfix/* /etc/postfix/
fi

# start the application
if [ "$1" = 'postfix' ]; then
	touch /var/log/mail.log
	/etc/init.d/rsyslog start
	/etc/init.d/postfix start
	tail -F /var/log/mail.log
fi

exec "$@"
