#!/bin/bash

#install
apt update && apt upgrade -y
apt install python3 python3-pip -y
apt install sqlite -y
wget https://raw.githubusercontent.com/Amoebacoy/cv/main/bot/cybervpn.zip
unzip cybervpn.zip
cd cybervpn
pip3 install -r requirements.txt

#isi data
echo "INSTALL BOT CREATE SSH via TELEGRAM"
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your Domain vps:" domain
read -e -p "[*] Input Your bot API:"  bot
echo -e BOT_TOKEN='"'$bot'"' >> /root/cybervpn/var.txt
echo "$bot" >> /root/bot
echo -e ADMIN='"'$admin'"' >> /root/cybervpn/var.txt
echo "$admin" >> /root/id
echo -e DOMAIN='"'$domain'"' >> /root/cybervpn/var.txt
echo -e HOST='"'ns.$domain'"' >> /root/cybervpn/var.txt
echo -e PUB='"7fbd1f8aa0abfe15a7903e837f78aba39cf61d36f183bd604daa2fe4ef3b7b59"' >> /root/cybervpn/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Api Token     : $bot"
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

wget -q -O /usr/bin/panelbot "https://raw.githubusercontent.com/Amoebacoy/cv/main/bot/panelbot.sh" && chmod +x /usr/bin/panelbot


wget -q -O /usr/bin/delvl "https://raw.githubusercontent.com/Amoebacoy/cv/main/bot/delvl.sh" && chmod +x /usr/bin/delvl

wget -q -O /usr/bin/advl "https://raw.githubusercontent.com/Amoebacoy/cv/main/bot/advl.sh" && chmod +x /usr/bin/advl


wget -q -O /usr/bin/delvm "https://raw.githubusercontent.com/Amoebacoy/cv/main/bot/delvm.sh" && chmod +x /usr/bin/delvm


wget -q -O /usr/bin/advm "https://raw.githubusercontent.com/Amoebacoy/cv/main/bot/advm.sh" && chmod +x /usr/bin/advm

wget -q -O /usr/bin/deltr "https://raw.githubusercontent.com/Amoebacoy/cv/main/bot/deltr.sh" && chmod +x /usr/bin/deltr

wget -q -O /usr/bin/adtr "https://raw.githubusercontent.com/Amoebacoy/cv/main/bot/adtr.sh" && chmod +x /usr/bin/adtr

wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Amoebacoy/cv/main/senmenu/menu.sh" && chmod +x /usr/bin/menu


echo " Installations complete, type /start or /menu on your bot https://t.me/Cyber301_bot"
chmod 777 /root/cybervpn
chmod 777 /root/cybervpn/database.db

rm -rf bot.sh
rm -rf memek.session
rm -rf cybervpn.zip
