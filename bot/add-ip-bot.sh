#!/bin/bash
# // PROJECT XDXL STORE
url_izin="https://raw.githubusercontent.com/iclikmas/izin_satu/main/ip"
IP=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
  useexp=$(wget -qO- $url_izin | grep $IP | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $IP \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mWhatsapp${NC} wa.me/6281917110387"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
# Token iclikmas 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
TOKEN="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"
today=`date -d "0 days" +"%Y-%m-%d"`
git clone https://github.com/iclik/izin_satu.git /root/ipvps/ &> /dev/null
clear
echo -e ""
read -p "Input IP Address : " ip
CLIENT_EXISTS=$(grep -w $ip /root/ipvps/ip | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo "IP Already Exist !"
rm -rf /root/ipvps
exit 0
fi
name=SFVT-`</dev/urandom tr -dc A-Z0-9 | head -c4`
clear
read -p " Masukan waktu expired : " -e exp
exp2=`date -d "${exp} days" +"%Y-%m-%d"`
echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
cd /root/ipvps
git config --global user.email "alayawrada@gmail.com" &> /dev/null
git config --global user.name "iclikmas" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/iclikmas/izin_satu
git push -f https://${TOKEN}@github.com/iclikmas/izin_satu.git &> /dev/null
rm -rf /root/ipvps
clear
