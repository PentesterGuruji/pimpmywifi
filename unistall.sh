#!/bin/bash

username=$(whoami)
if [ $username != "root"  ];then
	echo -e "\033[1m\033[31mPlease run this script as the user root try doing sudo bash uninstall.sh"
	exit
fi

echo -e "\033[1m\033[34mRemoving \033[31mgit\033[0m"
apt remove git --purge --autoremove -y
echo -e "\033[1m\033[34mRemoving \033[31mhcxtools\033[0m"
apt remove hcxtools --purge --autoremove -y
echo -e "\033[1m\033[34mRemoving \033[31mhcxdumptools\033[0m"
apt remove hcxdumptool  --purge --autoremove -y
echo -e "\033[1m\033[34mRemoving \033[31mpyrit\033[0m"
rm -r /usr/local/bin/pyrit && rm -r /usr/local/lib/python2.7/dist-packages/cpyrit/
echo -e "\033[1m\033[34mRemoving \033[31mbully\033[0m"
rm -r /usr/local/bin/bully

echo -e "\033[1m\033[34mSucessfully uninstalled!!"