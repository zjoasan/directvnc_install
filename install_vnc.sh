#!/bin/bash
sudo apt-get update 2>&1 | dialog --title "Updating package database..." --infobox "\nPlease wait...\n" 11 70
sudo apt-get --show-progress -y install dialog directvnc  2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Installing dialog and directvnc" --gauge "\nPlease wait...\n" 11 70
wget -O install_vnc.zip https://github.com/zjoasan/directvnc_install/blob/master/install_vnc.zip?raw=true
unzip -q -o install_vnc.zip 
chmod +x /home/osmc/vnc-client/vnc_ip_server.sh 2>&1
chmod +x /home/osmc/vnc-client/vncstart2.sh 2>&1
chmod +x /home/osmc/vnc-client/vnc_watchdog.sh 2>&1
sudo cp -f /home/osmc/root/.directfbrc /root/
rm -r -f /home/osmc/root
rm -f install_vnc.zip 2>&1
xbmc-send -a "UpdateLocalAddons" >/dev/null
dialog --title "Installation finnished!" --msgbox "\nThank you for using my installer\n"  11 70
exit

