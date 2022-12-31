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