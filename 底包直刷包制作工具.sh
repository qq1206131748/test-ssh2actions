#本工具依赖于Termux。
#linux可运行在ubuntu、debian。
#工具制作By rm-rf/*
  os=$(uname -o)
  root=$(id -u)
  af=$(pwd)
  bf=$(dirname $0) 
  if ( echo ${bf} |grep -q / );then
  .
  else 
  cd $af/$bf
  cf=$(pwd)
  bf=$cf
  fi
  if [ -b /dev/block/loop0 ];then
  if [ $os = 'Linux' ];then
  if [ $root = '0' ];then
  echo "\033[31m本工具在Android下不用root执行，请退出root后重试。\033[0m"
  exit
  fi
  echo "\033[32m运行环境:Android\033[0m"  
  fi  
 fi
if [ $os = 'Android' ];then
  if [ $root = '0' ];then
  echo "\033[31m本工具在Android下不用root执行，请退出root后重试。\033[0m"
  exit
  fi
  echo "\033[32m运行环境:Android\033[0m"  
fi
  if [ $os = 'GNU/Linux' ];then
  if [ $root -ne '0' ];then
  echo "\033[31m本工具运行要root，请切换到root用户后重试。\033[0m"
  exit
  fi
  echo "\033[32m运行环境:linux\033[0m"
fi
  cd ~
