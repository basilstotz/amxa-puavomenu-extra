#
# Regular cron jobs for the amxa-puavomenu-extra package
#
0 4	* * *	root	[ -x /usr/bin/amxa-puavomenu-extra_maintenance ] && /usr/bin/amxa-puavomenu-extra_maintenance
