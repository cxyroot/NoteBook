

# dokcer 启动

```shell
Xshell 5 (Build 0553)
Copyright (c) 2002-2015 NetSarang Computer, Inc. All rights reserved.

Type `help' to learn how to use Xshell prompt.
[c:\~]$ 

Connecting to 192.168.175.110:22...
Connection established.
To escape to local shell, press 'Ctrl+Alt+]'.

Last login: Wed Apr  6 21:48:27 2022 from 192.168.175.100
[root@localhost ~]# systemctl start docker
Job for docker.service failed because the control process exited with error code. See "systemctl status docker.ser
vice" and "journalctl -xe" for details.[root@localhost ~]# docker --version
Docker version 1.13.1, build 7d71120/1.13.1
[root@localhost ~]# yum update
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager

This system is not registered with an entitlement server. You can use subscription-manager to register.

Loading mirror speeds from cached hostfile
 * base: mirrors.bupt.edu.cn
 * extras: mirrors.bupt.edu.cn
 * updates: mirrors.bupt.edu.cn
No packages marked for update
[root@localhost ~]# systemctl status docker.service
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Wed 2022-04-06 23:08:37 EDT; 1min 28s ago
     Docs: http://docs.docker.com
  Process: 1702 ExecStart=/usr/bin/dockerd-current --add-runtime docker-runc=/usr/libexec/docker/docker-runc-curre
nt --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd --userland-proxy-path=/usr/libexec/docker/docker-proxy-current --init-path=/usr/libexec/docker/docker-init-current --seccomp-profile=/etc/docker/seccomp.json $OPTIONS $DOCKER_STORAGE_OPTIONS $DOCKER_NETWORK_OPTIONS $ADD_REGISTRY $BLOCK_REGISTRY $INSECURE_REGISTRY $REGISTRIES (code=exited, status=1/FAILURE) Main PID: 1702 (code=exited, status=1/FAILURE)

Apr 06 23:08:37 localhost.localdomain systemd[1]: Starting Docker Application Container Engine...
Apr 06 23:08:37 localhost.localdomain dockerd-current[1702]: unable to configure the Docker daemon with file...ing
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service: main process exited, code=exited, status=...LURE
Apr 06 23:08:37 localhost.localdomain systemd[1]: Failed to start Docker Application Container Engine.
Apr 06 23:08:37 localhost.localdomain systemd[1]: Unit docker.service entered failed state.
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service failed.
Hint: Some lines were ellipsized, use -l to show in full.
[root@localhost ~]# systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Wed 2022-04-06 23:08:37 EDT; 1min 58s ago
     Docs: http://docs.docker.com
  Process: 1702 ExecStart=/usr/bin/dockerd-current --add-runtime docker-runc=/usr/libexec/docker/docker-runc-curre
nt --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd --userland-proxy-path=/usr/libexec/docker/docker-proxy-current --init-path=/usr/libexec/docker/docker-init-current --seccomp-profile=/etc/docker/seccomp.json $OPTIONS $DOCKER_STORAGE_OPTIONS $DOCKER_NETWORK_OPTIONS $ADD_REGISTRY $BLOCK_REGISTRY $INSECURE_REGISTRY $REGISTRIES (code=exited, status=1/FAILURE) Main PID: 1702 (code=exited, status=1/FAILURE)

Apr 06 23:08:37 localhost.localdomain systemd[1]: Starting Docker Application Container Engine...
Apr 06 23:08:37 localhost.localdomain dockerd-current[1702]: unable to configure the Docker daemon with file...ing
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service: main process exited, code=exited, status=...LURE
Apr 06 23:08:37 localhost.localdomain systemd[1]: Failed to start Docker Application Container Engine.
Apr 06 23:08:37 localhost.localdomain systemd[1]: Unit docker.service entered failed state.
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service failed.
Hint: Some lines were ellipsized, use -l to show in full.
[root@localhost ~]# docker --version
Docker version 1.13.1, build 7d71120/1.13.1
[root@localhost ~]# yum install docker-ce
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager

This system is not registered with an entitlement server. You can use subscription-manager to register.

Loading mirror speeds from cached hostfile
 * base: mirrors.bupt.edu.cn
 * extras: mirrors.bupt.edu.cn
 * updates: mirrors.bupt.edu.cn