if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi   
  if [ $Initialization = 'y' ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  exit 
  fi
fi  
if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi
  if [ ! -d $bf/工作目录 ];then
  mkdir $bf/工作目录
  mkdir $bf/工作目录/Br
  mkdir $bf/工作目录/DAT
  mkdir $bf/工作目录/IMG
  fi
  if [ ! -d $bf/工作目录/未完成 ];then
  mkdir $bf/工作目录/未完成
  mkdir $bf/工作目录/未完成/底包
  mkdir $bf/工作目录/未完成/直刷包
  fi
  if [ ! -d $bf/工作目录/已完成 ];then
  mkdir $bf/工作目录/已完成
  mkdir $bf/工作目录/已完成/底包
  mkdir $bf/工作目录/已完成/直刷包
  fi      
  echo "\033[32m
****************************************************
***欢迎使用底包&直刷包制作工具v3.0****
***作者:rm-rf/****
***作者QQ:3586563103****
***目前制作底包和直刷包已支持红米8/A&7/A****
***Android注意！本工具依赖于Termux****
***linux可运行在ubuntu、debian****
*****************************************************\033[0m"
  echo "工具选项:
         1.制作底包&直刷包
         2.转换system
         3.转换vendor
         4.杂项        
         5.清理工作目录
         88.退出
         "
  read -p "请选择: " xz
  if [ -z $xz ];then
  exit
  fi
#制作底包&直刷包
if [ $xz = '1' ];then
  echo "1.红米8/8a制作底包&直刷包
2.红米7/7a制作底包&直刷包
3.返回"
  read -p "请选择: " qz  
  if [ -z $qz ];then
  exit
  fi  
#红米8/8a制作底包&直刷包
if [ $qz = '1' ];then
  echo "1.制作底包
2.制作直刷包
3.返回"
  read -p "请选择: " ba
  if [ -z $ba ];then
  exit
  fi  
#1
  if [ $ba = '1' ];then
  if [ ! -d $bf/工作目录/未完成/底包 ];then
  mkdir $bf/工作目录/未完成/底包
  fi  
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi     
  
  if [ $Initialization = 'y' ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "已取消，按任意键返回" make
  cd $af
  clear
  sh $0 
  exit 
  fi
  fi

if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi

  
  if [ ! -d $bf/工作目录/未完成/底包/META-INF ];then
  cp -r ~/python/底包/* $bf/工作目录/未完成/底包
  fi
  
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的boot.img、vendor.img放到工作目录/未完成/底包里,按任意键继续" make
   echo "正在制作底包"   
   if [ ! -f $bf/工作目录/未完成/底包/vendor.img ];then
   echo "\033[31m底包制作失败！请确认是否已把boot.img、vendor.img移动到工作目录/未完成/底包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi
   read -p "请输入底包vendor的大小（8:1536M，8A:1024M 不用带单位，或者按回车使用默认大小:1024M）: " vsize
   if [ $vsize ];then
   e2fsck -fy $bf/工作目录/未完成/底包/vendor.img
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img ${vsize}m
   else
   e2fsck -fy $bf/工作目录/未完成/底包/vendor.img
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img 1536m   
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img 1024m
   fi
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"
   read -p "如需定制刷入文字请修改未完成/底包里的updater-script文件，按任意键继续" db
   read -p "请输入底包包名（不带后缀）: " vcompression
   if [ $vcompression ];then
   echo "正在压缩底包"
   cd $bf/工作目录/未完成/底包
   zip -r $bf/工作目录/已完成/底包/$vcompression.zip ./*
   else
   echo "正在压缩底包"
   cd $bf/工作目录/未完成/底包
   zip -r $bf/工作目录/已完成/底包/我的底包.zip ./*
   fi
   echo "\033[32m底包制作完成！\033[0m"
   cd ~
   read -p "底包已制作完成，是否把底包移到脚本所在路径并清理工作目录？(y/n): " drm
   if [ -z $drm ];then
   mv $bf/工作目录/已完成/底包/*.zip $bf
   rm -rf $bf/工作目录/未完成/底包
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi   
   if [ $drm = "y" ];then
   mv $bf/工作目录/已完成/底包/*.zip $bf
   rm -rf $bf/工作目录/未完成/底包
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit      
   fi
   if [ $drm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   fi
 
#2
if [ $ba = '2' ];then 
  if [ ! -d $bf/工作目录/未完成/直刷包 ];then
  mkdir $bf/工作目录/未完成/直刷包  
  fi
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi  
  if [ $Initialization = 'y' ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "按任意键返回" make
  cd $af
  clear
  sh $0 
  exit  
  fi
fi

if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi

  
  if [ ! -d $bf/工作目录/未完成/直刷包/META-INF ];then
  cp -r ~/python/直刷包/* $bf/工作目录/未完成/直刷包
  fi
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的system.img放到工作目录/未完成/直刷包里,按任意键继续" make
   echo "正在制作直刷包"   
   echo "\033[33mps：直刷包的大小必须小于2G，否则twrp刷不进去。\033[0m"
   if [ ! -f $bf/工作目录/未完成/直刷包/system.img ];then
   echo "\033[31m直刷包制作失败！请确认是否已把system.img移动到工作目录/未完成/直刷包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   read -p "请输入直刷包system的大小（8:4608M，8A:4096M 不用带单位，或者按回车使用默认大小:4096M）: " ssize
   if [ $ssize ];then
   e2fsck -fy $bf/工作目录/未完成/直刷包/system.img
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img ${ssize}m
   else
   e2fsck -fy $bf/工作目录/未完成/直刷包/system.img
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img 4608m   
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img 4096m
   fi
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"   
   read -p "如需定制刷入文字请修改未完成/直刷包里的updater-script文件，按任意键继续" zsb
   echo "正在转换为dat"
   python ~/python/rimg2sdat.py $bf/工作目录/未完成/直刷包/system.img -o $bf/工作目录/未完成/直刷包 -v 4
   if [ ! -f $bf/工作目录/未完成/直刷包/system.new.dat ];then
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
   brotli -q $ysdj $bf/工作目录/未完成/直刷包/system.new.dat -o $bf/工作目录/未完成/直刷包/system.new.dat.br
   else
   brotli -q 0 $bf/工作目录/未完成/直刷包/system.new.dat -o $bf/工作目录/未完成/直刷包/system.new.dat.br
   fi
   if [ ! -f $bf/工作目录/未完成/直刷包/system.new.dat.br ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   echo "\033[32mbr转换完成！\033[0m"
   rm -rf $bf/工作目录/未完成/直刷包/system.new.dat
   rm -rf $bf/工作目录/未完成/直刷包/system.img
   touch $bf/工作目录/未完成/直刷包/system.patch.dat
   read -p "请输入直刷包包名（不带后缀）: " scompression
   if [ $scompression ];then
   echo "正在压缩直刷包"
   cd $bf/工作目录/未完成/直刷包
   zip -r $bf/工作目录/已完成/直刷包/$scompression.zip ./*
   else
   echo "正在压缩直刷包"
   cd $bf/工作目录/未完成/直刷包
   zip -r $bf/工作目录/已完成/直刷包/我的直刷包.zip ./*
   fi
   echo "\033[32m直刷包已制作完成！\033[0m"
   cd ~
   read -p "直刷包已制作完成，是否把直刷包移到脚本所在目录并清理工作目录？(y/n): " zrm
   if [ -z $zrm ];then
   mv $bf/工作目录/已完成/直刷包/*.zip $bf
   rm -rf $bf/工作目录/未完成/直刷包   
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi   
   if [ $zrm = "y" ];then
   mv $bf/工作目录/已完成/直刷包/*.zip $bf
   rm -rf $bf/工作目录/未完成/直刷包
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   if [ $zrm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
fi
#3
   if [ $ba = '3' ];then
   cd $af
   clear
   sh $0
   fi

fi
#.红米7/7a制作底包&直刷包
if [ $qz = '2' ];then
  echo "1.制作底包
2.制作直刷包
3.返回"
  read -p "请选择: " qa
  if [ -z $qa ];then
  exit
  fi
#1
if [ $qa = '1' ];then
  if [ ! -d $bf/工作目录/未完成/底包 ];then
  mkdir $bf/工作目录/未完成/底包
  fi  
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi    
  if [ $Initialization = 'y' ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "按任意键返回" make
  cd $af
  clear
  sh $0   
  exit
  fi
fi

if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi

  
  if [ ! -d $bf/工作目录/未完成/底包/META-INF ];then
  cp -r ~/python/底包/* $bf/工作目录/未完成/底包
  fi
  
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的boot.img、vendor.img放到工作目录/未完成/底包里,按任意键继续" make
   echo "正在制作底包"   
   if [ ! -f $bf/工作目录/未完成/底包/vendor.img ];then
   echo "\033[31m底包制作失败！请确认是否已把boot.img、vendor.img移动到工作目录/未完成/底包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   read -p "请输入底包vendor的大小（7:1024M，7A:1024M 不用带单位，或者按回车使用默认大小:1024M）: " vsize
   if [ $vsize ];then
   e2fsck -fy $bf/工作目录/未完成/底包/vendor.img
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img ${vsize}m
   else
   e2fsck -fy $bf/工作目录/未完成/底包/vendor.img
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img 1536m   
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img 1024m
   fi
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"
   read -p "如需定制刷入文字请修改未完成/底包里的updater-script文件，按任意键继续" db
   read -p "请输入底包包名（不带后缀）: " vcompression
   if [ $vcompression ];then
   echo "正在压缩底包"
   cd $bf/工作目录/未完成/底包
   zip -r $bf/工作目录/已完成/底包/$vcompression.zip ./*
   else
   echo "正在压缩底包"
   cd $bf/工作目录/未完成/底包
   zip -r $bf/工作目录/已完成/底包/我的底包.zip ./*
   fi
   echo "\033[32m底包制作完成！\033[0m"
   cd ~
   read -p "底包已制作完成，是否把底包移到脚本所在目录并清理工作目录？(y/n): " drm
   if [ -z $drm ];then
   mv $bf/工作目录/已完成/底包/*.zip $bf
   rm -rf $bf/工作目录/未完成/底包   
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   exit
   fi
   if [ $drm = "y" ];then
   mv $bf/工作目录/已完成/底包/*.zip $bf
   rm -rf $bf/工作目录/未完成/底包
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   exit   
   fi
   if [ $drm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi
 fi
 
#2
if [ $qa = '2' ];then 
  if [ ! -d $bf/工作目录/未完成/直刷包 ];then
  mkdir $bf/工作目录/未完成/直刷包  
  fi
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "初始化需要挂t，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi  
  if [ $Initialization = 'y' ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "按任意键返回" make
  cd $af
  clear
  sh $0  
  exit 
  fi
  fi

if [ ! -d ~/python/底包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
  rm -rf ~/python
  exit
  fi

  
  if [ ! -d $bf/工作目录/未完成/直刷包/META-INF ];then
  cp -r ~/python/直刷包/* $bf/工作目录/未完成/直刷包
  fi
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的system.img放到工作目录/未完成/直刷包里,按任意键继续" make
   echo "正在制作直刷包"   
   if [ ! -f $bf/工作目录/未完成/直刷包/system.img ];then
   echo "\033[31m直刷包制作失败！请确认是否已把system.img移动到工作目录/未完成/直刷包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
   read -p "请输入直刷包system的大小（7:3584M，7A:3072M 不用带单位，或者按回车使用默认大小:3584M）: " ssize
   if [ $ssize ];then
   e2fsck -fy $bf/工作目录/未完成/直刷包/system.img
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img ${ssize}m
   else
   e2fsck -fy $bf/工作目录/未完成/直刷包/system.img
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img 4096m   
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img 3584m
   fi
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"   
   read -p "如需定制刷入文字请修改未完成/直刷包里的updater-script文件，按任意键继续" zsb
   echo "正在转换为dat"
   python ~/python/rimg2sdat.py $bf/工作目录/未完成/直刷包/system.img -o $bf/工作目录/未完成/直刷包 -v 4
   if [ ! -f $bf/工作目录/未完成/直刷包/system.new.dat ];then
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
   brotli -q $ysdj $bf/工作目录/未完成/直刷包/system.new.dat -o $bf/工作目录/未完成/直刷包/system.new.dat.br
   else
   brotli -q 0 $bf/工作目录/未完成/直刷包/system.new.dat -o $bf/工作目录/未完成/直刷包/system.new.dat.br
   fi
   if [ ! -f $bf/工作目录/未完成/直刷包/system.new.dat.br ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   echo "\033[32mbr转换完成！\033[0m"
   rm -rf $bf/工作目录/未完成/直刷包/system.new.dat
   rm -rf $bf/工作目录/未完成/直刷包/system.img
   touch $bf/工作目录/未完成/直刷包/system.patch.dat
   read -p "请输入直刷包包名（不带后缀）: " scompression
   if [ $scompression ];then
   echo "正在压缩直刷包"
   cd $bf/工作目录/未完成/直刷包
   zip -r $bf/工作目录/已完成/直刷包/$scompression.zip ./*
   else
   echo "正在压缩直刷包"
   cd $bf/工作目录/未完成/直刷包
   zip -r $bf/工作目录/已完成/直刷包/我的直刷包.zip ./*
   fi
   echo "\033[32m直刷包已制作完成！\033[0m"
   cd ~
   read -p "直刷包已制作完成，是否把直刷包移到脚本所在目录并清理工作目录？(y/n): " zrm
   if [ -z $zrm ];then  
   mv $bf/工作目录/已完成/直刷包/*.zip $bf
   rm -rf $bf/工作目录/未完成/直刷包   
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   exit
   fi    
   if [ $zrm = "y" ];then
   mv $bf/工作目录/已完成/直刷包/*.zip $bf
   rm -rf $bf/工作目录/未完成/直刷包
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0      
   exit   
   fi
   if [ $zrm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
   fi
#3
   if [ $qa = '3' ];then
   cd $af
   clear
   sh $0
   fi

fi
#返回
if [ $qz = '3' ];then
   cd $af
   clear
   sh $0
   fi
fi
#转换system
if [ $xz = '2' ];then
   echo "1.br转dat
2.dat转img
3.raw转sparse
4.sparse转raw
5.返回"
   read -p "请选择: " sys
  if [ -z $sys ];then
  exit
  fi   
#1
   if [ $sys = '1' ];then  
   if [ ! -d $bf/工作目录/Br ];then
   mkdir $bf/工作目录/Br
   fi
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi
   read -p "请将system.new.dat.br文件放到工作目录/Br文件夹里，按任意键继续" br
   echo "\033[32m正在转为dat…\033[0m"
   if [ ! -f $bf/工作目录/Br/system.new.dat.br ];then
   echo "\033[31m转换dat失败！，请确认system.new.dat.br文件是否已移动到工作目录/Br里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   brotli -d $bf/工作目录/Br/system.new.dat.br -o $bf/工作目录/DAT/system.new.dat
   echo "\033[32mdat已转换完成，生成到工作目录/DAT文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " zz
   if [ -z $zz ];then
   rm -rf $bf/工作目录/Br/system.new.dat.br
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi   
   if [ $zz = 'y' ];then
   rm -rf $bf/工作目录/Br/system.new.dat.br
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit         
   fi
   if [ $zz = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi
#2
if [ $sys = '2' ];then
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/sdat2img.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " a
   if [ -z $a ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi   
   if [ $a = 'y' ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   if [ $a = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi     
   if [ ! -f ~/python/sdat2img.py ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
   rm -rf ~/python
   exit
   fi 
   read -p "请将system.new.dat和system.transfer.list文件放到工作目录/DAT文件夹里，按任意键继续" dat
   echo "\033[32m正在转为img…\033[0m"
   if [ ! -f $bf/工作目录/DAT/system.new.dat ];then
   echo "\033[31m转换img失败！，请确认system.new.dat是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi   
   python ~/python/sdat2img.py $bf/工作目录/DAT/system.transfer.list $bf/工作目录/DAT/system.new.dat $bf/工作目录/IMG/system.img
   if [ ! -f $bf/工作目录/DAT/system.transfer.list ];then
   echo "\033[31m转换img失败！，请确认system.transfer.list是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi      
   echo "\033[32mimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " cc
   if [ -z $cc ];then 
   rm -rf $bf/工作目录/DAT/system.new.dat
   rm -rf $bf/工作目录/DAT/system.transfer.list 
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi    
   if [ $cc = 'y' ];then
   rm -rf $bf/工作目录/DAT/system.new.dat
   rm -rf $bf/工作目录/DAT/system.transfer.list 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit     
   fi
   if [ $cc = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
 fi
#3
if [ $sys = '3' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/img2simg ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " c
   if [ -z $c ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi   
   if [ $c = 'y' ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   if [ $c = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
 fi     
   if [ ! -f ~/python/img2simg ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
   rm -rf ~/python
   exit
   fi
   chmod 0755 ~/python/img2simg
   read -p "请将raw格式的system.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32mrimg转为simg中\033[0m"
   if [ ! -f $bf/工作目录/IMG/system.img ];then
   echo "\033[31m转换simg失败！，请确认system.img是否为raw格式的和已移动到工作目录/IMG里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   mv $bf/工作目录/IMG/system.img $bf/工作目录/IMG/system.rimg
   ~/python/img2simg $bf/工作目录/IMG/system.rimg $bf/工作目录/IMG/system.img
   echo "\033[32msimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " bb
   if [ -z $bb ];then
   rm -rf $bf/工作目录/IMG/system.rimg
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0  
   exit    
   fi   
   if [ $bb = 'y' ];then
   rm -rf $bf/工作目录/IMG/system.rimg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit    
   fi
   if [ $bb = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
  fi
#4
if [ $sys = '4' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/simg2img ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " e
   if [ -z $e ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   if [ $e = 'y' ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   if [ $e = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi     
   if [ ! -f ~/python/simg2img ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
   rm -rf ~/python
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c chmod 0755 ~/python/simg2img
   fi
   if [ $os = 'GNU/Linux' ];then   
   chmod 0755 ~/python/simg2img
   fi
   read -p "请将sparse格式的system.img放到工作目录/IMG文件夹里,按任意键继续" img
   echo "\033[32msimg转为rimg中\033[0m"
   if [ ! -f $bf/工作目录/IMG/system.img ];then
   echo "\033[31m转换rimg失败！，请确认system.img是否为sparse格式的和已移动到工作目录/IMG中\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   mv $bf/工作目录/IMG/system.img $bf/工作目录/IMG/system.simg
   ~/python/simg2img $bf/工作目录/IMG/system.simg $bf/工作目录/IMG/system.img
   echo "\033[32mrimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " mm
   if [ -z $mm ];then
   rm -rf $bf/工作目录/IMG/system.simg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi      
   if [ $mm = 'y' ];then
   rm -rf $bf/工作目录/IMG/system.simg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi   
   if [ $mm = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
 fi
#5
   if [ $sys = '5' ];then
   cd $af
   clear
   sh $0
   fi
fi
#转换vendor
if [ $xz = '3' ];then
   echo "1.br转dat
2.dat转img
3.raw转sparse
4.sparse转raw
5.返回"
   read -p "请选择: " ven
   if [ -z $ven ];then
   exit
   fi   
#1
if [ $ven = '1' ];then
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi
   if [ ! -d $bf/工作目录/Br ];then
   mkdir $bf/工作目录/Br
   fi
   read -p "请将vendor.new.dat.br文件放到工作目录/Br文件夹里，按任意键继续" br
   echo "\033[32m正在转为dat…\033[0m"
   if [ ! -f $bf/工作目录/Br/vendor.new.dat.br ];then
   echo "\033[31m转换dat失败！，请确认vendor.new.dat.br文件是否已移动到工作目录/Br里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   brotli -d $bf/工作目录/Br/vendor.new.dat.br -o $bf/工作目录/DAT/vendor.new.dat
   echo "\033[32mdat已转换完成，生成到工作目录/DAT文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " xx
   if [ -z $xx ];then
   rm -rf $bf/工作目录/Br/vendor.new.dat.br
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   if [ $xx = 'y' ];then
   rm -rf $bf/工作目录/Br/vendor.new.dat.br
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   if [ $xx = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi
#2
if [ $ven = '2' ];then
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/sdat2img.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " b
  if [ -z $b ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
   if [ $b = 'y' ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   if [ $b = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi     
   
   if [ ! -f ~/python/sdat2img.py ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
   rm -rf ~/python
   exit
   fi 

   read -p "请将vendor.new.dat和vendor.transfer.list文件放到工作目录/DAT文件夹里，按任意键继续" dat
   echo "\033[32m正在转为img…\033[0m"
   if [ ! -f $bf/工作目录/DAT/vendor.new.dat ];then
   echo "\033[31m转换img失败！，请确认vendor.new.dat是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi   
   python ~/python/sdat2img.py $bf/工作目录/DAT/vendor.transfer.list $bf/工作目录/DAT/vendor.new.dat $bf/工作目录/IMG/vendor.img   
   if [ ! -f $bf/工作目录/DAT/vendor.transfer.list ];then
   echo "\033[31m转换img失败！，请确认vendor.transfer.list是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   echo "\033[32mimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " vv
   if [ -z $vv ];then
   rm -rf $bf/工作目录/DAT/vendor.new.dat
   rm -rf $bf/工作目录/DAT/vendor.transfer.list   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit       
   fi   
   if [ $vv = 'y' ];then
   rm -rf $bf/工作目录/DAT/vendor.new.dat
   rm -rf $bf/工作目录/DAT/vendor.transfer.list   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit       
   fi
   if [ $vv = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
  fi
#3
if [ $ven = '3' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/img2simg ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " d
  if [ -z $d ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
   if [ $d = 'y' ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   if [ $d = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi     
   
   if [ ! -f ~/python/img2simg ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
   rm -rf ~/python
   exit
   fi
   chmod 0755 ~/python/img2simg
   read -p "请将raw格式的vendor.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32mrimg转为simg中\033[0m"
   if [ ! -f $bf/工作目录/IMG/vendor.img ];then
   echo "\033[31m转换simg失败！，请确认vendor.img是否为raw格式的和已移动到工作目录/IMG里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   mv $bf/工作目录/IMG/vendor.img $bf/工作目录/IMG/vendor.rimg
   ~/python/img2simg $bf/工作目录/IMG/vendor.rimg $bf/工作目录/IMG/vendor.img
   echo "\033[32msimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " nn
   if [ -z $nn ];then  
   rm -rf $bf/工作目录/IMG/vendor.rimg
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi    
   if [ $nn = 'y' ];then
   rm -rf $bf/工作目录/IMG/vendor.rimg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   if [ $nn = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi
#1
if [ $ven = '4' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/simg2img ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "初始化需要挂t，是否继续？(y/n): " f
  if [ -z $f ];then
  apt install git python brotli e2fsprogs zip -y
  git clone https://github.com/yi985432/python
  fi
   if [ $f = 'y' ];then
   apt install git python brotli e2fsprogs zip -y
   git clone https://github.com/yi985432/python
   fi
   if [ $f = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
  fi     
   if [ ! -f ~/python/simg2img ];then
  echo "\033[31m初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个源再重试。
3.可能没有挂t。
\033[0m"
   rm -rf ~/python
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c chmod 0755 ~/python/simg2img
   fi
   if [ $os = 'GNU/Linux' ];then   
   chmod 0755 ~/python/simg2img
   fi 
   read -p "请将sparse格式的vendor.img放到工作目录/IMG文件夹里,按任意键继续" img
   echo "\033[32msimg转为rimg中\033[0m"
   if [ ! -f $bf/工作目录/IMG/vendor.img ];then
   echo "\033[31m转换rimg失败！，请确认vendor.img是否为sparse格式的和已移动到工作目录/IMG中\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   mv $bf/工作目录/IMG/vendor.img $bf/工作目录/IMG/vendor.simg
   ~/python/simg2img $bf/工作目录/IMG/vendor.simg $bf/工作目录/IMG/vendor.img
   echo "\033[32mrimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " qq
   if [ -z $qq ];then
   rm -rf $bf/工作目录/IMG/vendor.simg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
   fi   
   if [ $qq = 'y' ];then
   rm -rf $bf/工作目录/IMG/vendor.simg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
   fi
   if [ $qq = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
  fi
#5
   if [ $ven = '5' ];then
   cd $af
   clear
   sh $0
   fi
   
fi
#杂项
if [ $xz = '4' ];then
   echo "1.修改system(要root)
2.修改vendor(要root)
3.调整system.img的大小
4.调整vendor.img的大小
5.返回"
   read -p "请选择: " ab
  if [ -z $ab ];then
  exit
  fi   
#1
   if [ $ab = '1' ];then
   read -p "是否修改system.img?(y/n): " system
   if [ -z $system ];then
   if [ ! -d $bf/工作目录/未完成/直刷包 ];then
   mkdir $bf/工作目录/未完成/直刷包
   fi   
   read -p "请将raw格式的system.img放到工作目录/未完成/直刷包里，按任意键继续" me
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/工作目录/未完成/直刷包/system.img ];then
   echo "\\033[31m修改失败！请确认system.img是否已放到工作目录/未完成/直刷包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/system
   su -c losetup /dev/block/loop5 $bf/工作目录/未完成/直刷包/system.img
   su -c mount /dev/block/loop5 /工作目录/system
   fi
   if [ $os = 'GNU/Linux' ];then   
   mount -o remount -rw /
   mkdir /工作目录 /工作目录/system 
   losetup /dev/loop5 $bf/工作目录/未完成/直刷包/system.img
   mount /dev/loop5 /工作目录/system   
   fi
   echo "\033[32msystem.img已挂载到根目录/工作目录/system里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os = 'Android' ];then   
   su -c umount -fl /工作目录/system
   su -c rmdir  /工作目录/system /工作目录
   fi
   if [ $os = 'GNU/Linux' ];then   
   umount -fl /工作目录/system
   rmdir  /工作目录/system /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"  
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0    
   exit        
  fi
     
  if [ $system = 'y' ];then
   if [ ! -d $bf/工作目录/未完成/直刷包 ];then
   mkdir $bf/工作目录/未完成/直刷包
   fi   
   read -p "请将raw格式的system.img放到工作目录/未完成/直刷包里，按任意键继续:" me
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/工作目录/未完成/直刷包/system.img ];then
   echo "\\033[31m修改失败！请确认system.img是否已放到工作目录/未完成/直刷包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/system
   su -c losetup /dev/block/loop5 $bf/工作目录/未完成/直刷包/system.img
   su -c mount /dev/block/loop5 /工作目录/system
   fi
   if [ $os = 'GNU/Linux' ];then
   mount -o remount -rw /
   mkdir /工作目录 /工作目录/system 
   losetup /dev/loop5 $bf/工作目录/未完成/直刷包/system.img
   mount /dev/loop5 /工作目录/system   
   fi
   echo "\033[32msystem.img已挂载到根目录/工作目录/system里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os = 'Android' ];then   
   su -c umount -fl /工作目录/system
   su -c rmdir  /工作目录/system /工作目录
   fi
   if [ $os = 'GNU/Linux' ];then   
   umount -fl /工作目录/system
   rmdir  /工作目录/system /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"  
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0    
   exit        
  fi
   if [ $system = 'n' ];then
   echo "\033[31m不修改\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi   
#2
   if [ $ab = '2' ];then
   read -p "是否修改vendor.img？(y/n): " vendor
   if [ -z $vendor ];then
   if [ ! -d $bf/工作目录/未完成/底包 ];then
   mkdir $bf/工作目录/未完成/底包
   fi      
   read -p "请将raw格式的vendor.img放到工作目录/未完成/底包里，按任意键继续:" me   
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/工作目录/未完成/底包/vendor.img ];then
   echo "\\033[31m修改失败！请确认vendor.img是否已放到工作目录/未完成/底包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   if [ $os = 'Android' ];then
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/vendor   
   su -c losetup /dev/block/loop4 $bf/工作目录/未完成/底包/vendor.img
   su -c mount /dev/block/loop4 /工作目录/vendor
   fi
   if [ $os = 'GNU/Linux' ];then   
   mount -o remount -rw /
   mkdir /工作目录 /工作目录/vendor   
   losetup /dev/loop4 $bf/工作目录/未完成/底包/vendor.img
   mount /dev/loop4 /工作目录/vendor   
   fi
   echo "\033[32mvendor.img已挂载到根目录/工作目录/vendor里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os = 'Android' ];then
   su -c umount -fl /工作目录/vendor
   su -c rmdir  /工作目录/vendor /工作目录
   fi
   if [ $os = 'GNU/Linux' ];then   
   umount -fl /工作目录/vendor
   rmdir  /工作目录/vendor /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
  fi
      
   if [ $vendor = 'y' ];then
   if [ ! -d $bf/工作目录/未完成/底包 ];then
   mkdir $bf/工作目录/未完成/底包
   fi      
   read -p "请将raw格式的vendor.img放到工作目录/未完成/底包里，按任意键继续:" me   
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/工作目录/未完成/底包/vendor.img ];then
   echo "\\033[31m修改失败！请确认vendor.img是否已放到工作目录/未完成/底包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/vendor   
   su -c losetup /dev/block/loop4 $bf/工作目录/未完成/底包/vendor.img
   su -c mount /dev/block/loop4 /工作目录/vendor
   fi
   if [ $os = 'GNU/Linux' ];then   
   mount -o remount -rw /
   mkdir /工作目录 /工作目录/vendor   
   losetup /dev/loop4 $bf/工作目录/未完成/底包/vendor.img
   mount /dev/loop4 /工作目录/vendor   
   fi
   echo "\033[32mvendor.img已挂载到根目录/工作目录/vendor里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os = 'Android' ];then   
   su -c umount -fl /工作目录/vendor
   su -c rmdir  /工作目录/vendor /工作目录
   fi
   if [ $os = 'GNU/Linux' ];then   
   umount -fl /工作目录/vendor
   rmdir  /工作目录/vendor /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
   fi
   if [ $vendor = 'n' ];then
   echo "\033[31m不修改\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi
#3
if [ $ab = '3' ];then
   read -p "是否调整system.img的大小？(y/n):" tz
   if [ -z $tz ];then
   read -p "请将raw格式的system.img放到工作目录文件夹里,按任意键继续" make   
   if [ ! -f $bf/工作目录/system.img ];then
   echo "\033[31m未检测到system.img，请确认system.img是否已放到工作目录里。\033[0m"
   read -p "按任意键返回" make   
   cd $af
   clear
   sh $0     
   exit
   fi
   read -p "请输入要调整system.img的大小(不用带单位):" vt
   e2fsck -fy $bf/工作目录/system.img
   resize2fs -f $bf/工作目录/system.img ${vt}m
   echo "\033[32m已调整，请检查img文件的大小是否和输入的数值一致。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $tz = 'n' ];then
   echo "\033[31m不调整\033[0m"   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
 fi   
   if [ $tz = 'y' ];then
   read -p "请将raw格式的system.img放到工作目录文件夹里,按任意键继续" make   
   if [ ! -f $bf/工作目录/system.img ];then
   echo "\033[31m未检测到system.img，请确认system.img是否已放到工作目录里。\033[0m"
   read -p "按任意键返回" make   
   cd $af
   clear
   sh $0     
   exit
   fi
   read -p "请输入要调整system.img的大小(不用带单位):" vt
   e2fsck -fy $bf/工作目录/system.img
   resize2fs -f $bf/工作目录/system.img ${vt}m
   echo "\033[32m已调整，请检查img文件的大小是否和输入的数值一致。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $tz = 'n' ];then
   echo "\033[31m不调整\033[0m"   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi   
fi      
#4
if [ $ab = '4' ];then
   read -p "是否调整vendor.img的大小？(y/n):" tz
   if [ -z $tz ];then
   read -p "请将raw格式的vendor.img放到工作目录文件夹里,按任意键继续" make   
   if [ ! -f $bf/工作目录/vendor.img ];then
   echo "\033[31m未检测到vendor.img，请确认vendor.img是否已放到工作目录里。\033[0m"
   read -p "按任意键返回" make   
   cd $af
   clear
   sh $0     
   exit
   fi
   read -p "请输入要调整vendor.img的大小(不用带单位):" vt
   e2fsck -fy $bf/工作目录/vendor.img
   resize2fs -f $bf/工作目录/vendor.img ${vt}m
   echo "\033[32m已调整，请检查img文件的大小是否和输入的数值一致。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
 fi   
   if [ $tz = 'y' ];then
   read -p "请将raw格式的vendor.img放到工作目录文件夹里,按任意键继续" make   
   if [ ! -f $bf/工作目录/vendor.img ];then
   echo "\033[31m未检测到vendor.img，请确认vendor.img是否已放到工作目录里。\033[0m"
   read -p "按任意键返回" make   
   cd $af
   clear
   sh $0     
   exit
   fi
   read -p "请输入要调整vendor.img的大小(不用带单位):" vt
   e2fsck -fy $bf/工作目录/vendor.img
   resize2fs -f $bf/工作目录/vendor.img ${vt}m
   echo "\033[32m已调整，请检查img文件的大小是否和输入的数值一致。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $tz = 'n' ];then
   echo "\033[31m不调整\033[0m"   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi   
fi      

#5
if [ $ab = '5' ];then
   cd $af
   clear
   sh $0
   fi
fi
#清理工作目录
if [ $xz = '5' ];then
   read -p "清理工作目录,里面的文件将消失,是否继续？(y/n): " grm
   if [ -z $grm ];then
   rm -rf $bf/工作目录
   read -p "已清理，按任意键返回" make
   cd $af
   clear
   sh $0
   exit      
   fi   
   if [ $grm = 'y' ];then
   rm -rf $bf/工作目录
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit      
   fi
   if [ $grm = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit   
   fi
fi
#退出
if [ $xz = '88' ];then
   exit
fi
