

# rube安装

/usr/local/bin/redis-server /myredis/redis7005/redis7005.conf

```shell
/usr/local/bin/redis-cli --cluster create 192.168.175.106:7000 192.168.175.106:7001 192.168.175.106:7002 192.168.175.106:7003 192.168.175.106:7004 192.168.175.106:7005 --cluster-replicas 1 -a 123456


#帮助文档
/usr/local/bin/redis-cli -h 192.168.175.105 -p 7000 -a 123456 --cluster help
```





```shell
[root@hadoop104 ~]# /usr/local/bin/redis-cli --cluster create 192.168.175.106:7000 192.168.175.106:7001 192.168.175.106:7002 192.168.175.106:7003 192.168.175.106:7004 192.168.175.106:7005 --cluster-replicas 1 -a 123456
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
>>> Performing hash slots allocation on 6 nodes...
Master[0] -> Slots 0 - 5460
Master[1] -> Slots 5461 - 10922
Master[2] -> Slots 10923 - 16383
Adding replica 192.168.175.106:7004 to 192.168.175.106:7000
Adding replica 192.168.175.106:7005 to 192.168.175.106:7001
Adding replica 192.168.175.106:7003 to 192.168.175.106:7002
>>> Trying to optimize slaves allocation for anti-affinity
[WARNING] Some slaves are in the same host as their master
M: 3f96db60124ba2662f74df78f9367a06de18338f 192.168.175.106:7000
   slots:[0-5460] (5461 slots) master
M: fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 192.168.175.106:7001
   slots:[5461-10922] (5462 slots) master
M: c5545e9166a97fefde1c684c069c5d9792d5ffa0 192.168.175.106:7002
   slots:[10923-16383] (5461 slots) master
S: ac9a087fc2b4b3227ffab84664b89a34af3530f1 192.168.175.106:7003
   replicates 3f96db60124ba2662f74df78f9367a06de18338f
S: 801c380afb39284f3272a5171edb54ee1b0b0f53 192.168.175.106:7004
   replicates fb468ce7f3e3992172dddcd1b2372d16d4d3b67c
S: 241f21876107cb33819ba055e36bfd81f9d7ee80 192.168.175.106:7005
   replicates c5545e9166a97fefde1c684c069c5d9792d5ffa0
Can I set the above configuration? (type 'yes' to accept): yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join
....
>>> Performing Cluster Check (using node 192.168.175.106:7000)
M: 3f96db60124ba2662f74df78f9367a06de18338f 192.168.175.106:7000
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
S: ac9a087fc2b4b3227ffab84664b89a34af3530f1 192.168.175.106:7003
   slots: (0 slots) slave
   replicates 3f96db60124ba2662f74df78f9367a06de18338f
S: 801c380afb39284f3272a5171edb54ee1b0b0f53 192.168.175.106:7004
   slots: (0 slots) slave
   replicates fb468ce7f3e3992172dddcd1b2372d16d4d3b67c
M: fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 192.168.175.106:7001
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
S: 241f21876107cb33819ba055e36bfd81f9d7ee80 192.168.175.106:7005
   slots: (0 slots) slave
   replicates c5545e9166a97fefde1c684c069c5d9792d5ffa0
M: c5545e9166a97fefde1c684c069c5d9792d5ffa0 192.168.175.106:7002
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.



```

