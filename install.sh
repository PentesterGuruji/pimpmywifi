#!/bin/bash

username=$(whoami)
if [ $username != "root" ];then
  echo -e "\033[1m\033[31mPlease run this script as the user root try doing sudo bash install.sh"
  exit
fi

echo -e "\033[1m\033[34mUpdating \033[33mand \033[34mUpgrading\033[0m"
# apt-get update -y && apt-get upgrade -y
apt-get purge libpython2* -y && apt-get install python -y
echo -e "\033[1mReinstalling \033[31mpython2\033[0m"
apt-get install python2 -y
echo -e "\033[1mInstalling \033[31mpython2.7-dev, \033[31mlibssl-dev\033[0m, \033[31mzlib1g-dev\033[0m, and \033[31mlibpcap-dev\033[0m"
apt-get install python2.7-dev libssl-dev zlib1g-dev libpcap-dev -y
echo -e "\033[1mInstalling \033[31mlibpq-dev\033[0m"
apt-get install libpq-dev -y
echo -e "\033[1mInstalling \033[31msetuptools, \033[31mpsycopg2 \033[0mand \033[31mscapy\033[0m"
pip install setuptools psycopg2 scapy && apt-get install python-scapy -y


git="/usr/bin/git"
python="/usr/bin/python2"
piperror="/usr/bin/python2: No module named pip"
pip=$(python2 -m pip 2>&1)
nmap="/usr/bin/nmap"
hashcat="/usr/bin/hashcat"
bully="/usr/local/bin/bully"
hcxtools="/usr/bin/hcxeiutool"
hcxdumptools="/usr/bin/hcxdumptool"
pyrit="/usr/local/bin/pyrit"

echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for git"
sleep 3
if [ -x $git ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mgit\033[0m"
  apt-get install git -y
fi


echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for python2"
sleep 3
if [ -f $python ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mpython2\033[0m"
  apt-get install python2 -y
fi


echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for python2-pip"
sleep 3
if [ "$pip" != "$piperror" ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mpython2-pip\033[0m"
  curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
  python2 get-pip.py
fi


echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for nmap"
sleep 3
if [ -f $nmap ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mnmap\033[0m"
  apt-get install nmap -y
fi



echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for hashcat"
sleep 3
if [ -f $hashcat ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mhashcat\033[0m"
  apt-get install hashcat -y
fi

echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for bully"
sleep 3
if [ -f $bully ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mbully\033[0m"
  git clone https://github.com/aanarchyy/bully && cd bully && cd src/ && make && sudo make install && cd ../.. && rm -rf bully
fi

echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for hcxtools"
sleep 3
if [ -f $hcxtools ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mhcxtools\033[0m"
  apt-get install hcxtools -y
fi


echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for hcxdumptools"
sleep 3
if [ -f $hcxdumptools ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mhcxdumptools\033[0m"
  apt-get install hcxdumptools -y
fi

echo -e "\033[1m\033[34m[\033[31m+\033[34m] Checking for pyrit"
sleep 3
if [ -f $pyrit ];then
  echo -e "\033[1m\033[32mFound\033[0m"
else
  echo -e "\033[1m\033[31mNot Found\033[0m"
  echo -e "\033[1mInstalling \033[31mpyrit\033[0m"
  apt-get remove --purge pyrit && rm -r /usr/local/lib/python2.7/dist-packages/cpyrit/
  git clone https://github.com/JPaulMora/Pyrit
  sed -i "s/COMPILE_AESNI/COMPILE_AESNIX/" Pyrit/cpyrit/_cpyrit_cpu.c
  cd Pyrit && python2 setup.py clean && python2 setup.py build && python2 setup.py install
  cd .. && rm -rf Pyrit
fi



echo -e "\033[1m\033[31mInstallation finished\033[0m"
printf '\033]2; Installation finished\a'