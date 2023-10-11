# Mainsail version v2.8.0

## this version has a modification to enable the update manager and includes crowsnest
this version will replace the stock creality webportal and operate on port 80 so there is no need to add a port to the printer url
the web camera will also operate normally.


if you want to restore the default creality portal then use the uninstall command below and everything will be restored.



### Instruction

Put the mainsail folder on the root of a USB drive and plug it in to the printer.


Then using putty run the following commands


Copy the files ( mainsail.sh and mainsail.tar ) to directory ( /usr/data )<br>

```cp /tmp/udisk/sda1/mainsail/* /usr/data/```<br>

### Install <br>

```/usr/data/mainsail.sh install```<br>

### Uninstall <br>

```/usr/data/mainsail.sh unstall```<br>