```shell
/usr/local/bin/redis-cli -h 192.168.175.106  -p 7000 -a 123456 cluster  nodes

[root@hadoop104 ~]# /usr/local/bin/redis-cli -h 192.168.175.106  -p 7000 -a 123456 cluster  nodes
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
ac9a087fc2b4b3227ffab84664b89a34af3530f1 192.168.175.106:7003@17003 slave 3f96db60124ba2662f74df78f9367a06de18338f 0 1648829412456 4 connected
801c380afb39284f3272a5171edb54ee1b0b0f53 192.168.175.106:7004@17004 slave fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 0 1648829412000 5 connected
fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 192.168.175.106:7001@17001 master - 0 1648829411435 2 connected 5461-10922
3f96db60124ba2662f74df78f9367a06de18338f 192.168.175.106:7000@17000 myself,master - 0 1648829411000 1 connected 0-5460
241f21876107cb33819ba055e36bfd81f9d7ee80 192.168.175.106:7005@17005 slave c5545e9166a97fefde1c684c069c5d9792d5ffa0 0 1648829410000 6 connected
c5545e9166a97fefde1c684c069c5d9792d5ffa0 192.168.175.106:7002@17002 master - 0 1648829411000 3 connected 10923-16383
```



# 集群扩容





启动备用机器

/usr/local/bin/redis-server /myredis/redis7006/redis7006.conf

```shell
Xshell for Xmanager Enterprise 4 (Build 0216)
Copyright (c) 2002-2013 NetSarang Computer, Inc. All rights reserved.

Type `help' to learn how to use Xshell prompt.
Xshell:\> 

Connecting to 192.168.175.106:22...
Connection established.
To escape to local shell, press 'Ctrl+Alt+]'.

Last login: Tue Mar 29 22:43:34 2022 from 192.168.175.100
[root@hadoop104 ~]# 
[root@hadoop104 ~]# reboot

Broadcast message from root@hadoop104
	(/dev/pts/1) at 11:29 ...

The system is going down for reboot NOW!
[root@hadoop104 ~]# 
Connection closed by foreign host.

