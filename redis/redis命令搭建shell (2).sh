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