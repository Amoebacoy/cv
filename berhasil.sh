clear

export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
export BOLD="\e[1m"

figlet -f 3d "installing ssh udp" | lolcat
echo "UDP SERVICE BY CYBERVPN" | lolcat
echo -e "${GREEN}proses instalasi sedang berjalan..!!"
sleep 1
clear
echo -e "${GREEN} MENDOWNLOAD ASET..!!!"
wget -q -O /usr/bin/addudp "https://raw.githubusercontent.com/Amoebacoy/cv/main/udp/addssh.sh"
wget -q -O /usr/bin/udp "https://raw.githubusercontent.com/Amoebacoy/cv/main/udp/menush.sh"
chmod 777 /usr/bin/addudp
chmod 777 /usr/bin/udp
clear

echo -e "${GREEN} MENDOWNLOAD CONFIG UDP"
sleep 1

wget -q -O install-udp https://raw.githubusercontent.com/Amoebacoy/cv/main/udp/install-udp.sh && chmod +x install-udp && ./install-udp 