Type `help' to learn how to use Xshell prompt.
Xshell:\> 

Connecting to 192.168.175.106:22...
Connection established.
To escape to local shell, press 'Ctrl+Alt+]'.

Last login: Fri Apr  1 11:29:01 2022 from 192.168.175.100
[root@hadoop104 ~]# /usr/local/bin/redis-cli -h 192.168.175.105 -p 7000 -a 123456 --cluster help
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
Cluster Manager Commands:
  create         host1:port1 ... hostN:portN
                 --cluster-replicas <arg>
  check          host:port
                 --cluster-search-multiple-owners
  info           host:port
  fix            host:port
                 --cluster-search-multiple-owners
  reshard        host:port
                 --cluster-from <arg>
                 --cluster-to <arg>
                 --cluster-slots <arg>
                 --cluster-yes
                 --cluster-timeout <arg>
                 --cluster-pipeline <arg>
                 --cluster-replace
  rebalance      host:port
                 --cluster-weight <node1=w1...nodeN=wN>
                 --cluster-use-empty-masters
                 --cluster-timeout <arg>
                 --cluster-simulate
                 --cluster-pipeline <arg>
                 --cluster-threshold <arg>
                 --cluster-replace
  add-node       new_host:new_port existing_host:existing_port
                 --cluster-slave
                 --cluster-master-id <arg>
  del-node       host:port node_id
  call           host:port command arg arg .. arg
  set-timeout    host:port milliseconds
  import         host:port
                 --cluster-from <arg>
                 --cluster-copy
                 --cluster-replace
  help           

For check, fix, reshard, del-node, set-timeout you can specify the host and port of any working node in the cluster.

[root@hadoop104 ~]# 
[root@hadoop104 ~]# cd /myredis/
[root@hadoop104 myredis]# ll
total 444
-rw-r--r--. 1 root root   5771 Mar 25 11:30 appendonly.aof
-rw-r--r--. 1 root root   4495 Mar 25 11:32 dump104.rdb
drwxr-xr-x. 2 root root   4096 Mar 25 10:51 logs
-rw-r--r--. 1 root root 350370 Mar 25 22:26 redis104.log
-rw-r--r--. 1 root root  62145 Mar 25 11:30 redis.conf
-rw-r--r--. 1 root root  10130 Mar 29 22:48 sentinel.conf
[root@hadoop104 myredis]# cd ..
[root@hadoop104 /]# rm -rf myredis/
[root@hadoop104 /]# ll
total 98
dr-xr-xr-x.   2 root root  4096 Mar 25 03:31 bin
dr-xr-xr-x.   5 root root  1024 Jun  1  2021 boot
drwxr-xr-x.  19 root root  3800 Apr  1 11:29 dev
drwxr-xr-x. 115 root root 12288 Apr  1 11:29 etc
drwxr-xr-x.   4 root root  4096 Jun  1  2021 home
dr-xr-xr-x.  11 root root  4096 Mar 25 03:03 lib
dr-xr-xr-x.   9 root root 12288 Mar 25 03:31 lib64
drwx------.   2 root root 16384 Jun  1  2021 lost+found
drwxr-xr-x.   3 root root  4096 Apr  1 11:27 media
drwxr-xr-x.   2 root root     0 Apr  1 11:29 misc
drwxr-xr-x.   2 root root  4096 Sep 23  2011 mnt
drwxr-xr-x.   2 root root     0 Apr  1 11:29 net
drwxr-xr-x.   3 root root  4096 Jun  1  2021 opt
dr-xr-xr-x. 131 root root     0 Apr  1 11:29 proc
dr-xr-x---.  27 root root  4096 Apr  1 11:30 root
dr-xr-xr-x.   2 root root 12288 Mar 25 03:31 sbin
drwxr-xr-x.   7 root root     0 Apr  1 11:29 selinux
drwxr-xr-x.   2 root root  4096 Sep 23  2011 srv
drwxr-xr-x.  13 root root     0 Apr  1 11:29 sys
drwxrwxrwt.  10 root root  4096 Apr  1 11:29 tmp
drwxr-xr-x.  13 root root  4096 Jun  1  2021 usr
drwxr-xr-x.  22 root root  4096 Jun  1  2021 var
[root@hadoop104 /]# mkdir
mkdir: missing operand
Try `mkdir --help' for more information.
[root@hadoop104 /]# mkdir myredis
[root@hadoop104 /]# 
[root@hadoop104 /]# cd myredis/
[root@hadoop104 myredis]# ll
total 0
[root@hadoop104 myredis]# mkdir redis
[root@hadoop104 myredis]# mkdir redis7000
[root@hadoop104 myredis]# mkdir redis7001
[root@hadoop104 myredis]# mkdir redis7002
[root@hadoop104 myredis]# mkdir redis7003
[root@hadoop104 myredis]# mkdir redis7004
[root@hadoop104 myredis]# mkdir redis7005
[root@hadoop104 myredis]# mkdir redis7006
[root@hadoop104 myredis]# mkdir redis7007
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# ll
total 36
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7000
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7001
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7002
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7003
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7004
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7005
drwxr-xr-x. 2 root root 4096 Apr  1 11:35 redis7006
drwxr-xr-x. 2 root root 4096 Apr  1 11:35 redis7007
[root@hadoop104 myredis]# rm -rf redis
[root@hadoop104 myredis]# ll
total 32
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7000
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7001
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7002
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7003
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7004
drwxr-xr-x. 2 root root 4096 Apr  1 11:34 redis7005
drwxr-xr-x. 2 root root 4096 Apr  1 11:35 redis7006
drwxr-xr-x. 2 root root 4096 Apr  1 11:35 redis7007
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# cd redis7000/
[root@hadoop104 redis7000]# ll
total 0
[root@hadoop104 redis7000]# vim 1.txt
[root@hadoop104 redis7000]# ll
total 4
-rw-r--r--. 1 root root 2 Apr  1 11:41 1.txt
[root@hadoop104 redis7000]# ll
total 68
-rw-r--r--. 1 root root     2 Apr  1 11:41 1.txt
-rw-r--r--. 1 root root 62181 Apr  1 11:41 redis7000.conf
[root@hadoop104 redis7000]# rm -rf 1.txt 
[root@hadoop104 redis7000]# ll
total 64
-rw-r--r--. 1 root root 62181 Apr  1 11:41 redis7000.conf
[root@hadoop104 redis7000]# 
[root@hadoop104 redis7000]# cd ..
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# sed 's/7000/7001/g' /myredis/redis7000/redis7000.conf > /myredis/redis7001/redis7001.conf
[root@hadoop104 myredis]# sed 's/7000/7002/g' /myredis/redis7000/redis7000.conf > /myredis/redis7002/redis7002.conf
[root@hadoop104 myredis]# sed 's/7000/7003/g' /myredis/redis7000/redis7000.conf > /myredis/redis7003/redis7003.conf
[root@hadoop104 myredis]# sed 's/7000/7004/g' /myredis/redis7000/redis7000.conf > /myredis/redis7004/redis7004.conf
[root@hadoop104 myredis]# sed 's/7000/7005/g' /myredis/redis7000/redis7000.conf > /myredis/redis7005/redis7005.conf
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# ll
total 32
drwxr-xr-x. 2 root root 4096 Apr  1 11:41 redis7000
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7001
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7002
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7003
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7004
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7005
drwxr-xr-x. 2 root root 4096 Apr  1 11:35 redis7006
drwxr-xr-x. 2 root root 4096 Apr  1 11:35 redis7007
[root@hadoop104 myredis]# cd redis7005/
[root@hadoop104 redis7005]# ll
total 64
-rw-r--r--. 1 root root 62181 Apr  1 11:42 redis7005.conf
[root@hadoop104 redis7005]# 
[root@hadoop104 redis7005]# cd ,,
-bash: cd: ,,: No such file or directory
[root@hadoop104 redis7005]# cd ..
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# lol
-bash: lol: command not found
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# ll
total 32
drwxr-xr-x. 2 root root 4096 Apr  1 11:41 redis7000
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7001
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7002
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7003
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7004
drwxr-xr-x. 2 root root 4096 Apr  1 11:42 redis7005
drwxr-xr-x. 2 root root 4096 Apr  1 11:35 redis7006
drwxr-xr-x. 2 root root 4096 Apr  1 11:35 redis7007
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7000/redis7000.conf
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7001/redis7001.conf
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7002/redis7002.conf
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7003/redis7003.conf
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7004/redis7004.conf
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7005/redis7005.conf
[root@hadoop104 myredis]# ps -ef | grep redis
root       2081      1  0 11:46 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7000 [cluster]   
root       2087      1  0 11:47 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7001 [cluster]   
root       2092      1  0 11:47 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7002 [cluster]   
root       2097      1  0 11:47 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7003 [cluster]   
root       2102      1  0 11:47 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7004 [cluster]   
root       2107      1  0 11:47 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7005 [cluster]   
root       2112   1972  0 11:47 pts/0    00:00:00 grep redis
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# cd redis7006/
[root@hadoop104 redis7006]# ll
total 0
[root@hadoop104 redis7006]# sed 's/7000/7006/g' /myredis/redis7000/redis7000.conf > /myredis/redis7006/redis7006.conf
[root@hadoop104 redis7006]# ll
total 64
-rw-r--r--. 1 root root 62181 Apr  1 12:17 redis7006.conf
[root@hadoop104 redis7006]# 
[root@hadoop104 redis7006]# cd ..
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7006/redis7006.conf 
[root@hadoop104 myredis]# ps -ef | grep redis
root       2081      1  0 11:46 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7000 [cluster]   
root       2087      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7001 [cluster]   
root       2092      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7002 [cluster]   
root       2097      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7003 [cluster]   
root       2102      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7004 [cluster]   
root       2107      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7005 [cluster]   
root       2515      1  0 12:18 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7006 [cluster]   
root       2520   1972  0 12:18 pts/0    00:00:00 grep redis
[root@hadoop104 myredis]# /usr/local/bin/redis-cli --cluster add-node 192.168.175.106:7006 192.168.175.106:7000
>>> Adding node 192.168.175.106:7006 to cluster 192.168.175.106:7000
[ERR] Node 192.168.175.106:7000 NOAUTH Authentication required.
[root@hadoop104 myredis]# /usr/local/bin/redis-cli --cluster add-node 192.168.175.106:7006 192.168.175.106:7000 -a 123456
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
>>> Adding node 192.168.175.106:7006 to cluster 192.168.175.106:7000
>>> Performing Cluster Check (using node 192.168.175.106:7000)
M: 3f96db60124ba2662f74df78f9367a06de18338f 192.168.175.106:7000
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
S: ac9a087fc2b4b3227ffab84664b89a34af3530f1 192.168.175.106:7003
   slots: (0 slots) slave
   replicates 3f96db60124ba2662f74df78f9367a06de18338f