No package docker-ce available.
Error: Nothing to do
[root@localhost ~]# systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Wed 2022-04-06 23:08:37 EDT; 2min 45s ago
     Docs: http://docs.docker.com
  Process: 1702 ExecStart=/usr/bin/dockerd-current --add-runtime docker-runc=/usr/libexec/docker/docker-runc-curre
nt --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd --userland-proxy-path=/usr/libexec/docker/docker-proxy-current --init-path=/usr/libexec/docker/docker-init-current --seccomp-profile=/etc/docker/seccomp.json $OPTIONS $DOCKER_STORAGE_OPTIONS $DOCKER_NETWORK_OPTIONS $ADD_REGISTRY $BLOCK_REGISTRY $INSECURE_REGISTRY $REGISTRIES (code=exited, status=1/FAILURE) Main PID: 1702 (code=exited, status=1/FAILURE)

Apr 06 23:08:37 localhost.localdomain systemd[1]: Starting Docker Application Container Engine...
Apr 06 23:08:37 localhost.localdomain dockerd-current[1702]: unable to configure the Docker daemon with file...ing
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service: main process exited, code=exited, status=...LURE
Apr 06 23:08:37 localhost.localdomain systemd[1]: Failed to start Docker Application Container Engine.
Apr 06 23:08:37 localhost.localdomain systemd[1]: Unit docker.service entered failed state.
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service failed.
Hint: Some lines were ellipsized, use -l to show in full.
[root@localhost ~]# journalctl -xe loop: Write error at byte offset 63585648640, length 4096.
Failed to add match 'loop:': Invalid argument
Failed to add filters: Invalid argument
[root@localhost ~]# journalctl -eu docker
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
-- Logs begin at Wed 2022-04-06 23:08:19 EDT, end at Wed 2022-04-06 23:08:37 EDT. --
Apr 06 23:08:37 localhost.localdomain systemd[1]: Starting Docker Application Container Engine...
Apr 06 23:08:37 localhost.localdomain dockerd-current[1702]: unable to configure the Docker daemon with file /etc/
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service: main process exited, code=exited, status=1/FAILU
Apr 06 23:08:37 localhost.localdomain systemd[1]: Failed to start Docker Application Container Engine.
Apr 06 23:08:37 localhost.localdomain systemd[1]: Unit docker.service entered failed state.
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service failed.
~

[root@localhost ~]# ^C
[root@localhost ~]# ^C
[root@localhost ~]# systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Wed 2022-04-06 23:08:37 EDT; 5min ago
     Docs: http://docs.docker.com
  Process: 1702 ExecStart=/usr/bin/dockerd-current --add-runtime docker-runc=/usr/libexec/docker/docker-runc-curre
nt --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd --userland-proxy-path=/usr/libexec/docker/docker-proxy-current --init-path=/usr/libexec/docker/docker-init-current --seccomp-profile=/etc/docker/seccomp.json $OPTIONS $DOCKER_STORAGE_OPTIONS $DOCKER_NETWORK_OPTIONS $ADD_REGISTRY $BLOCK_REGISTRY $INSECURE_REGISTRY $REGISTRIES (code=exited, status=1/FAILURE) Main PID: 1702 (code=exited, status=1/FAILURE)

Apr 06 23:08:37 localhost.localdomain systemd[1]: Starting Docker Application Container Engine...
Apr 06 23:08:37 localhost.localdomain dockerd-current[1702]: unable to configure the Docker daemon with file...ing
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service: main process exited, code=exited, status=...LURE
Apr 06 23:08:37 localhost.localdomain systemd[1]: Failed to start Docker Application Container Engine.
Apr 06 23:08:37 localhost.localdomain systemd[1]: Unit docker.service entered failed state.
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service failed.
Hint: Some lines were ellipsized, use -l to show in full.
[root@localhost ~]# systemctl status docker -l
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Wed 2022-04-06 23:08:37 EDT; 6min ago
     Docs: http://docs.docker.com
  Process: 1702 ExecStart=/usr/bin/dockerd-current --add-runtime docker-runc=/usr/libexec/docker/docker-runc-curre
