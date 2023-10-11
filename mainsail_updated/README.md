# Mainsail version v2.8.0

## this version has a modification to enable the update manager and includes crowsnest



### Instruction

Put the mainsail folder on the root of a USB drive and plug it in to the printer.


Then using putty run the following commands


Copy the files ( mainsail.sh and mainsail.tar ) to directory ( /usr/data )<br>

```cp /tmp/udisk/sda1/mainsail/* /usr/data/```<br>

### Install <br>

```/usr/data/mainsail.sh install```<br>

### Uninstall <br>

```/usr/data/mainsail.sh unstall```<br>




To access the web portal go to the printers IP with port 4409<br>
eg, 192.168.1.1:4409<br>




To setup the webcam you need to modify the url snapshot with your printers ip

```http://PRINTERIP:8080/?action=snapshot```

<img src=https://github.com/DnG-Crafts/K1_Series_Annex/blob/main/mainsail_updated/cam.jpg>