S: 801c380afb39284f3272a5171edb54ee1b0b0f53 192.168.175.106:7004
   slots: (0 slots) slave
   replicates fb468ce7f3e3992172dddcd1b2372d16d4d3b67c
M: fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 192.168.175.106:7001
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
S: 241f21876107cb33819ba055e36bfd81f9d7ee80 192.168.175.106:7005
   slots: (0 slots) slave
   replicates c5545e9166a97fefde1c684c069c5d9792d5ffa0
M: c5545e9166a97fefde1c684c069c5d9792d5ffa0 192.168.175.106:7002
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
>>> Send CLUSTER MEET to node 192.168.175.106:7006 to make it join the cluster.
[OK] New node added correctly.
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# sed 's/7000/7007/g' /myredis/redis7000/redis7000.conf > /myredis/redis7007/redis7007.conf
[root@hadoop104 myredis]# ll
total 32
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7000
-rw-r--r--. 1 root root    0 Apr  1 11:46 redis7000.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7001
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7001.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7002
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7002.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7003
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7003.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7004
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7004.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7005
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7005.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:18 redis7006
-rw-r--r--. 1 root root    0 Apr  1 12:18 redis7006.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:23 redis7007
[root@hadoop104 myredis]# cd redis700
-bash: cd: redis700: No such file or directory
[root@hadoop104 myredis]# cd redis7007/
[root@hadoop104 redis7007]# ll
total 64
-rw-r--r--. 1 root root 62181 Apr  1 12:23 redis7007.conf
[root@hadoop104 redis7007]# 
[root@hadoop104 redis7007]# cd ..
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7007/
2538:C 01 Apr 2022 12:24:28.060 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
2538:C 01 Apr 2022 12:24:28.060 # Redis version=5.0.4, bits=64, commit=00000000, modified=0, pid=2538, just started
2538:C 01 Apr 2022 12:24:28.060 # Configuration loaded
2538:M 01 Apr 2022 12:24:28.060 * Increased maximum number of open files to 10032 (it was originally set to 1024).
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 5.0.4 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                   
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 2538
  `-._    `-._  `-./  _.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |           http://redis.io        
  `-._    `-._`-.__.-'_.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |                                  
  `-._    `-._`-.__.-'_.-'    _.-'                                   
      `-._    `-.__.-'    _.-'                                       
          `-._        _.-'                                           
              `-.__.-'                                               

2538:M 01 Apr 2022 12:24:28.061 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
2538:M 01 Apr 2022 12:24:28.061 # Server initialized
2538:M 01 Apr 2022 12:24:28.061 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
2538:M 01 Apr 2022 12:24:28.061 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
2538:M 01 Apr 2022 12:24:28.061 * Ready to accept connections
c^H^C2538:signal-handler (1648830274) Received SIGINT scheduling shutdown...
2538:M 01 Apr 2022 12:24:34.847 # User requested shutdown...
2538:M 01 Apr 2022 12:24:34.847 # Redis is now ready to exit, bye bye...
[root@hadoop104 myredis]# ^C
[root@hadoop104 myredis]# ^C
[root@hadoop104 myredis]# ^C
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7007/redis7007.conf '
> ^C
[root@hadoop104 myredis]# ^C
[root@hadoop104 myredis]# ^C
[root@hadoop104 myredis]# /usr/local/bin/redis-server /myredis/redis7007/redis7007.conf
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# ll
total 32
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7000
-rw-r--r--. 1 root root    0 Apr  1 11:46 redis7000.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7001
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7001.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7002
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7002.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7003
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7003.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7004
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7004.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:06 redis7005
-rw-r--r--. 1 root root    0 Apr  1 11:47 redis7005.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:18 redis7006
-rw-r--r--. 1 root root    0 Apr  1 12:18 redis7006.log
drwxr-xr-x. 2 root root 4096 Apr  1 12:24 redis7007
-rw-r--r--. 1 root root    0 Apr  1 12:24 redis7007.log
[root@hadoop104 myredis]# 
[root@hadoop104 myredis]# ps -ef | grpe redis
-bash: grpe: command not found
[root@hadoop104 myredis]# ps -ef | grep redis
root       2081      1  0 11:46 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7000 [cluster]   
root       2087      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7001 [cluster]   
root       2092      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7002 [cluster]   
root       2097      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7003 [cluster]   
root       2102      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7004 [cluster]   
root       2107      1  0 11:47 ?        00:00:02 /usr/local/bin/redis-server 192.168.175.106:7005 [cluster]   
root       2515      1  0 12:18 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7006 [cluster]   
root       2544      1  0 12:24 ?        00:00:00 /usr/local/bin/redis-server 192.168.175.106:7007 [cluster]   
root       2552   1972  0 12:25 pts/0    00:00:00 grep redis
[root@hadoop104 myredis]# /usr/local/bin/redis-cli -h 192.168.175.106  -p 7000 -a 123456 cluster  nodes
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
2f7d62231a162df4f9603ae7cf17249d68e36ea3 192.168.175.106:7006@17006 master - 0 1648830335222 0 connected
ac9a087fc2b4b3227ffab84664b89a34af3530f1 192.168.175.106:7003@17003 slave 3f96db60124ba2662f74df78f9367a06de18338f 0 1648830336242 4 connected
801c380afb39284f3272a5171edb54ee1b0b0f53 192.168.175.106:7004@17004 slave fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 0 1648830334000 5 connected
fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 192.168.175.106:7001@17001 master - 0 1648830334203 2 connected 5461-10922
3f96db60124ba2662f74df78f9367a06de18338f 192.168.175.106:7000@17000 myself,master - 0 1648830333000 1 connected 0-5460
241f21876107cb33819ba055e36bfd81f9d7ee80 192.168.175.106:7005@17005 slave c5545e9166a97fefde1c684c069c5d9792d5ffa0 0 1648830333184 6 connected
c5545e9166a97fefde1c684c069c5d9792d5ffa0 192.168.175.106:7002@17002 master - 0 1648830334000 3 connected 10923-16383
[root@hadoop104 myredis]# /usr/local/bin/redis-cli --cluster add-node 192.168.175.106:7007 192.168.175.106:7000 --cluster-slave --cluster-mester-id 3f96db60124ba2662f74df78f9367a06de18338f
Unrecognized option or bad number of args for: '--cluster-mester-id'
[root@hadoop104 myredis]# /usr/local/bin/redis-cli --cluster add-node 192.168.175.106:7007 192.168.175.106:7000 --cluster-slave --cluster-master-id 3f96db60124ba2662f74df78f9367a06de18338f
>>> Adding node 192.168.175.106:7007 to cluster 192.168.175.106:7000
[ERR] Node 192.168.175.106:7000 NOAUTH Authentication required.
[root@hadoop104 myredis]# /usr/local/bin/redis-cli --cluster add-node 192.168.175.106:7007 192.168.175.106:7000 --cluster-slave --cluster-master-id 3f96db60124ba2662f74df78f9367a06de18338f -a 123456
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
>>> Adding node 192.168.175.106:7007 to cluster 192.168.175.106:7000
>>> Performing Cluster Check (using node 192.168.175.106:7000)
M: 3f96db60124ba2662f74df78f9367a06de18338f 192.168.175.106:7000
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
M: 2f7d62231a162df4f9603ae7cf17249d68e36ea3 192.168.175.106:7006
   slots: (0 slots) master
S: ac9a087fc2b4b3227ffab84664b89a34af3530f1 192.168.175.106:7003
   slots: (0 slots) slave
   replicates 3f96db60124ba2662f74df78f9367a06de18338f
S: 801c380afb39284f3272a5171edb54ee1b0b0f53 192.168.175.106:7004
   slots: (0 slots) slave
   replicates fb468ce7f3e3992172dddcd1b2372d16d4d3b67c
M: fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 192.168.175.106:7001
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
S: 241f21876107cb33819ba055e36bfd81f9d7ee80 192.168.175.106:7005
   slots: (0 slots) slave
   replicates c5545e9166a97fefde1c684c069c5d9792d5ffa0
M: c5545e9166a97fefde1c684c069c5d9792d5ffa0 192.168.175.106:7002
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
>>> Send CLUSTER MEET to node 192.168.175.106:7007 to make it join the cluster.
Waiting for the cluster to join

>>> Configure node as replica of 192.168.175.106:7000.
[OK] New node added correctly.
[root@hadoop104 myredis]# 
```



