#!/usr/bin/sh
#网站删除检测脚本 by rm -rf /*[3586563103]
#************************************************
#在此输入你虚拟主机的ftp地址和用户名密码
ftp="23.224.53.118"
name="s4947674"
password="ztAM99mhIQ"
#**************************************************
apt install curlftpfs
mkdir work
curlftpfs ftp://$name:$password@$ftp work
cd work
mkdir 1
#ftp -n $ftp << EOF 
#passive
#user $name $password
#cd /wwwroot
#ls
#bye
#EOF