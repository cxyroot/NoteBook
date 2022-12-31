```shell
1：查看系统版本
   uname -r
2：安装docker
先确保有网
	yum install docker
3：查看是否安装成功
	$docker version
	若输出以下，说明安装成功
	Client:
	Version:         1.12.6
	API version:     1.24
   Package version: docker-1.12.6-61.git85d7426.el7.centos.x86_64
	Go version:      go1.8.3
	Git commit:      85d7426/1.12.6
	Built:           Tue Oct 24 15:40:21 2017
	OS/Arch:         linux/amd64
	Cannot connect to the Docker daemon. Is the docker daemon running on this host?

4:查看已安装的docker安装包
	yum list installed|grep docker
5:删除安装包
	yum –y remove
	https://www.daocloud.io/account/signup
Error response from daemon: Get https://index.docker.io/v1/search?q=mysql&n=25: net/http: TLS handshake timeout
拉取mysql
	docker pull mysql:5.5
查看安装的mysql
	dokcer images
```



# docker是什么

# docker安装



Docker 提供了两个版本：社区版 (CE) 和企业版 (EE)。
操作系统要求
以Centos7为例，且Docker 要求操作系统必须为64位，且centos内核版本为3.1及以上。
查看系统内核版本信息：

```shell
uname -r
[root@CentOS8 myredis]# docker version
4.18.0-80.el8.x86_64

1.安装依赖软件包
yum install -y yum-utils device-mapper-persistent-data lvm2
#安装前可查看device-mapper-persistent-data和lvm2是否已经安装
rpm -qa|grep device-mapper-persistent-data
rpm -qa|grep lvm2
2.设置yum源
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
3.更新yum软件包索引
yum makecache fast

#清空yum安装问题
yum clean all


#安装最新版本docker-ce
yum install docker-ce -y
#安装指定版本docker-ce可使用以下命令查看
yum list docker-ce.x86_64 --showduplicates | sort -r
# 安装完成之后可以使用命令查看
docker version

```



# docker启动

