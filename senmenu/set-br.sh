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
# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
# ==========================================
export SC=$( /usr/bin/mbackup )
if [ "${SC}" -ne 1 ]; then
echo -e "${INFO} Starting Replacing Script !"
rm -rf /usr/bin/mbackup
rm -rf /usr/bin/mautobackup
rm -rf /usr/bin/mrestore
rm -rf /usr/bin/mlimitspeed
fi
clear

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
sudo apt-get install figlet -y
sleep 3
clear
sudo apt install ruby -y
sleep 3
clear
sudo gem install lolcat
sleep 3
clear
apt install msmtp-mta ca-certificates bsd-mailx -y
sleep 3
clear
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
rm -f /root/set-br.sh