nt --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd --userland-proxy-path=/usr/libexec/docker/docker-proxy-current --init-path=/usr/libexec/docker/docker-init-current --seccomp-profile=/etc/docker/seccomp.json $OPTIONS $DOCKER_STORAGE_OPTIONS $DOCKER_NETWORK_OPTIONS $ADD_REGISTRY $BLOCK_REGISTRY $INSECURE_REGISTRY $REGISTRIES (code=exited, status=1/FAILURE) Main PID: 1702 (code=exited, status=1/FAILURE)

Apr 06 23:08:37 localhost.localdomain systemd[1]: Starting Docker Application Container Engine...
Apr 06 23:08:37 localhost.localdomain dockerd-current[1702]: unable to configure the Docker daemon with file /etc/
docker/daemon.json: invalid character 's' looking for beginning of object key stringApr 06 23:08:37 localhost.localdomain systemd[1]: docker.service: main process exited, code=exited, status=1/FAILU
REApr 06 23:08:37 localhost.localdomain systemd[1]: Failed to start Docker Application Container Engine.
Apr 06 23:08:37 localhost.localdomain systemd[1]: Unit docker.service entered failed state.
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service failed.
[root@localhost ~]#  status docker -l
-bash: status: command not found
[root@localhost ~]# systemctl status docker -l
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Wed 2022-04-06 23:08:37 EDT; 6min ago
     Docs: http://docs.docker.com
  Process: 1702 ExecStart=/usr/bin/dockerd-current --add-runtime docker-runc=/usr/libexec/docker/docker-runc-curre
nt --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd --userland-proxy-path=/usr/libexec/docker/docker-proxy-current --init-path=/usr/libexec/docker/docker-init-current --seccomp-profile=/etc/docker/seccomp.json $OPTIONS $DOCKER_STORAGE_OPTIONS $DOCKER_NETWORK_OPTIONS $ADD_REGISTRY $BLOCK_REGISTRY $INSECURE_REGISTRY $REGISTRIES (code=exited, status=1/FAILURE) Main PID: 1702 (code=exited, status=1/FAILURE)

Apr 06 23:08:37 localhost.localdomain systemd[1]: Starting Docker Application Container Engine...
Apr 06 23:08:37 localhost.localdomain dockerd-current[1702]: unable to configure the Docker daemon with file /etc/
docker/daemon.json: invalid character 's' looking for beginning of object key stringApr 06 23:08:37 localhost.localdomain systemd[1]: docker.service: main process exited, code=exited, status=1/FAILU
REApr 06 23:08:37 localhost.localdomain systemd[1]: Failed to start Docker Application Container Engine.
Apr 06 23:08:37 localhost.localdomain systemd[1]: Unit docker.service entered failed state.
Apr 06 23:08:37 localhost.localdomain systemd[1]: docker.service failed.
[root@localhost ~]# systemctl start docker
[root@localhost ~]# docker --version
Docker version 1.13.1, build 7d71120/1.13.1
[root@localhost ~]# ps -ef | grep docker
root       1839      1  0 23:15 ?        00:00:00 /usr/bin/dockerd-current --add-runtime docker-runc=/usr/libexec
docker/docker-runc-current --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd --userland-proxy-path=/usr/libexec/docker/docker-proxy-current --init-path=/usr/libexec/docker/docker-init-current --seccomp-profile=/etc/docker/seccomp.json --selinux-enabled --log-driver=journald --signature-verification=false --storage-driver overlay2root       1847   1839  0 23:15 ?        00:00:00 /usr/bin/docker-containerd-current -l unix:///var/run/docker/lib
containerd/docker-containerd.sock --metrics-interval=0 --start-timeout 2m --state-dir /var/run/docker/libcontainerd/containerd --shim docker-containerd-shim --runtime docker-runc --runtime-args --systemd-cgroup=trueroot       1932   1615  0 23:16 pts/0    00:00:00 grep --color=auto docker
[root@localhost ~]# docker pull mysql:5.5
Trying to pull repository docker.io/library/mysql ... 
5.5: Pulling from docker.io/library/mysql
743f2d6c1f65: Pull complete 
3f0c413ee255: Pull complete 
aef1ef8f1aac: Pull complete 
f9ee573e34cb: Pull complete 
3f237e01f153: Pull complete 
03da1e065b16: Pull complete 
04087a801070: Pull complete 
7efd5395ab31: Pull complete 
1b5cc03aaac8: Pull complete 
2b7adaec9998: Pull complete 
385b8f96a9ba: Pull complete 
Digest: sha256:12da85ab88aedfdf39455872fb044f607c32fdc233cd59f1d26769fbf439b045
Status: Downloaded newer image for docker.io/mysql:5.5
[root@localhost docker]# docker run --name myjava -d java 
705c56c44204aa68e29eaf2b1c70f622b1693ed1e40def1cf9814740b1c3ab60
[root@localhost docker]#  docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
[root@localhost docker]#  docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
[root@localhost docker]# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                          PORTS               NAMES
705c56c44204        java   


