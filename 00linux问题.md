```shell
ifconfig


vim /etc/sysconfig/network-scripts/ifcfg-enp0s3
#重启网络命令
service network restart

#相当于windows 中的hosts
vi /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.10.102 hadoop102
192.168.10.103 hadoop103
192.168.10.104 hadoop104

#重新编译profile文件
source /etc/profile


## 修改IP地址
vim /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=static
IPADDR=192.168.220.128
NETMASK=255.255.255.0
GRTWAY=192.168.220.2
DNS1=114.114.114.114
DNS2=8.8.8.8


DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=static
IPADDR=192.168.245.102
NETMASK=255.255.255.0
GRTWAY=192.168.245.2
DNS1=114.114.114.114


## 修改主机名
vi /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=hadoop102
NTPSERVERARGS=iburst


yum -y install rsync

cd /etc/yum.repos.d

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak


wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo

vim /etc/sysconfig/network-scripts/ifcfg-enp0s3

wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo


mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

yum clean all
yum makecache



cat  /etc/sysconfig/network
cat /etc/udev/rules.d/70-persistent-net.rules 
## 删除文件
rm -rf /etc/udev/rules.d/
# 安装vim 命令
yum -y install vim*
## 安装rsync
yum -y install rsync
## 远程拷贝命令
rsync -av 192.168.10.102:/home/soft/tar/ /home/soft
scp -r /home/soft  root@192.168.10.211:/home/soft
scp -r /home/soft  root@192.168.10.212:/home/soft
rsync -av 192.168.10.102:/home/soft/tar/ /home/soft
rsync -av 192.168.10.102:/home/soft/tar/ /home/soft
find 目录名  -name 文件名
/etc/resolv.conf
#查询是否安装jdk
rpm -qa|grep jdk
rpm -e package_name
yum remove 
#卸载
rpm -e  --nodeps
#查询是否安装rsync
rpm -qa|grep rsync
#按照文件名称查找
find 目录名 -name 文件名 
#按照文件名称,查找	文件名为xsync
find / -name xsync
```

