#!/bin/bash
# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
COLOR1='\033[0;35m'
COLOR2='\033[0;39m'
clear
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"

# status
rm -rf /root/status
wget -q -O /root/status "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/statushariini"

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${GREEN}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel5 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${GREEN}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${GREEN}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${GREEN}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${GREEN}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${GREEN}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"

clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m         °SCRIPT PREMIUM BY Aby&Fabumi°          \E[0m"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "□ Server Uptime       = $( uptime -p  | cut -d " " -f 2-10000 ) "
 
echo -e "• Current Time        = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "• Current Domain      = $( cat /etc/xray/domain )"
echo -e "• Server IP           = $MYIP"
echo -e "• ISP                 = $(cat /root/.isp)${NC}"
echo -e "• Server Resource     = RAM = $persenmemori% | CPU = $persencpu%"

echo -e "• Status Hari ini     = $(cat /root/status)${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"


echo -e ""
echo -e "$GREEN┌────────────────────────────────────────────────────┐${NC}"
echo -e "\033[0;34m│ $NC${BIWhite} SSH ${NC}: $ressh"" ${BIWhite} NGINX ${NC}: $resngx"" ${BIWhite}  XRAY ${NC}: $resv2r"" ${BIWhite} TROJAN ${NC}: $resv2r\E[0m\033[0;34m      │"
echo -e "\033[0;34m│ $NC${BIWhite}          DROPBEAR ${NC}: $resdbr" "${BIWhite} SSH-WS ${NC}: $ressshws \E[0m\033[0;34m               │"
echo -e "${GREEN}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  \033[0m ${BOLD}${YELLOW}SSH     VMESS       VLESS      TROJAN       SHADOWSOCKS$NC  $COLOR1"
echo -e "${GREEN}│  \033[0m ${Blue} $ssh1        $vma           $vla          $tra               $ssa   $NC"
echo -e "${GREEN}└──────────────────────────────────────────────────┘${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[39;1;92m                ⇱ MENU SERVICE ⇲                \E[0m"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}                    🦊V.3.0.0 LTS🦊"
echo -e ""
echo -e " ${CYAN}[${BIWhite}01${BICyan}]${RED} •${NC} ${CYAN}SSH & OVPN MENU $NC  ${CYAN}[${BIWhite}06${BICyan}]${RED} • ${NC}${CYAN}MENU L2TP & PPTP [ IPSEC ]$NC"
echo -e " ${CYAN}[${BIWhite}02${BICyan}]${RED} •${NC} ${CYAN}VMESS MENU      $NC  ${CYAN}[${BIWhite}07${BICyan}]${RED} • ${NC}${CYAN}INFO RUNNING $NC"
echo -e " ${CYAN}[${BIWhite}03${BICyan}]${RED} •${NC} ${CYAN}VLESS MENU      $NC  ${CYAN}[${BIWhite}08${BICyan}]${RED} • ${NC}${CYAN}SSH UDP $NC"
echo -e " ${CYAN}[${BIWhite}04${BICyan}]${RED} •${NC} ${CYAN}TROJAN MENU     $NC  ${CYAN}[${BIWhite}09${BICyan}]${RED} • ${NC}${CYAN}SETTING $NC"
echo -e " ${CYAN}[${BIWhite}05${BICyan}]${RED} •${NC} ${CYAN}S-SOCK MENU     $NC  ${CYAN}[${BIWhite}10${BICyan}]${RED} • ${NC}${CYAN}CEKING UPDATE  $NC" 
echo -e " ${GREEN}"
echo -e "${GREEN}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│ ${BOLD}${LIGHT}Client  = $Name                           ${NC}"
echo -e "${GREEN}│ ${BOLD}${LIGHT}Expired = Lifetime                            ${NC}"
echo -e "${GREEN}│ ${BOLD}${LIGHT}Developer = Aby&Fabumi                         ${NC}"

echo -e "${GREEN}└──────────────────────────────────────────────────┘${NC}"

echo
read -p " Select menu : " opt
echo -e ""
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; menu-ss ;;
06 | 6) clear ; menu-ipsec ;;
07 | 7) clear ; running ;;
08 | 8) clear ;  udp ;;
09 | 9) clear ; setting ;;
10 | 10) clear ; menu-trial ;;

100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