```

# docker 命令及安装tomcat

```shell
############################################################################################################
# docker pull mysql:5.5
# ps -ef | grep docker
# systemctl start docker
#设置自动启动
systemctl start docker && systemctl enable docker
#查看docker的镜像
docker image list

#docker 搜索
docker search java

# 查看运行的docker镜像
docker ps -a

# 删除正在运行的docker镜像
docker container rm -f 705c56c44204

#运行docker 
docker run --name myjava -d java
#启动终端
docker exec -it myjava /bin/bash
#退出终端
exit

#拉去java
docker pull java:8

#查看启动的mytomcat的日志
docker logs mytomcat

#启动tomcat并映射到8080端口
docker run --name mytomcat -d -p 8080:8080 tomcat

#进入运行的tomcat的目录
docker exec -it mytomcat /bin/bash

#查看
docker container inspect mytomcat

docker run --name mytomcat -d tomcat

docker exec -it mytomcat /bin/bash
```



# docker-mysql

```shell

WARNING! The remote SSH server rejected X11 forwarding request.
Last login: Sun Apr 10 03:51:27 2022 from 192.168.175.100
cd "/"
[root@localhost ~]# cd "/"
[root@localhost /]# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
3528aaf3d304        tomcat              "catalina.sh run"   2 minutes ago       Up 2 minutes        0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# curl 0.0.0.0:8080

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Apache Tomcat/10.0.20</title>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="tomcat.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <div id="wrapper">
            <div id="navigation" class="curved container">
                <span id="nav-home"><a href="https://tomcat.apache.org/">Home</a></span>
                <span id="nav-hosts"><a href="/docs/">Documentation</a></span>
                <span id="nav-config"><a href="/docs/config/">Configuration</a></span>
                <span id="nav-examples"><a href="/examples/">Examples</a></span>
                <span id="nav-wiki"><a href="https://wiki.apache.org/tomcat/FrontPage">Wiki</a></span>
                <span id="nav-lists"><a href="https://tomcat.apache.org/lists.html">Mailing Lists</a></span>
                <span id="nav-help"><a href="https://tomcat.apache.org/findhelp.html">Find Help</a></span>
                <br class="separator" />
            </div>
            <div id="asf-box">
                <h1>Apache Tomcat/10.0.20</h1>
            </div>
            <div id="upper" class="curved container">
                <div id="congrats" class="curved container">
                    <h2>If you're seeing this, you've successfully installed Tomcat. Congratulations!</h2>
                </div>
                <div id="notice">
                    <img id="tomcat-logo" src="tomcat.svg" alt="[tomcat logo]" />
                    <div id="tasks">
                        <h3>Recommended Reading:</h3>
                        <h4><a href="/docs/security-howto.html">Security Considerations How-To</a></h4>
                        <h4><a href="/docs/manager-howto.html">Manager Application How-To</a></h4>
                        <h4><a href="/docs/cluster-howto.html">Clustering/Session Replication How-To</a></h4>
                    </div>
                </div>
                <div id="actions">
                    <div class="button">
                        <a class="container shadow" href="/manager/status"><span>Server Status</span></a>
                    </div>
                    <div class="button">
                        <a class="container shadow" href="/manager/html"><span>Manager App</span></a>
                    </div>
                    <div class="button">
                        <a class="container shadow" href="/host-manager/html"><span>Host Manager</span></a>
                    </div>
                </div>
                <br class="separator" />
            </div>
            <div id="middle" class="curved container">
                <h3>Developer Quick Start</h3>
                <div class="col25">
                    <div class="container">
                        <p><a href="/docs/setup.html">Tomcat Setup</a></p>
                        <p><a href="/docs/appdev/">First Web Application</a></p>
                    </div>
                </div>
                <div class="col25">
                    <div class="container">
                        <p><a href="/docs/realm-howto.html">Realms &amp; AAA</a></p>
                        <p><a href="/docs/jndi-datasource-examples-howto.html">JDBC DataSources</a></p>
                    </div>
                </div>
                <div class="col25">
                    <div class="container">
                        <p><a href="/examples/">Examples</a></p>
                    </div>
                </div>
                <div class="col25">
                    <div class="container">
                        <p><a href="https://wiki.apache.org/tomcat/Specifications">Servlet Specifications</a></p>
                        <p><a href="https://wiki.apache.org/tomcat/TomcatVersions">Tomcat Versions</a></p>
                    </div>
                </div>
                <br class="separator" />
            </div>
            <div id="lower">
                <div id="low-manage" class="">
                    <div class="curved container">
                        <h3>Managing Tomcat</h3>
                        <p>For security, access to the <a href="/manager/html">manager webapp</a> is restricted.
                        Users are defined in:</p>
                        <pre>$CATALINA_HOME/conf/tomcat-users.xml</pre>
                        <p>In Tomcat 10.0 access to the manager application is split between
                           different users. &nbsp; <a href="/docs/manager-howto.html">Read more...</a></p>
                        <br />
                        <h4><a href="/docs/RELEASE-NOTES.txt">Release Notes</a></h4>
                        <h4><a href="/docs/changelog.html">Changelog</a></h4>
                        <h4><a href="https://tomcat.apache.org/migration.html">Migration Guide</a></h4>
                        <h4><a href="https://tomcat.apache.org/security.html">Security Notices</a></h4>
                    </div>
                </div>
                <div id="low-docs" class="">
                    <div class="curved container">
                        <h3>Documentation</h3>
                        <h4><a href="/docs/">Tomcat 10.0 Documentation</a></h4>
                        <h4><a href="/docs/config/">Tomcat 10.0 Configuration</a></h4>
                        <h4><a href="https://wiki.apache.org/tomcat/FrontPage">Tomcat Wiki</a></h4>
                        <p>Find additional important configuration information in:</p>
                        <pre>$CATALINA_HOME/RUNNING.txt</pre>
                        <p>Developers may be interested in:</p>
                        <ul>
                            <li><a href="https://tomcat.apache.org/bugreport.html">Tomcat 10.0 Bug Database</a></li>
                            <li><a href="/docs/api/index.html">Tomcat 10.0 JavaDocs</a></li>
                            <li><a href="https://github.com/apache/tomcat/tree/10.0.x">Tomcat 10.0 Git Repository at GitHub</a></li>
                        </ul>
                    </div>
                </div>
                <div id="low-help" class="">
                    <div class="curved container">
                        <h3>Getting Help</h3>
                        <h4><a href="https://tomcat.apache.org/faq/">FAQ</a> and <a href="https://tomcat.apache.org/lists.html">Mailing Lists</a></h4>
                        <p>The following mailing lists are available:</p>
                        <ul>
                            <li id="list-announce"><strong><a href="https://tomcat.apache.org/lists.html#tomcat-announce">tomcat-announce</a><br />
                                Important announcements, releases, security vulnerability notifications. (Low volume).</strong>
                            </li>
                            <li><a href="https://tomcat.apache.org/lists.html#tomcat-users">tomcat-users</a><br />
                                User support and discussion
                            </li>
                            <li><a href="https://tomcat.apache.org/lists.html#taglibs-user">taglibs-user</a><br />
                                User support and discussion for <a href="https://tomcat.apache.org/taglibs/">Apache Taglibs</a>
                            </li>
                            <li><a href="https://tomcat.apache.org/lists.html#tomcat-dev">tomcat-dev</a><br />
                                Development mailing list, including commit messages
                            </li>
                        </ul>
                    </div>
                </div>
                <br class="separator" />
            </div>
            <div id="footer" class="curved container">
                <div class="col20">
                    <div class="container">
                        <h4>Other Downloads</h4>
                        <ul>
                            <li><a href="https://tomcat.apache.org/download-connectors.cgi">Tomcat Connectors</a></li>
                            <li><a href="https://tomcat.apache.org/download-native.cgi">Tomcat Native</a></li>
                            <li><a href="https://tomcat.apache.org/taglibs/">Taglibs</a></li>
                            <li><a href="/docs/deployer-howto.html">Deployer</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col20">
                    <div class="container">
                        <h4>Other Documentation</h4>
                        <ul>
                            <li><a href="https://tomcat.apache.org/connectors-doc/">Tomcat Connectors</a></li>
                            <li><a href="https://tomcat.apache.org/connectors-doc/">mod_jk Documentation</a></li>
                            <li><a href="https://tomcat.apache.org/native-doc/">Tomcat Native</a></li>
                            <li><a href="/docs/deployer-howto.html">Deployer</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col20">
                    <div class="container">
                        <h4>Get Involved</h4>
                        <ul>
                            <li><a href="https://tomcat.apache.org/getinvolved.html">Overview</a></li>
                            <li><a href="https://tomcat.apache.org/source.html">Source Repositories</a></li>
                            <li><a href="https://tomcat.apache.org/lists.html">Mailing Lists</a></li>
                            <li><a href="https://wiki.apache.org/tomcat/FrontPage">Wiki</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col20">
                    <div class="container">
                        <h4>Miscellaneous</h4>
                        <ul>
                            <li><a href="https://tomcat.apache.org/contact.html">Contact</a></li>
                            <li><a href="https://tomcat.apache.org/legal.html">Legal</a></li>
                            <li><a href="https://www.apache.org/foundation/sponsorship.html">Sponsorship</a></li>
                            <li><a href="https://www.apache.org/foundation/thanks.html">Thanks</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col20">
                    <div class="container">
                        <h4>Apache Software Foundation</h4>
                        <ul>
                            <li><a href="https://tomcat.apache.org/whoweare.html">Who We Are</a></li>
                            <li><a href="https://tomcat.apache.org/heritage.html">Heritage</a></li>
                            <li><a href="https://www.apache.org">Apache Home</a></li>
                            <li><a href="https://tomcat.apache.org/resources.html">Resources</a></li>
                        </ul>
                    </div>
                </div>
                <br class="separator" />
            </div>
            <p class="copyright">Copyright &copy;1999-2022 Apache Software Foundation.  All Rights Reserved</p>
        </div>
    </body>

