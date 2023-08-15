#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
sudo apt-get install figlet -y
sudo apt install ruby -y
gem install lolcat -y
apt install msmtp-mta ca-certificates bsd-mailx -y

read -rp "input your chat id Telegram:" nenen
echo "$nenen" >> /root/id

cd /usr/bin
wget -O mautobackup "https://raw.githubusercontent.com/Amoebacoy/cv/main/senmenu/autobackup.sh"
wget -O mbackup "https://raw.githubusercontent.com/Amoebacoy/cv/main/senmenu/backup.sh"
wget -O mrestore "https://raw.githubusercontent.com/Amoebacoy/cv/main/senmenu/restore.sh"
wget -O mlimitspeed "https://raw.githubusercontent.com/Amoebacoy/cv/main/senmenu/limitspeed.sh"
chmod +x mautobackup
chmod +x mbackup
chmod +x mrestore
chmod +x mlimitspeed
cd
rm -f /root/set-boba.sh
