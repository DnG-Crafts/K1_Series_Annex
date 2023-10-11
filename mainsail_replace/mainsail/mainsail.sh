#!/bin/sh

if [ "x$1" = "xinstall" ]; then
    cd /usr/data
    tar -xvf mainsail.tar 
    [ ! -e /etc/init.d/S50nginx ] && mv nginx/S50nginx /etc/init.d/
    [ ! -e /etc/init.d/S56moonraker_service ] && mv moonraker/S56moonraker_service /etc/init.d/
    /etc/init.d/S99start_app stop
	mv /usr/bin/web-server /usr/bin/dweb-server
	sed -i 's@\[ -x "$BIN_PATH/$WEB_SERVER@#\[ -x "$BIN_PATH/$WEB_SERVER@g'  /etc/init.d/S99start_app
	rm /usr/data/mainsail.tar
	echo "Install complete."
	echo "Rebooting..."
	reboot
	
elif [ "x$1" = "xunstall" ]; then
    /etc/init.d/S50nginx stop
    /etc/init.d/S56moonraker_service stop
    rm -rf /etc/init.d/S50nginx /etc/init.d/S56moonraker_service 
    rm -rf /usr/data/printer_data/config/moonraker.conf /usr/data/printer_data/config/.moonraker.conf.bkp /usr/data/nginx /usr/data/moonraker /usr/data/mainsail /usr/data/crowsnest
	/etc/init.d/S99start_app stop
	mv /usr/bin/dweb-server /usr/bin/web-server
	sed -i 's@#\[ -x "$BIN_PATH/$WEB_SERVER@\[ -x "$BIN_PATH/$WEB_SERVER@g'  /etc/init.d/S99start_app
	rm /usr/data/mainsail.sh
	echo "Uninstall complete."
	echo "Rebooting..."
	reboot
fi