</html>
[root@localhost /]# 
[root@localhost /]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
3528aaf3d304        tomcat              "catalina.sh run"   26 minutes ago      Up 26 minutes       0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# dokcer run --name mysql -d mysql:5.5
-bash: dokcer: command not found
[root@localhost /]# docker run --name mysql -d mysql:5.5
93ef6b16b681af616eefc997c0c2716f32eb9d2526f24a1e949d08e4c97c5c3d
[root@localhost /]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
3528aaf3d304        tomcat              "catalina.sh run"   27 minutes ago      Up 27 minutes       0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
3528aaf3d304        tomcat              "catalina.sh run"   27 minutes ago      Up 27 minutes       0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# docker logs mysql
error: database is uninitialized and password option is not specified 
  You need to specify one of MYSQL_ROOT_PASSWORD, MYSQL_ALLOW_EMPTY_PASSWORD and MYSQL_RANDOM_ROOT_PASSWORD
[root@localhost /]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS                    NAMES
93ef6b16b681        mysql:5.5           "docker-entrypoint..."   3 minutes ago       Exited (1) 3 minutes ago                            mysql
3528aaf3d304        tomcat              "catalina.sh run"        30 minutes ago      Up 30 minutes              0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# docker -rm -f 93ef6b16b681
unknown shorthand flag: 'r' in -rm
See 'docker --help'.