sed 's/7000/7006/g' /myredis/redis7000/redis7000.conf > /myredis/redis7006/redis7006.conf

sed 's/7000/7007/g' /myredis/redis7000/redis7000.conf > /myredis/redis7007/redis7007.conf



3f96db60124ba2662f74df78f9367a06de18338f

# 槽的迁移（数据迁移）

```shell
/usr/local/bin/redis-cli --cluster reshard 192.168.175.106:7000 -a 123456
4096 * 4
迁移id
all
yes

#重点
/usr/local/bin/redis-cli -h 192.168.175.106  -p 7000 -a 123456 cluster  nodes

[root@hadoop104 myredis]# /usr/local/bin/redis-cli -h 192.168.175.106  -p 7000 -a 123456 cluster  nodes
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
2f7d62231a162df4f9603ae7cf17249d68e36ea3 192.168.175.106:7006@17006 master - 0 1648836381000 7 connected 0-1364 5461-6826 10923-12287
ac9a087fc2b4b3227ffab84664b89a34af3530f1 192.168.175.106:7003@17003 slave 3f96db60124ba2662f74df78f9367a06de18338f 0 1648836378381 4 connected
801c380afb39284f3272a5171edb54ee1b0b0f53 192.168.175.106:7004@17004 slave fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 0 1648836380427 5 connected
fb468ce7f3e3992172dddcd1b2372d16d4d3b67c 192.168.175.106:7001@17001 master - 0 1648836379000 2 connected 6827-10922
6ccd1be689ceedd881426106770507161491e16d 192.168.175.106:7007@17007 slave 2f7d62231a162df4f9603ae7cf17249d68e36ea3 0 1648836381447 7 connected
3f96db60124ba2662f74df78f9367a06de18338f 192.168.175.106:7000@17000 myself,master - 0 1648836380000 1 connected 1365-5460
241f21876107cb33819ba055e36bfd81f9d7ee80 192.168.175.106:7005@17005 slave c5545e9166a97fefde1c684c069c5d9792d5ffa0 0 1648836380000 6 connected
c5545e9166a97fefde1c684c069c5d9792d5ffa0 192.168.175.106:7002@17002 master - 0 1648836382464 3 connected 12288-16383
```



# 节点下线



# 故障转移









