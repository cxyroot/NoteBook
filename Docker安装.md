1：查看系统版本
​	uname -r
2：安装docker
先确保有网
​	yum install docker
3：查看是否安装成功
​	$docker version
​	若输出以下，说明安装成功
​	Client:
​	Version:         1.12.6
​	API version:     1.24
​	Package version: docker-1.12.6-61.git85d7426.el7.centos.x86_64
​	Go version:      go1.8.3
​	Git commit:      85d7426/1.12.6
​	Built:           Tue Oct 24 15:40:21 2017
​	OS/Arch:         linux/amd64
​	Cannot connect to the Docker daemon. Is the docker daemon running on this host?

4:查看已安装的docker安装包
​	yum list installed|grep docker
5:删除安装包
​	yum –y remove
​	https://www.daocloud.io/account/signup
Error response from daemon: Get https://index.docker.io/v1/search?q=mysql&n=25: net/http: TLS handshake timeout
拉取mysql
​	docker pull mysql:5.5
查看安装的mysql
​	dokcer images