Usage:	docker COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/root/.docker")
  -D, --debug              Enable debug mode
      --help               Print usage
  -H, --host list          Daemon socket(s) to connect to (default [])
  -l, --log-level string   Set the logging level ("debug", "info", "warn", "error", "fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/root/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/root/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  checkpoint  Manage checkpoints
  container   Manage containers
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  volume      Manage volumes

Commands:
  attach      Attach to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  deploy      Deploy a new stack or update an existing stack
  diff        Inspect changes on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.

[root@localhost /]# 
[root@localhost /]# ll
total 20
lrwxrwxrwx.   1 root root    7 Apr  6 10:14 bin -> usr/bin
dr-xr-xr-x.   5 root root 4096 Apr  6 21:14 boot
drwxr-xr-x.  20 root root 3260 Apr 10 03:50 dev
drwxr-xr-x.  84 root root 8192 Apr 10 03:50 etc
drwxr-xr-x.   3 root root   18 Apr  9 08:05 home
lrwxrwxrwx.   1 root root    7 Apr  6 10:14 lib -> usr/lib
lrwxrwxrwx.   1 root root    9 Apr  6 10:14 lib64 -> usr/lib64
drwxr-xr-x.   2 root root    6 Apr 11  2018 media
drwxr-xr-x.   3 root root   18 Apr  6 10:22 mnt
drwxr-xr-x.   2 root root    6 Apr 11  2018 opt
dr-xr-xr-x. 157 root root    0 Apr 10 03:50 proc
dr-xr-x---.   3 root root  147 Apr  6 23:22 root
drwxr-xr-x.  29 root root  840 Apr 10 03:53 run
lrwxrwxrwx.   1 root root    8 Apr  6 10:14 sbin -> usr/sbin
drwxr-xr-x.   2 root root    6 Apr 11  2018 srv
dr-xr-xr-x.  13 root root    0 Apr 10 03:50 sys
drwxrwxrwt.  31 root root 4096 Apr 10 03:50 tmp
drwxr-xr-x.  13 root root  155 Apr  6 10:14 usr
drwxr-xr-x.  19 root root  267 Apr  6 10:16 var
[root@localhost /]# 
[root@localhost /]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS                    NAMES
93ef6b16b681        mysql:5.5           "docker-entrypoint..."   3 minutes ago       Exited (1) 3 minutes ago                            mysql
3528aaf3d304        tomcat              "catalina.sh run"        31 minutes ago      Up 31 minutes              0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# docker stop 93ef6b16b681
93ef6b16b681
[root@localhost /]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS                    NAMES
93ef6b16b681        mysql:5.5           "docker-entrypoint..."   3 minutes ago       Exited (1) 3 minutes ago                            mysql
3528aaf3d304        tomcat              "catalina.sh run"        31 minutes ago      Up 31 minutes              0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS                    NAMES
93ef6b16b681        mysql:5.5           "docker-entrypoint..."   4 minutes ago       Exited (1) 4 minutes ago                            mysql
3528aaf3d304        tomcat              "catalina.sh run"        31 minutes ago      Up 31 minutes              0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# docker container rm -f 93ef6b16b681
93ef6b16b681
[root@localhost /]# docker os
docker: 'os' is not a docker command.
See 'docker --help'
[root@localhost /]# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
3528aaf3d304        tomcat              "catalina.sh run"   32 minutes ago      Up 32 minutes       0.0.0.0:8080->8080/tcp   mytomcat
[root@localhost /]# 
[root@localhost /]# docker run --name mysql -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=123456  mysql:5.5
a505a0296d6222545ed5ef1d36de4b7fc485368b52d39606ad788a56f526ad0a
[root@localhost /]# docker logs mysql
Initializing database
220410  9:03:32 [Note] Ignoring --secure-file-priv value as server is running with --bootstrap.
220410  9:03:32 [Note] /usr/local/mysql/bin/mysqld (mysqld 5.5.62) starting as process 69 ...
220410  9:03:32 [Note] Ignoring --secure-file-priv value as server is running with --bootstrap.
220410  9:03:32 [Note] /usr/local/mysql/bin/mysqld (mysqld 5.5.62) starting as process 75 ...
PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:
/usr/local/mysql/bin/mysqladmin -u root password 'new-password'
/usr/local/mysql/bin/mysqladmin -u root -h  password 'new-password'
Alternatively you can run:
/usr/local/mysql/bin/mysql_secure_installation
which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.
See the manual for more instructions.
Please report any problems at http://bugs.mysql.com/
Database initialized
220410  9:03:32 [Note] --secure-file-priv is set to NULL. Operations related to importing and exporting data are disabled
220410  9:03:32 [Note] mysqld (mysqld 5.5.62) starting as process 85 ...
MySQL init process in progress...
220410  9:03:32 [Note] Plugin 'FEDERATED' is disabled.
220410  9:03:32 InnoDB: The InnoDB memory heap is disabled
220410  9:03:32 InnoDB: Mutexes and rw_locks use GCC atomic builtins
220410  9:03:32 InnoDB: Compressed tables use zlib 1.2.11
220410  9:03:32 InnoDB: Using Linux native AIO
220410  9:03:32 InnoDB: Initializing buffer pool, size = 128.0M
220410  9:03:32 InnoDB: Completed initialization of buffer pool
InnoDB: The first specified data file ./ibdata1 did not exist:
InnoDB: a new database to be created!
220410  9:03:32  InnoDB: Setting file ./ibdata1 size to 10 MB
InnoDB: Database physically writes the file full: wait...
220410  9:03:32  InnoDB: Log file ./ib_logfile0 did not exist: new to be created
InnoDB: Setting log file ./ib_logfile0 size to 5 MB
InnoDB: Database physically writes the file full: wait...
220410  9:03:32  InnoDB: Log file ./ib_logfile1 did not exist: new to be created
InnoDB: Setting log file ./ib_logfile1 size to 5 MB
InnoDB: Database physically writes the file full: wait...
InnoDB: Doublewrite buffer not found: creating new
InnoDB: Doublewrite buffer created
InnoDB: 127 rollback segment(s) active.
InnoDB: Creating foreign key constraint system tables
InnoDB: Foreign key constraint system tables created
220410  9:03:32  InnoDB: Waiting for the background threads to start
MySQL init process in progress...
220410  9:03:33 InnoDB: 5.5.62 started; log sequence number 0
220410  9:03:33 [Warning] 'user' entry 'root@a505a0296d62' ignored in --skip-name-resolve mode.
220410  9:03:33 [Warning] 'user' entry '@a505a0296d62' ignored in --skip-name-resolve mode.
220410  9:03:33 [Warning] 'proxies_priv' entry '@ root@a505a0296d62' ignored in --skip-name-resolve mode.
220410  9:03:33 [Note] Event Scheduler: Loaded 0 events
220410  9:03:33 [Note] mysqld: ready for connections.
Version: '5.5.62'  socket: '/tmp/mysql.sock'  port: 0  MySQL Community Server (GPL)
Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
220410  9:03:35 [Warning] 'proxies_priv' entry '@ root@a505a0296d62' ignored in --skip-name-resolve mode.
220410  9:03:35 [Note] mysqld: Normal shutdown
220410  9:03:35 [Note] Event Scheduler: Purging the queue. 0 events
220410  9:03:35  InnoDB: Starting shutdown...
220410  9:03:37  InnoDB: Shutdown completed; log sequence number 1595675
220410  9:03:37 [Note] mysqld: Shutdown complete
MySQL init process done. Ready for start up.
220410  9:03:37 [Note] --secure-file-priv is set to NULL. Operations related to importing and exporting data are disabled
220410  9:03:37 [Note] mysqld (mysqld 5.5.62) starting as process 1 ...
220410  9:03:37 [Note] Plugin 'FEDERATED' is disabled.
220410  9:03:37 InnoDB: The InnoDB memory heap is disabled
220410  9:03:37 InnoDB: Mutexes and rw_locks use GCC atomic builtins
220410  9:03:37 InnoDB: Compressed tables use zlib 1.2.11
220410  9:03:37 InnoDB: Using Linux native AIO
220410  9:03:37 InnoDB: Initializing buffer pool, size = 128.0M
220410  9:03:37 InnoDB: Completed initialization of buffer pool
220410  9:03:37 InnoDB: highest supported file format is Barracuda.
220410  9:03:37  InnoDB: Waiting for the background threads to start
220410  9:03:38 InnoDB: 5.5.62 started; log sequence number 1595675
220410  9:03:38 [Note] Server hostname (bind-address): '0.0.0.0'; port: 3306
220410  9:03:38 [Note]   - '0.0.0.0' resolves to '0.0.0.0';
220410  9:03:38 [Note] Server socket created on IP: '0.0.0.0'.
220410  9:03:38 [Warning] 'proxies_priv' entry '@ root@a505a0296d62' ignored in --skip-name-resolve mode.
220410  9:03:38 [Note] Event Scheduler: Loaded 0 events
220410  9:03:38 [Note] mysqld: ready for connections.
Version: '5.5.62'  socket: '/tmp/mysql.sock'  port: 3306  MySQL Community Server (GPL)
[root@localhost /]# 
[root@localhost /]#



#启动mysql
docker run --name mysql -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=123456  mysql:5.5

docker exec -it mysql /bin/bash

#docker-mysql的配置文

```



# docker-compose安装

```shell
#下载
curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#修改权限
chmod +x /usr/local/bin/docker-compose

#创建软连接
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#测试安装是否成功
docker-compose --version
```











