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
wget -q -O /usr/bin/addudp "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/Ssh%20udp%20menu/addssh.sh"
wget -q -O /usr/bin/udp "http://sgpx.cybervpn.site:81/Autoscript-by-azi-main/Ssh%20udp%20menu/menush.sh"
chmod 777 /usr/bin/addudp
chmod 777 /usr/bin/udp
clear

echo -e "${GREEN} MENDOWNLOAD CONFIG UDP"
sleep 1

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2" -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp 



