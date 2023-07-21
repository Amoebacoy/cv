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
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGREEN='\033[1;92m'      # GREEN
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICdyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGREEN='\033[0;92m'       # GREEN
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

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
IPVPS=$(curl -s ipinfo.io/ip )
export sem=$( curl -s https://raw.githubusercontent.com/Amoebacoy/cv/main/version)
clear
echo -e "\033[0;34m ${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m         °SCRIPT PREMIUM BY Aby&Fabumi°          \E[0m"
echo -e "\033[0;34m ${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\033[0;34m □ Server Uptime       :  $( uptime -p  | cut -d " " -f 2-10000 ) " 
echo -e "\033[0;34m • Current Time        :  $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "\033[0;34m □ Current Domain      :  ${BIPurple}( cat /etc/xray/domain )${NC}"
echo -e "\033[0;34m • Server IP           :  ${BIYellow}$IPVPS${NC}"
echo -e "\033[0;34m □ ISP                 :  $(cat /root/.isp)${NC}"
echo -e "\033[0;34m • Version             :  ${BIYellow}$sem${NC}"
echo -e "\033[0;34m □ Status Hari ini     :  ${BIPurple}(cat /root/status)${NC}"
echo -e "\033[0;34m ${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\033[0;34m ${GREEN}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "\033[0;34m│ $NC${GREEN} SSH ${NC}: $ressh"" ${BIWhite} NGINX ${NC}: $resngx"" ${BIWhite}  XRAY ${NC}: $resv2r"" ${BIWhite} TROJAN ${NC}: $resv2r\E[0m\033[0;34m      │"
echo -e "\033[0;34m│ $NC${GREEN}          DROPBEAR ${NC}: $resdbr" "${BIWhite} SSH-WS ${NC}: $ressshws \E[0m\033[0;34m               │"
echo -e "\033[0;34m ${GREEN}└─────────────────────────────────────────────────────┘${NC}"
echo -e "\033[0;34m ${GREEN}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "\033[0;34m ${GREEN}│  \033[0m ${BOLD}${YELLOW}SSH     VMESS       VLESS      TROJAN       SHADOWSOCKS$NC  $COLOR1"
echo -e "\033[0;34m ${GREEN}│  \033[0m ${Blue} $ssh1        $vma           $vla          $tra               $ssa   $NC"
echo -e "\033[0;34m ${GREEN}└─────────────────────────────────────────────────────┘${NC}"
echo -e "\033[0;34m ${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[39;1;92m                ⇱ MENU SERVICE ⇲                \E[0m"
echo -e "\033[0;34m ${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\033[0;34m  ${CYAN}[${BIWhite}01${BICyan}]${RED} •${NC} ${CYAN}SSH & OVPN MENU $NC  ${CYAN}[${BIWhite}06${BICyan}]${RED} • ${NC}${CYAN}MENU L2TP & PPTP [ IPSEC ]$NC"
echo -e "\033[0;34m  ${CYAN}[${BIWhite}02${BICyan}]${RED} •${NC} ${CYAN}VMESS MENU      $NC  ${CYAN}[${BIWhite}07${BICyan}]${RED} • ${NC}${CYAN}INFO RUNNING $NC"
echo -e "\033[0;34m  ${CYAN}[${BIWhite}03${BICyan}]${RED} •${NC} ${CYAN}VLESS MENU      $NC  ${CYAN}[${BIWhite}08${BICyan}]${RED} • ${NC}${CYAN}SSH UDP $NC"
echo -e "\033[0;34m  ${CYAN}[${BIWhite}04${BICyan}]${RED} •${NC} ${CYAN}TROJAN MENU     $NC  ${CYAN}[${BIWhite}09${BICyan}]${RED} • ${NC}${CYAN}SETTING $NC"
echo -e "\033[0;34m  ${CYAN}[${BIWhite}05${BICyan}]${RED} •${NC} ${CYAN}S-SOCK MENU     $NC  ${CYAN}[${BIWhite}10${BICyan}]${RED} • ${NC}${CYAN}TRIAL GENERATOR $NC" 
echo -e "\033[0;34m ${GREEN}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "\033[0;34m ${GREEN}│ ${BOLD}${LIGHT}Expired   = Lifetime                            ${NC}"
echo -e "\033[0;34m ${GREEN}│ ${BOLD}${LIGHT}Developer = Aby&Fabumi                         ${NC}"
echo -e "\033[0;34m ${GREEN}└─────────────────────────────────────────────────────┘${NC}"

echo
read -p " Select menu : " opt
echo -e "\033[0;34m ""
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
