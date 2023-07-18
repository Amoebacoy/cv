#!/bin/bash

#install
apt update && apt upgrade -y
apt install python3 python3-pip -y
apt install sqlite -y
wget http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/botssh/cybervpn.zip
unzip cybervpn.zip
cd cybervpn
pip3 install -r requirements.txt

#isi data
echo "INSTALL BOT CREATE SSH via TELEGRAM"
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your Domain vps:" domain
echo -e BOT_TOKEN='"6148468890:AAFCcJwajKdLDz_Z-IR2czwuoBfIGQ4DExM"' >> /root/cybervpn/var.txt
echo -e ADMIN='"'$admin'"' >> /root/cybervpn/var.txt
echo "$admin" >> /root/id
echo -e DOMAIN='"'$domain'"' >> /root/cybervpn/var.txt
echo -e HOST='"'ns.$domain'"' >> /root/cybervpn/var.txt
echo -e PUB='"7fbd1f8aa0abfe15a7903e837f78aba39cf61d36f183bd604daa2fe4ef3b7b59"' >> /root/cybervpn/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Api Token     : $bottoken"
echo "ID            : $admin"
echo "DOMAIN        : $domain"
echo "SLOWDNS HOST  : ns.$domain"
echo "PUBKEY        : 7fbd1f8aa0abfe15a7903e837f78aba39cf61d36f183bd604daa2fe4ef3b7b59"
echo -e "==============================="
echo "Setting done"

cat > /etc/systemd/system/cybervpn.service << END
[Unit]
Description=Simple CyberVPN - @CyberVPN
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m cybervpn
Restart=always

[Install]
WantedBy=multi-user.target

END
systemctl daemon-reload
systemctl start cybervpn
systemctl enable cybervpn

clear
echo "downloading asset"

wget -q -O /usr/bin/panelbot "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/botssh/panelbot.sh" && chmod +x /usr/bin/panelbot


wget -q -O /usr/bin/delvl "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/botssh/delvl.sh" && chmod +x /usr/bin/delvl

wget -q -O /usr/bin/advl "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/botssh/advl.sh" && chmod +x /usr/bin/advl


wget -q -O /usr/bin/delvm "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/botssh/delvm.sh" && chmod +x /usr/bin/delvm


wget -q -O /usr/bin/advm "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/botssh/advm.sh" && chmod +x /usr/bin/advm

wget -q -O /usr/bin/deltr "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/botssh/deltr.sh" && chmod +x /usr/bin/deltr

wget -q -O /usr/bin/adtr "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/botssh/adtr.sh" && chmod +x /usr/bin/adtr

wget -q -O /usr/bin/menu "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/menu.sh" && chmod +x /usr/bin/menu


echo " Installations complete, type /start or /menu on your bot https://t.me/Cyber301_bot"

rm -rf bot.sh
rm -rf cybervpn.zip
