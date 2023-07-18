#!/bin/bash
COLOR1='\033[0;35m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);


domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
  echo -e "$COLOR1│${NC}             • CREATE VLESS USER •              ${NC} $COLOR1│$NC"
  echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
  echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[0;41;36m             VLESS ACCOUNT           \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"

cat >/var/www/html/vless-$user.txt <<-END

# Format Vless WS TLS

- name: Vless-$user-WS TLS
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}

# Format Vless WS Non TLS

- name: Vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
  udp: true

# Format Vless gRPC (SNI)

- name: Vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
  grpc-service-name: vless-grpc
  udp: true

-------------------------------------------------------
              Link Akun Vless 
-------------------------------------------------------
Link TLS      : ${vlesslink1}
-------------------------------------------------------
Link none TLS : ${vlesslink2}
-------------------------------------------------------
Link GRPC     : ${vlesslink3}
-------------------------------------------------------


END
TEXT="
<code>────────────────────────</code>
<code>  🔰SUCCES CREAT AKUN VLESS🔰</code>
<code>────────────────────────</code>
<code>🔰Remarks      : ${user}</code>
<code>🔰Domain       : ${domain}</code>
<code>🔰Port TLS     : 443</code>
<code>🔰Port NTLS    : 80, 8080, 2086</code>
<code>🔰Port GRPC    : 443</code>
<code>🔰User ID      : ${uuid}</code>
<code>🔰AlterId      : 0</code>
<code>🔰Security     : auto</code>
<code>🔰Network      : WS or gRPC</code>
<code>🔰Path     : /vless</code>
<code>Path Dynamic : CF-XRAY:http://bug.com</code>
<code>───────────────────────</code>
<code>🔰Link TLS     :</code> 
<code>${vlesslink1}</code>
<code>───────────────────────</code>
<code>🔰Link NTLS    :</code> 
<code>${vlesslink2}</code>
<code>───────────────────────</code>
<code>🔰Link GRPC    :</code> 
<code>${vlesslink3}</code>
<code>───────────────────────</code>
<code>🔰Format OpenClash :</code> http://${domain}:81/vless-$user.txt
<code>───────────────────────</code>
<code>🔰Aktif Selama   : $masaaktif Hari</code>
<code>Berakhir Pada  : $exp</code>
<code>──────────────────────</code>
"
systemctl restart xray
systemctl restart nginx

DATADB=$(cat /root/akun/vless/.vless.conf | grep "^#&" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /root/akun/vless/.vless.conf
fi
echo "#& ${user} ${exp} ${uuid}" >>/root/akun/vless/.vless.conf

clear
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" 
echo -e "    Xray/Vless Account     \E[0m"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" 
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "port TLS    : 443"
echo -e "Port DNS    : 443"
echo -e "Port NTLS   : 80"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Path TLS    : /vless "
echo -e "ServiceName : vless-grpc"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" 
echo -e "Link TLS    : ${vlesslink1}"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" 
echo -e "Link NTLS   : ${vlesslink2}"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" 
echo -e "Link GRPC   : ${vlesslink3}"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" 
echo -e "Expired On : $exp"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" 
echo -e ""
curl -X POST "https://api.telegram.org/bot6148468890:AAFCcJwajKdLDz_Z-IR2czwuoBfIGQ4DExM/sendMessage" -d "chat_id=$(cat /root/id)&disable_web_page_preview=1&text=$TEXT&parse_mode=html" > /dev/null

systemctl restart cybervpn 

read -n 1 -s -r -p "Press any key to back on menu"

menu
