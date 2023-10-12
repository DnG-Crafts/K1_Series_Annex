#!/bin/sh

if [ "x$1" = "xinstall" ]; then
    cd /usr/data
    tar -xvf mainsail.tar 
    [ ! -e /etc/init.d/S50nginx ] && mv nginx/S50nginx /etc/init.d/
    [ ! -e /etc/init.d/S56moonraker_service ] && mv moonraker/S56moonraker_service /etc/init.d/
    /etc/init.d/S99start_app stop &>/dev/null
    /etc/init.d/S50nginx start
    /etc/init.d/S56moonraker_service start
    rm /usr/bin/Monitor
    mv /usr/data/repmon/modmon /usr/bin/Monitor
    sed -i 's@\[ -x "$BIN_PATH/$WEB_SERVER@#\[ -x "$BIN_PATH/$WEB_SERVER@g'  /etc/init.d/S99start_app
    /etc/init.d/S99start_app start &>/dev/null
    rm /usr/data/mainsail.tar
    echo "Install complete."
	
elif [ "x$1" = "xunstall" ]; then
    cd /overlay/upper
    /etc/init.d/S99start_app stop &>/dev/null
    /etc/init.d/S50nginx stop
    /etc/init.d/S56moonraker_service stop
    rm /usr/bin/Monitor
    mv /usr/data/repmon/orgmon /usr/bin/Monitor
    rm -rf /etc/init.d/S50nginx /etc/init.d/S56moonraker_service 
    rm -rf /usr/data/printer_data/config/moonraker.conf /usr/data/printer_data/config/.moonraker.conf.bkp /usr/data/nginx /usr/data/moonraker /usr/data/mainsail /usr/data/crowsnest /usr/data/repmon
    sed -i 's@#\[ -x "$BIN_PATH/$WEB_SERVER@\[ -x "$BIN_PATH/$WEB_SERVER@g'  /etc/init.d/S99start_app
    /etc/init.d/S99start_app start &>/dev/null
    rm /usr/data/mainsail.sh
    echo "Uninstall complete."

fi
