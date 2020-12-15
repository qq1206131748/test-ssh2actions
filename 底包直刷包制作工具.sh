#本工具依赖于Termux。
#工具制作By rm-rf/*
  af=$(pwd)
  cd ~
  if [ ! -d /sdcard/工作目录 ];then
  mkdir /sdcard/工作目录
  mkdir /sdcard/工作目录/未完成
  mkdir /sdcard/工作目录/未完成/底包
  mkdir /sdcard/工作目录/未完成/直刷包
  mkdir /sdcard/工作目录/已完成
  mkdir /sdcard/工作目录/已完成/底包
  mkdir /sdcard/工作目录/已完成/直刷包
  mkdir /sdcard/工作目录/Br
  mkdir /sdcard/工作目录/DAT
  mkdir /sdcard/工作目录/IMG
  fi
  
  echo "\033[32m
****************************************************
***欢迎使用底包&直刷包制作工具v2.5****
***作者:rm-rf/****
***作者QQ:3586563103****
***注意！本工具依赖于Termux****
*****************************************************\033[0m"
  echo "工具选项:
         1.红米8/8a制作底包&直刷包
         2.红米7/7a制作底包&直刷包
         3.转换system
         4.转换vendor
         5.清理工作目录
         6.退出
         "
  read -p "请选择: " xz
#红米8/8a制作底包&直刷包
if [ $xz = '1' ];then
  echo "
1.制作底包
2.制作直刷包
3.返回"
  read -p "请选择: " ba
#1
  if [ $ba = '1' ];then
  if [ ! -d /sdcard/工作目录/未完成/底包 ];then
  mkdir /sdcard/工作目录/未完成/底包
  fi  
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  
  if [ $Initialization = 'y' ];then
  pkg install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  else
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "已取消，按任意键返回" make
  cd $af
  clear
  sh $0 
  exit 
  fi
  pkg install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  fi

if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。\033[0m"
  rm -rf ~/python
  exit
  fi

  
  if [ ! -d /sdcard/工作目录/未完成/底包/META-INF ];then
  cp -r ~/python/底包/* /sdcard/工作目录/未完成/底包
  fi
  
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的boot.img、vendor.img放到/sdcard/工作目录/未完成/底包里,按任意键继续 " make
   echo "正在制作底包"   
   if [ ! -f /sdcard/工作目录/未完成/底包/vendor.img ];then
   echo "\033[31m底包制作失败！请确认是否已把boot.img、vendor.img移动到/sdcard/工作目录/未完成/底包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi
   read -p "请输入底包vendor的大小（8:1536M，8A:1024M 不用带单位，或者按回车使用默认大小:1024M）: " vsize
   if [ $vsize ];then
   e2fsck -fy /sdcard/工作目录/未完成/底包/vendor.img
   resize2fs -f /sdcard/工作目录/未完成/底包/vendor.img ${vsize}m
   else
   e2fsck -fy /sdcard/工作目录/未完成/底包/vendor.img
   resize2fs -f /sdcard/工作目录/未完成/底包/vendor.img 1536m   
   resize2fs -f /sdcard/工作目录/未完成/底包/vendor.img 1024m
   fi
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"
   read -p "如需定制刷入文字请修改未完成/底包里的updater-script文件，按任意键继续: " db
   read -p "请输入底包包名（不带后缀）: " vcompression
   if [ $vcompression ];then
   echo "正在压缩底包"
   cd /sdcard/工作目录/未完成/底包
   zip -r /sdcard/工作目录/已完成/底包/$vcompression.zip ./*
   else
   echo "正在压缩底包"
   cd /sdcard/工作目录/未完成/底包
   zip -r /sdcard/工作目录/已完成/底包/我的底包.zip ./*
   fi
   echo "\033[32m底包制作完成！\033[0m"
   cd ~
   read -p "底包已制作完成，是否把底包移到/sdcard并清理工作目录？(y/n): " drm
   if [ $drm = "y" ];then
   mv /sdcard/工作目录/已完成/底包/*.zip /sdcard
   rm -rf /sdcard/工作目录/未完成/底包
   else
   if [ $drm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   mv /sdcard/工作目录/已完成/底包/*.zip /sdcard
   rm -rf /sdcard/工作目录/未完成/底包
   fi
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   fi
 
#2
if [ $ba = '2' ];then 
  if [ ! -d /sdcard/工作目录/未完成/直刷包 ];then
  mkdir /sdcard/工作目录/未完成/直刷包  
  fi
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  
  if [ $Initialization = 'y' ];then
  pkg install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  else
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "按任意键返回" make
  cd $af
  clear
  sh $0 
  exit  
  fi
  pkg install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  fi

if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。\033[0m"
  rm -rf ~/python
  exit
  fi

  
  if [ ! -d /sdcard/工作目录/未完成/直刷包/META-INF ];then
  cp -r ~/python/直刷包/* /sdcard/工作目录/未完成/直刷包
  fi
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的system.img放到/sdcard/工作目录/未完成/直刷包里,按任意键继续 " make
   echo "正在制作直刷包"   
   echo "\033[33mps：直刷包的大小必须小于2G，否则twrp刷不进去。\033[0m"
   if [ ! -f /sdcard/工作目录/未完成/直刷包/system.img ];then
   echo "\033[31m直刷包制作失败！请确认是否已把system.img移动到/sdcard/工作目录/未完成/直刷包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   read -p "请输入直刷包system的大小（8:4608M，8A:4096M 不用带单位，或者按回车使用默认大小:4096M）: " ssize
   if [ $ssize ];then
   e2fsck -fy /sdcard/工作目录/未完成/直刷包/system.img
   resize2fs -f /sdcard/工作目录/未完成/直刷包/system.img ${ssize}m
   else
   e2fsck -fy /sdcard/工作目录/未完成/直刷包/system.img
   resize2fs -f /sdcard/工作目录/未完成/直刷包/system.img 4608m   
   resize2fs -f /sdcard/工作目录/未完成/直刷包/system.img 4096m
   fi
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"   
   read -p "如需定制刷入文字请修改未完成/直刷包里的updater-script文件，按任意键继续: " zsb
   echo "正在转换为dat"
   python ~/python/rimg2sdat.py /sdcard/工作目录/未完成/直刷包/system.img -o /sdcard/工作目录/未完成/直刷包 -v 4
   if [ ! -f /sdcard/工作目录/未完成/直刷包/system.new.dat ];then
   echo "\033[31m转换dat失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   echo "\033[32m转换完成！\033[0m"
   echo "正在转换为br"
   read -p "请选择br的压缩级别（ 0-11 数字越大br体积越小，压缩时间更长，或者按回车使用默认等级压缩:0）: " ysdj
   if [ $ysdj ];then
   brotli -q $ysdj /sdcard/工作目录/未完成/直刷包/system.new.dat -o /sdcard/工作目录/未完成/直刷包/system.new.dat.br
   else
   brotli -q 0 /sdcard/工作目录/未完成/直刷包/system.new.dat -o /sdcard/工作目录/未完成/直刷包/system.new.dat.br
   fi
   if [ ! -f /sdcard/工作目录/未完成/直刷包/system.new.dat.br ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   echo "\033[32mbr转换完成！\033[0m"
   rm -rf /sdcard/工作目录/未完成/直刷包/system.new.dat
   rm -rf /sdcard/工作目录/未完成/直刷包/system.img
   touch /sdcard/工作目录/未完成/直刷包/system.patch.dat
   read -p "请输入直刷包包名（不带后缀）: " scompression
   if [ $scompression ];then
   echo "正在压缩直刷包"
   cd /sdcard/工作目录/未完成/直刷包
   zip -r /sdcard/工作目录/已完成/直刷包/$scompression.zip ./*
   else
   echo "正在压缩直刷包"
   cd /sdcard/工作目录/未完成/直刷包
   zip -r /sdcard/工作目录/已完成/直刷包/我的直刷包.zip ./*
   fi
   echo "\033[32m直刷包已制作完成！\033[0m"
   cd ~
   read -p "直刷包已制作完成，是否把直刷包移到/sdcard并清理工作目录？(y/n): " zrm
   if [ $zrm = "y" ];then
   mv /sdcard/工作目录/已完成/直刷包/*.zip /sdcard
   rm -rf /sdcard/工作目录/未完成/直刷包
   else
   if [ $zrm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
   mv /sdcard/工作目录/已完成/直刷包/*.zip /sdcard
   rm -rf /sdcard/工作目录/未完成/直刷包   
   fi
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   fi
#3
   if [ $ba = '3' ];then
   cd $af
   clear
   sh $0
   fi

fi
#.红米7/7a制作底包&直刷包
if [ $xz = '2' ];then
  echo "
1.制作底包
2.制作直刷包
3.返回"
  read -p "请选择: " qa
#1
  if [ $qa = '1' ];then
  if [ ! -d /sdcard/工作目录/未完成/底包 ];then
  mkdir /sdcard/工作目录/未完成/底包
  fi  
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  
  if [ $Initialization = 'y' ];then
  pkg install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  else
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "按任意键返回" make
  cd $af
  clear
  sh $0   
  exit
  fi
  pkg install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  fi

if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。\033[0m"
  rm -rf ~/python
  exit
  fi

  
  if [ ! -d /sdcard/工作目录/未完成/底包/META-INF ];then
  cp -r ~/python/底包/* /sdcard/工作目录/未完成/底包
  fi
  
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的boot.img、vendor.img放到/sdcard/工作目录/未完成/底包里,按任意键继续 " make
   echo "正在制作底包"   
   if [ ! -f /sdcard/工作目录/未完成/底包/vendor.img ];then
   echo "\033[31m底包制作失败！请确认是否已把boot.img、vendor.img移动到/sdcard/工作目录/未完成/底包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   read -p "请输入底包vendor的大小（7:1024M，7A:1024M 不用带单位，或者按回车使用默认大小:1024M）: " vsize
   if [ $vsize ];then
   e2fsck -fy /sdcard/工作目录/未完成/底包/vendor.img
   resize2fs -f /sdcard/工作目录/未完成/底包/vendor.img ${vsize}m
   else
   e2fsck -fy /sdcard/工作目录/未完成/底包/vendor.img
   resize2fs -f /sdcard/工作目录/未完成/底包/vendor.img 1536m   
   resize2fs -f /sdcard/工作目录/未完成/底包/vendor.img 1024m
   fi
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"
   read -p "如需定制刷入文字请修改未完成/底包里的updater-script文件，按任意键继续: " db
   read -p "请输入底包包名（不带后缀）: " vcompression
   if [ $vcompression ];then
   echo "正在压缩底包"
   cd /sdcard/工作目录/未完成/底包
   zip -r /sdcard/工作目录/已完成/底包/$vcompression.zip ./*
   else
   echo "正在压缩底包"
   cd /sdcard/工作目录/未完成/底包
   zip -r /sdcard/工作目录/已完成/底包/我的底包.zip ./*
   fi
   echo "\033[32m底包制作完成！\033[0m"
   cd ~
   read -p "底包已制作完成，是否把底包移到/sdcard并清理工作目录？(y/n): " drm
   if [ $drm = "y" ];then
   mv /sdcard/工作目录/已完成/底包/*.zip /sdcard
   rm -rf /sdcard/工作目录/未完成/底包
   else
   if [ $drm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi
   mv /sdcard/工作目录/已完成/底包/*.zip /sdcard
   rm -rf /sdcard/工作目录/未完成/底包
   fi
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   fi
 
#2
if [ $qa = '2' ];then 
  if [ ! -d /sdcard/工作目录/未完成/直刷包 ];then
  mkdir /sdcard/工作目录/未完成/直刷包  
  fi
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  
  if [ $Initialization = 'y' ];then
  pkg install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  else
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "按任意键返回" make
  cd $af
  clear
  sh $0  
  exit 
  fi
  pkg install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  fi

if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。\033[0m"
  rm -rf ~/python
  exit
  fi

  
  if [ ! -d /sdcard/工作目录/未完成/直刷包/META-INF ];then
  cp -r ~/python/直刷包/* /sdcard/工作目录/未完成/直刷包
  fi
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的system.img放到/sdcard/工作目录/未完成/直刷包里,按任意键继续 " make
   echo "正在制作直刷包"   
   if [ ! -f /sdcard/工作目录/未完成/直刷包/system.img ];then
   echo "\033[31m直刷包制作失败！请确认是否已把system.img移动到/sdcard/工作目录/未完成/直刷包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
   read -p "请输入直刷包system的大小（7:3584M，7A:3072M 不用带单位，或者按回车使用默认大小:3584M）: " ssize
   if [ $ssize ];then
   e2fsck -fy /sdcard/工作目录/未完成/直刷包/system.img
   resize2fs -f /sdcard/工作目录/未完成/直刷包/system.img ${ssize}m
   else
   e2fsck -fy /sdcard/工作目录/未完成/直刷包/system.img
   resize2fs -f /sdcard/工作目录/未完成/直刷包/system.img 4096m   
   resize2fs -f /sdcard/工作目录/未完成/直刷包/system.img 3584m
   fi
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"   
   read -p "如需定制刷入文字请修改未完成/直刷包里的updater-script文件，按任意键继续: " zsb
   echo "正在转换为dat"
   python ~/python/rimg2sdat.py /sdcard/工作目录/未完成/直刷包/system.img -o /sdcard/工作目录/未完成/直刷包 -v 4
   if [ ! -f /sdcard/工作目录/未完成/直刷包/system.new.dat ];then
   echo "\033[31m转换dat失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   echo "\033[32m转换完成！\033[0m"
   echo "正在转换为br"
   read -p "请选择br的压缩级别（ 0-11 数字越大br体积越小，压缩时间更长，或者按回车使用默认等级压缩:0）: " ysdj
   if [ $ysdj ];then
   brotli -q $ysdj /sdcard/工作目录/未完成/直刷包/system.new.dat -o /sdcard/工作目录/未完成/直刷包/system.new.dat.br
   else
   brotli -q 0 /sdcard/工作目录/未完成/直刷包/system.new.dat -o /sdcard/工作目录/未完成/直刷包/system.new.dat.br
   fi
   if [ ! -f /sdcard/工作目录/未完成/直刷包/system.new.dat.br ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   echo "\033[32mbr转换完成！\033[0m"
   rm -rf /sdcard/工作目录/未完成/直刷包/system.new.dat
   rm -rf /sdcard/工作目录/未完成/直刷包/system.img
   touch /sdcard/工作目录/未完成/直刷包/system.patch.dat
   read -p "请输入直刷包包名（不带后缀）: " scompression
   if [ $scompression ];then
   echo "正在压缩直刷包"
   cd /sdcard/工作目录/未完成/直刷包
   zip -r /sdcard/工作目录/已完成/直刷包/$scompression.zip ./*
   else
   echo "正在压缩直刷包"
   cd /sdcard/工作目录/未完成/直刷包
   zip -r /sdcard/工作目录/已完成/直刷包/我的直刷包.zip ./*
   fi
   echo "\033[32m直刷包已制作完成！\033[0m"
   cd ~
   read -p "直刷包已制作完成，是否把直刷包移到/sdcard并清理工作目录？(y/n): " zrm
   if [ $zrm = "y" ];then
   mv /sdcard/工作目录/已完成/直刷包/*.zip /sdcard
   rm -rf /sdcard/工作目录/未完成/直刷包
   else
   if [ $zrm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
   mv /sdcard/工作目录/已完成/直刷包/*.zip /sdcard
   rm -rf /sdcard/工作目录/未完成/直刷包   
   fi
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   fi
#3
   if [ $qa = '3' ];then
   cd $af
   clear
   sh $0
   fi

fi

#转换system
if [ $xz = '3' ];then
   echo "
1.修改system(要root)
2.br转dat
3.dat转img
4.raw转sparse
5.sparse转raw
6.返回"
   read -p "请选择: " sys
#1
   if [ $sys = '1' ];then
   read -p "是否修改system.img?(y/n): " system
   if [ $system = 'y' ];then
   read -p "请将raw格式的system.img放到/sdcard/工作目录/未完成/直刷包里，按任意键继续: " me
   echo "\033[33m请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f /sdcard/工作目录/未完成/直刷包/system.img ];then
   echo "\\033[31m修改失败！请确认system.img是否已放到/sdcard/工作目录/未完成/直刷包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   su - oracle -c mount -o remount -rw /
   su - oracle -c mkdir /工作目录 /工作目录/system
   su - oracle -c losetup /dev/block/loop5 /sdcard/工作目录/未完成/直刷包/system.img
   su - oracle -c mount /dev/block/loop5 /工作目录/system
   echo "\033[32msystem.img已挂载到根目录/工作目录/system里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   su - oracle -c umount /工作目录/system
   su - oracle -c rm -rf /工作目录
   echo "\033[32m修改已完成！\033[0m"  
   read -p "system已修改完成，按任意键返回" make
   cd $af
   clear
   sh $0    
   exit        
   else
   if [ $system = 'n' ];then
   echo "\033[31m不修改\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   read -p "请将raw格式的system.img放到/sdcard/工作目录/未完成/直刷包里，按任意键继续: " me
   echo "\033[33m请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f /sdcard/工作目录/未完成/直刷包/system.img ];then
   echo "\\033[31m修改失败！请确认system.img是否已放到/sdcard/工作目录/未完成/直刷包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   su - oracle -c mount -o remount -rw /
   su - oracle -c mkdir /工作目录 /工作目录/system
   su - oracle -c losetup /dev/block/loop5 /sdcard/工作目录/未完成/直刷包/system.img
   su - oracle -c mount /dev/block/loop5 /工作目录/system
   echo "\033[32msystem.img已挂载到根目录/工作目录/system里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   su - oracle -c umount /工作目录/system
   su - oracle -c rm -rf /工作目录
   echo "\033[32m修改已完成！\033[0m"   
   fi
   read -p "system已修改完成，按任意键返回" make
   cd $af
   clear
   sh $0        
   fi   
#2
   if [ $sys = '2' ];then  
   if [ ! -d /sdcard/工作目录/Br ];then
   mkdir /sdcard/工作目录/Br
   fi
   if [ ! -d /sdcard/工作目录/DAT ];then
   mkdir /sdcard/工作目录/DAT
   fi
   read -p "请将system.new.dat.br文件放到/sdcard/工作目录/Br文件夹里，按任意键继续 " br
   echo "\033[32m正在转为dat…\033[0m"
   if [ ! -f /sdcard/工作目录/Br/system.new.dat.br ];then
   echo "\033[31m转换dat失败！，请确认system.new.dat.br文件是否已移动到/sdcard/工作目录/Br里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   brotli -d /sdcard/工作目录/Br/system.new.dat.br -o /sdcard/工作目录/DAT/system.new.dat
   echo "\033[32mdat已转换完成，生成到工作目录/DAT文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " zz
   if [ $zz = 'y' ];then
   rm -rf /sdcard/工作目录/Br/system.new.dat.br
   else
   if [ $zz = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   rm -rf /sdcard/工作目录/Br/system.new.dat.br
   fi
   read -p "br已转换完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   fi
#3
if [ $sys = '3' ];then
   if [ ! -d /sdcard/工作目录/DAT ];then
   mkdir /sdcard/工作目录/DAT
   fi
   if [ ! -d /sdcard/工作目录/IMG ];then
   mkdir /sdcard/工作目录/IMG
   fi
   if [ ! -f ~/python/sdat2img.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " a
   if [ $a = 'y' ];then
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   else
   if [ $a = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   fi     
   if [ ! -f ~/python/sdat2img.py ];then
   echo "\033[31m初始化失败！请重试。\033[0m"
   rm -rf ~/python
   exit
   fi 
   read -p "请将system.new.dat和system.transfer.list文件放到/sdcard/工作目录/DAT文件夹里，按任意键继续 " dat
   echo "\033[32m正在转为img…\033[0m"
   if [ ! -f /sdcard/工作目录/DAT/system.new.dat ];then
   echo "\033[31m转换img失败！，请确认system.new.dat是否已移动到/sdcard/工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi   
   python ~/python/sdat2img.py /sdcard/工作目录/DAT/system.transfer.list /sdcard/工作目录/DAT/system.new.dat /sdcard/工作目录/IMG/system.img
   if [ ! -f /sdcard/工作目录/DAT/system.transfer.list ];then
   echo "\033[31m转换img失败！，请确认system.transfer.list是否已移动到/sdcard/工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi      
   echo "\033[32mimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " cc
   if [ $cc = 'y' ];then
   rm -rf /sdcard/工作目录/DAT/system.new.dat
   rm -rf /sdcard/工作目录/DAT/system.transfer.list   
   else
   if [ $cc = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   rm -rf /sdcard/工作目录/DAT/system.new.dat
   rm -rf /sdcard/工作目录/DAT/system.transfer.list      
   fi
   read -p "dat已转换完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   fi
#4
if [ $sys = '4' ];then
   if [ ! -d /sdcard/工作目录/IMG ];then
   mkdir /sdcard/工作目录/IMG
   fi
   if [ ! -f ~/python/img2simg ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " c
   if [ $c = 'y' ];then
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   else
   if [ $c = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   fi     
   if [ ! -f ~/python/img2simg ];then
   echo "\033[31m初始化失败！请重试。\033[0m"
   rm -rf ~/python
   exit
   fi
   chmod 0755 ~/python/img2simg
   read -p "请将raw格式的system.img放到/sdcard/工作目录/IMG文件夹里，按任意键继续 " img
   echo "\033[32mrimg转为simg中\033[0m"
   if [ ! -f /sdcard/工作目录/IMG/system.img ];then
   echo "\033[31m转换simg失败！，请确认system.img是否为raw格式的和已移动到/sdcard/工作目录/IMG里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   mv /sdcard/工作目录/IMG/system.img /sdcard/工作目录/IMG/system.rimg
   ~/python/img2simg /sdcard/工作目录/IMG/system.rimg /sdcard/工作目录/IMG/system.img
   echo "\033[32msimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " bb
   if [ $bb = 'y' ];then
   rm -rf /sdcard/工作目录/IMG/system.rimg
   else
   if [ $bb = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   rm -rf /sdcard/工作目录/IMG/system.rimg
   fi
   read -p "rimg已转换完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   fi
#5
if [ $sys = '5' ];then
   if [ ! -d /sdcard/工作目录/IMG ];then
   mkdir /sdcard/工作目录/IMG
   fi
   if [ ! -f ~/python/simg2img ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " e
   if [ $e = 'y' ];then
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   else
   if [ $e = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   fi     
   if [ ! -f ~/python/simg2img ];then
   echo "\033[31m初始化失败！请重试。\033[0m"
   rm -rf ~/python
   exit
   fi
   su - oracle -c chmod 0755 ~/python/simg2img
   read -p "请将sparse格式的system.img放到/sdcard/工作目录/IMG文件夹里,按任意键继续 " img
   echo "\033[32msimg转为rimg中\033[0m"
   if [ ! -f /sdcard/工作目录/IMG/system.img ];then
   echo "\033[31m转换rimg失败！，请确认system.img是否为sparse格式的和已移动到/sdcard/工作目录/IMG中\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   mv /sdcard/工作目录/IMG/system.img /sdcard/工作目录/IMG/system.simg
   ~/python/simg2img /sdcard/工作目录/IMG/system.simg /sdcard/工作目录/IMG/system.img
   echo "\033[32mrimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " mm
   if [ $mm = 'y' ];then
   rm -rf /sdcard/工作目录/IMG/system.simg
   else
   if [ $mm = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   rm -rf /sdcard/工作目录/IMG/system.simg
   fi
   read -p "simg已转换完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   fi
#6
   if [ $sys = '6' ];then
   cd $af
   clear
   sh $0
   fi
fi
#转换vendor
if [ $xz = '4' ];then
   echo "
1.修改vendor
2.br转dat
3.dat转img
4.raw转sparse
5.sparse转raw
6.返回"
   read -p "请选择: " ven
   if [ $ven = '1' ];then
   read -p "是否修改vendor.img？(y/n): " vendor
   if [ $vendor = 'y' ];then
   read -p "请将raw格式的boot.img、vendor.img放到/sdcard/工作目录/未完成/底包里，按任意键继续: " me   
   echo "\033[33m请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f /sdcard/工作目录/未完成/底包/vendor.img ];then
   echo "\\033[31m修改失败！请确认vendor.img是否已放到/sdcard/工作目录/未完成/底包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   su - oracle -c mount -o remount -rw /
   su - oracle -c mkdir /工作目录 /工作目录/vendor
   su - oracle -c losetup /dev/block/loop4 /sdcard/工作目录/未完成/底包/vendor.img
   su - oracle -c mount /dev/block/loop4 /工作目录/vendor
   echo "\033[32mvendor.img已挂载到根目录/工作目录/vendor里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   su - oracle -c umount /工作目录/vendor
   su - oracle -c rm -rf /工作目录
   echo "\033[32m修改已完成！\033[0m"
   read -p "vendor已修改完成，按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
   else
   if [ $vendor = 'n' ];then
   echo "\033[31m不修改\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   read -p "请将raw格式的boot.img、vendor.img放到/sdcard/工作目录/未完成/底包里，按任意键继续: " me   
   echo "\033[33m请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f /sdcard/工作目录/未完成/底包/vendor.img ];then
   echo "\\033[31m修改失败！请确认vendor.img是否已放到/sdcard/工作目录/未完成/底包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   su - oracle -c mount -o remount -rw /
   su - oracle -c mkdir /工作目录 /工作目录/vendor
   su - oracle -c losetup /dev/block/loop4 /sdcard/工作目录/未完成/底包/vendor.img
   su - oracle -c mount /dev/block/loop4 /工作目录/vendor
   echo "\033[32mvendor.img已挂载到根目录/工作目录/vendor里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   su - oracle -c umount /工作目录/vendor
   su - oracle -c rm -rf /工作目录
   echo "\033[32m修改已完成！\033[0m"
   fi
   read -p "vendor已修改完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   fi
#2
if [ $ven = '2' ];then
   if [ ! -d /sdcard/工作目录/DAT ];then
   mkdir /sdcard/工作目录/DAT
   fi
   if [ ! -d /sdcard/工作目录/Br ];then
   mkdir /sdcard/工作目录/Br
   fi
   read -p "请将vendor.new.dat.br文件放到/sdcard/工作目录/Br文件夹里，按任意键继续 " br
   echo "\033[32m正在转为dat…\033[0m"
   if [ ! -f /sdcard/工作目录/Br/vendor.new.dat.br ];then
   echo "\033[31m转换dat失败！，请确认vendor.new.dat.br文件是否已移动到/sdcard/工作目录/Br里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   brotli -d /sdcard/工作目录/Br/vendor.new.dat.br -o /sdcard/工作目录/DAT/vendor.new.dat
   echo "\033[32mdat已转换完成，生成到工作目录/DAT文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " xx
   if [ $xx = 'y' ];then
   rm -rf /sdcard/工作目录/Br/vendor.new.dat.br
   else
   if [ $xx = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   rm -rf /sdcard/工作目录/Br/vendor.new.dat.br
   fi
   read -p "br已转换完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   fi
#3
if [ $ven = '3' ];then
   if [ ! -d /sdcard/工作目录/DAT ];then
   mkdir /sdcard/工作目录/DAT
   fi
   if [ ! -d /sdcard/工作目录/IMG ];then
   mkdir /sdcard/工作目录/IMG
   fi
   if [ ! -f ~/python/sdat2img.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " b
   if [ $b = 'y' ];then
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   else
   if [ $b = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   fi     
   
   if [ ! -f ~/python/sdat2img.py ];then
   echo "\033[31m初始化失败！请重试。\033[0m"
   rm -rf ~/python
   exit
   fi 

   read -p "请将vendor.new.dat和vendor.transfer.list文件放到/sdcard/工作目录/DAT文件夹里，按任意键继续 " dat
   echo "\033[32m正在转为img…\033[0m"
   if [ ! -f /sdcard/工作目录/DAT/vendor.new.dat ];then
   echo "\033[31m转换img失败！，请确认vendor.new.dat是否已移动到/sdcard/工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi   
   python ~/python/sdat2img.py /sdcard/工作目录/DAT/vendor.transfer.list /sdcard/工作目录/DAT/vendor.new.dat /sdcard/工作目录/IMG/vendor.img   
   if [ ! -f /sdcard/工作目录/DAT/vendor.transfer.list ];then
   echo "\033[31m转换img失败！，请确认vendor.transfer.list是否已移动到/sdcard/工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   echo "\033[32mimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " vv
   if [ $vv = 'y' ];then
   rm -rf /sdcard/工作目录/DAT/vendor.new.dat
   rm -rf /sdcard/工作目录/DAT/vendor.transfer.list      
   else
   if [ $vv = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   rm -rf /sdcard/工作目录/DAT/vendor.new.dat
   rm -rf /sdcard/工作目录/DAT/vendor.transfer.list      
   fi
   read -p "dat已转换完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   fi
#4
if [ $ven = '4' ];then
   if [ ! -d /sdcard/工作目录/IMG ];then
   mkdir /sdcard/工作目录/IMG
   fi
   if [ ! -f ~/python/img2simg ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " d
   if [ $d = 'y' ];then
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   else
   if [ $d = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   fi     
   
   if [ ! -f ~/python/img2simg ];then
   echo "\033[31m初始化失败！请重试。\033[0m"
   rm -rf ~/python
   exit
   fi
   chmod 0755 ~/python/img2simg
   read -p "请将raw格式的vendor.img放到/sdcard/工作目录/IMG文件夹里，按任意键继续 " img
   echo "\033[32mrimg转为simg中\033[0m"
   if [ ! -f /sdcard/工作目录/IMG/vendor.img ];then
   echo "\033[31m转换simg失败！，请确认vendor.img是否为raw格式的和已移动到/sdcard/工作目录/IMG里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   mv /sdcard/工作目录/IMG/vendor.img /sdcard/工作目录/IMG/vendor.rimg
   ~/python/img2simg /sdcard/工作目录/IMG/vendor.rimg /sdcard/工作目录/IMG/vendor.img
   echo "\033[32msimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " nn
   if [ $nn = 'y' ];then
   rm -rf /sdcard/工作目录/IMG/vendor.rimg
   else
   if [ $nn = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   rm -rf /sdcard/工作目录/IMG/vendor.rimg
   fi
   read -p "rimg已转换完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   fi
#5
if [ $ven = '5' ];then
   if [ ! -d /sdcard/工作目录/IMG ];then
   mkdir /sdcard/工作目录/IMG
   fi
   if [ ! -f ~/python/simg2img ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " f
   if [ $f = 'y' ];then
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   else
   if [ $f = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   pkg install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   fi     
   if [ ! -f ~/python/simg2img ];then
   echo "\033[31m初始化失败！请重试。\033[0m"
   rm -rf ~/python
   exit
   fi
   su - oracle -c chmod 0755 ~/python/simg2img
   read -p "请将sparse格式的vendor.img放到/sdcard/工作目录/IMG文件夹里,按任意键继续 " img
   echo "\033[32msimg转为rimg中\033[0m"
   if [ ! -f /sdcard/工作目录/IMG/vendor.img ];then
   echo "\033[31m转换rimg失败！，请确认vendor.img是否为sparse格式的和已移动到/sdcard/工作目录/IMG中\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   mv /sdcard/工作目录/IMG/vendor.img /sdcard/工作目录/IMG/vendor.simg
   ~/python/simg2img /sdcard/工作目录/IMG/vendor.simg /sdcard/工作目录/IMG/vendor.img
   echo "\033[32mrimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " qq
   if [ $qq = 'y' ];then
   rm -rf /sdcard/工作目录/IMG/vendor.simg
   else
   if [ $qq = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
   rm -rf /sdcard/工作目录/IMG/vendor.simg
   fi
   read -p "simg已转换完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   fi
#6
   if [ $ven = '6' ];then
   cd $af
   clear
   sh $0
   fi
   
fi
#清理工作目录
if [ $xz = '5' ];then
   read -p "清理工作目录,里面的文件将消失,是否继续？(y/n): " grm
   if [ $grm = 'y' ];then
   rm -rf /sdcard/工作目录
   else
   if [ $grm = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit   
   fi
   rm -rf /sdcard/工作目录
   fi
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0
fi
#退出
if [ $xz = '6' ];then
   exit
fi
