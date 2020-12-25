  os=$(uname -o)
  af=$(pwd)
  bf=$(dirname $0)
  if ( echo ${bf} |grep -q / );then
  .
  else 
  cd $af/$bf
  cf=$(pwd)
  bf=$cf
  fi
  
   read -p "是否修改vendor.img？(y/n): " vendor
   if [ -z $vendor ];then
   read -p "请将raw格式的vendor.img放到工作目录/未完成/底包里，按任意键继续:" me   
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/vendor.img ];then
   echo "\\033[31m修改失败！请确认vendor.img是否已放到工作目录/未完成/底包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   sh $0   
   exit
   fi
   if [ $os != 'GNU/Linux' ];then
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/vendor
   else
  sudo mount -o remount -rw /
  sudo mkdir /工作目录 /工作目录/vendor
   fi   
   if [ $os != 'GNU/Linux' ];then 
   su -c losetup /dev/block/loop4 $bf/vendor.img
   su -c mount /dev/block/loop4 /工作目录/vendor
   else
sudo   losetup /dev/loop4 $bf/vendor.img
sudo   mount /dev/loop4 /工作目录/vendor   
   fi
   echo "\033[32mvendor.img已挂载到根目录/工作目录/vendor里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os != 'GNU/Linux' ];then   
   su -c umount -fl /工作目录/vendor
   su -c rmdir  /工作目录/vendor /工作目录
   else
sudo   umount -fl /工作目录/vendor
sudo   rmdir  /工作目录/vendor /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"
   read -p "按任意键返回" make
   cd $af
   sh $0 
   exit     
  fi
      
   if [ $vendor = 'y' ];then
   read -p "请将raw格式的vendor.img放到工作目录/未完成/底包里，按任意键继续:" me   
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/vendor.img ];then
   echo "\\033[31m修改失败！请确认vendor.img是否已放到工作目录/未完成/底包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   sh $0   
   exit
   fi
   if [ $os != 'GNU/Linux' ];then
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/vendor
   else
sudo   mount -o remount -rw /
 sudo  mkdir /工作目录 /工作目录/vendor
   fi   
   if [ $os != 'GNU/Linux' ];then 
   su -c losetup /dev/block/loop4 $bf/vendor.img
   su -c mount /dev/block/loop4 /工作目录/vendor
   else
sudo   losetup /dev/loop4 $bf/vendor.img
 sudo  mount /dev/loop4 /工作目录/vendor   
   fi
   echo "\033[32mvendor.img已挂载到根目录/工作目录/vendor里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os != 'GNU/Linux' ];then   
   su -c umount -fl /工作目录/vendor
   su -c rmdir  /工作目录/vendor /工作目录
   else
sudo   umount -fl /工作目录/vendor
sudo   rmdir  /工作目录/vendor /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"
   read -p "按任意键返回" make
   cd $af
   sh $0 
   exit     
   fi
   if [ $vendor = 'n' ];then
   echo "\033[31m不修改\033[0m"
   read -p "按任意键返回" make
   cd $af
   sh $0   
   exit
   fi