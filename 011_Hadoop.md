# 01安装linux

修改网络：vi /etc/hosts 

​					cat /etc/hosts

重启网络：service notwork resetart

删除：/etc/udev/rules.d  

```
vim /etc/sysconfig/network-scripts/ifcfg-ens33
```



# 安装vim命令

yum -y install vim*

# 02安装jdk

解压

```
vim /etc/profile

tar -xzvf jdk-8u131-linux-x64.tar.gz -C /usr/local/java
```



```
export  JAVA_HOME=/home/soft/jdk1.8.0_144
export  CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
export  PATH=$PATH:${JAVA_HOME}/bin


export  JAVA_HOME=/usr/local/soft/jdk1.8.0_144
export  CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
export  PATH=$PATH:${JAVA_HOME}/bin

```

重新编译文件

```
source /etc/profile

vim /etc/hosts
192.168.79.102 hadoop102
192.168.79.103 hadoop103
192.168.79.104 hadoop104

vim /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=hadoop102
NTPSERVERARGS=iburst
```

## 03安装hadoop

## 03.1单机搭建

1. mkdir  input

2. cp  etc/hadoop/*.xml input

3. bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.2.jar grep input output 'dfs[a-z.]+'

   遇到问题

   java.net.UnknownHostException: Linux: Linux: Name or service not known

   修改

   /etc/hosts 

   加入 Linux 

4. cat output/*

5. mkdir 

启动单个节点

oft/hadoop-2.7.2/logs/hadoop-root-namenode-hadoop103.out
-bash: cd: /home/soft/hadoop-2.7.2/logs/hadoop-root-namenode-hadoop103.out: Not a directory
[root@hadoop103 ~]# vim /home/soft/hadoop-2.7.2/logs/hadoop-root-namenode-hadoop103.out

ulimit -a for user root



## 免密登录配置



/root/.ssh

​	 ssh-keygen -t rsa

​	看见提示就回车

​	拷贝到其他机器上

​     ssh-copy-id hadoop102

​     ssh-copy-id data002

```
#HADOOP_HOME
export HADOOP_HOME=/usr/local/soft/hadoop-2.7.2
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
```

​	hadoop namenode -format

启动namenode

​		hadoop-daemon.sh start namenode

启动datanode

​		hadoop-daemon.sh start datanode

 访问地址：[http://192.168.10.120:50070](http://192.168.10.120:50070/)

访问namenode ：**http:/192.168.10.120:8088**

​							    http://192.168.10.120:8088/cluster

## 启动集群

1. ​	hadoop-daemon.sh start namenode   启动namenode

   ​	starting namenode, logging to /home/soft/hadoop-2.6.5/logs/hadoop-root-namenode-node01.out

2. ​    hadoop namenode -format   格式化硬盘位hdfs

3. ​	hadoop-start.sh

   1. ​	start-dfs.sh  开启dataNode和nameNode

5. ​	start-yarn.sh 开启NodeManager

6.    /etc/sysconfig/network
   NETWORKING=yes
   HOSTNAME=node01
   GATEWAY=192.168.10.2

7. /etc/hosts

# 03HDFS

hdfs的特点

适合多读场景，修改不支持。

优点

​	 	高容错性

​				数据自动保存多个副本。

​	 	适合大数据

​		可构建在廉价的机器上，通过多副本机制，提高可靠性

缺点

​	不适合低延迟时数据访问，比如毫秒级的存储数据，是做不到的。

​    无法高效的对大量小文件进行存储

​    不支持并发写入、文件随机修改

 hadoop组成架构

## Hadoop-HDFS

存储模型：字节

1. 文件线性切割成块（Block）：偏移量offset（byte，中文？）

2. Block分散在存储在集群节点中

3. 单一个文件中Block大小一致，文件与文件可以不一致

4. Block可以设置副本数，副本无序分散在不同节点中

   副本数不要超过节点数量

5. 文件上传可以设置Block大小和副本数（资源不够开辟的进程）

6. 已上传的文件Blokc的副本数可以调整，大小不变

7. 只支持一次写入多次读取，同一时刻只有一个写入者

8. 可以append追加数据

# 04hadoop fs命令分类

本地-》HDFS
    put
    copyFromLocal
    moveFromLocal
    appendToFile
HDFS-》HDFS
    cp
    mv
    chown
    chgrp
    chmod
    mkdir
    du
    df
    cat

HFDS-》本地
    get
    getmerge
    copyToLocal

# 05hadoop的api

1：启动hadoop集群

```
start-dfs.sh  开启dataNode和nameNode

start-yarn.sh 开启NodeManager
```

2：导入pom文件

pom.xml

```.XML
<dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>RELEASE</version>
        </dependency>
        <dependency>
            <groupId>org.apache.logging.log4j</groupId>
            <artifactId>log4j-core</artifactId>
            <version>2.8.2</version>
        </dependency>
        <dependency>
            <groupId>org.apache.hadoop</groupId>
            <artifactId>hadoop-common</artifactId>
            <version>2.7.2</version>
        </dependency>
        <dependency>
            <groupId>org.apache.hadoop</groupId>
            <artifactId>hadoop-client</artifactId>
            <version>2.7.2</version>
        </dependency>
        <dependency>
            <groupId>org.apache.hadoop</groupId>
            <artifactId>hadoop-hdfs</artifactId>
            <version>2.7.2</version>
        </dependency>
        <dependency>
            <groupId>jdk.tools</groupId>
            <artifactId>jdk.tools</artifactId>
            <version>1.8</version>
            <scope>system</scope>
            <systemPath>${JAVA_HOME}/lib/tools.jar</systemPath>
        </dependency>
    </dependencies>
```

3：具体的api类使用

```java
package com.xiaoyang;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.IOUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.experimental.theories.suppliers.TestedOn;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URI;

public class HdfsClient {
    @Test
    public void put(){
        try{
            Configuration configuration = new Configuration();
            FileSystem fs = FileSystem.get(new URI("hdfs://192.168.10.120:9000"), configuration, "root");
            fs.copyFromLocalFile(new Path("d:\\1.txt"),new Path("/"));
            fs.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Test
    public void input(){
        try{
            Configuration configuration = new Configuration();
            FileSystem fs = FileSystem.get(new URI("hdfs://192.168.10.120:9000"), configuration, "root");
            fs.copyToLocalFile(new Path("/1.txt"),new Path("d:\\"));//下载文件
            fs.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Test
    public void rename(){
        try{
            Configuration configuration = new Configuration();
            FileSystem fs = FileSystem.get(new URI("hdfs://192.168.10.120:9000"), configuration, "root");
            fs.rename(new Path("/1.txt"),new Path("/2.txt"));//修改文件名。可以修改目录名
            fs.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    FileSystem fs =null;
    @Before
    public void before(){
        try {
            Configuration configuration = new Configuration();
            fs = FileSystem.get(new URI("hdfs://192.168.10.120:9000"), configuration, "root");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Test
    public void del(){
        try {
           boolean del = fs.delete(new Path("/2.txt"),true);
            System.out.println(del);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @After
    public void after(){
        try {
            fs.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void append(){
        try {
            FSDataOutputStream append = fs.append(new Path("/1.txt"),1024);
            FileInputStream open = new FileInputStream("d:\\1.txt");
            IOUtils.copyBytes(open,append,1024,true);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void ls(){
        try {
            FileStatus[] fileStatuses = fs.listStatus(new Path("/"));
            for (FileStatus fileStatus : fileStatuses    ) {
                System.out.println(fileStatus.getPath());
                System.out.println(fileStatus.getLen());
                System.out.println(fileStatus.getGroup());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void listFiles(){
        try {
            RemoteIterator<LocatedFileStatus> fileStatusRemoteIterator = fs.listFiles(new Path("/"),true);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

```



# 06简述HDSF写流程

分块，NameNode     备份

# 07简述HDSF读流程

连接，读取，下载。

# 08NameNode和SecondaryNameNode

NN和2NN的流程



redis 的持久化策略：RDB和AOF。



hadoop的持久化策略。Fsimage，edits.log



# 09DataNode解析

# 10增加节点

# 11退役节点

# 12Hadoop的实际应用

# 13Hadoop的架构模型

架构模型

1. ​	文件元数据MetaData，文件数据

   ​	元数据

   ​	数据本身

2. (主)NameNode节点保存文件元数据：单节点，Posix

3. (从)DataNode节点保存文件Block数据：多节点

4. DataNode和NameNode保持心跳，提交Block列表

5. HdfsClient与NameNode交互元数据信息

6. HdfsClient与DataNode交互文件Block数据（cs）

7. DataNode利用服务器本地文件系统存储数据块

# 14基本概念

运算框架（要解决的核心问题就是帮用户将处理逻辑在很多机器上并行）

​	MapReduce 离线批处理/Hadoop中的运算框架

​	Spark 离线批处理/实时流式计算

​	Storm 实时流式计算

辅助类的工具(解放大数据工程师的一些繁琐工作)

​	 Flume  数据采集

​	Sqoop  数据迁移

大数据是：

​	有海量的数据

​	有对海量数据进行挖掘的需求

​	有对海量数据进行挖掘的软件工具

# 15hadoop_ha原理

脑裂的错误

使用zk实现ha








# 01什么是MapReduce

分布式运算程序的编程框架

用户编写的业务逻辑代码和自带默认的

# 02MapReduce的优缺点

优点：MapReduce易于编程（简单），良好的扩展性。

​		   它简单的实现一些接口，就可以完成一个分布式程序。

​			高容错性。适合PB级以上海量数据的离线处理。

缺点：不擅长实时计算，不擅长流式计算，不擅长DAG（有向图）计算

# 03MapReduce核心思想

分为两个阶段

​	Map阶段

​	Reduce阶段

![1568470145740](D:\make\02MapReduce\1568470145740.png)

# 04MapReuce的进程

一个完整的MapReduce程序在分布式运行有3类进程

# 05官网中第一个MapRduce程序

官方文档中的例子，

jar包位置：\hadoop-2.7.2\share\hadoop\mapreduce\hadoop-mapreduce-examples-2.7.2.jar

例子程序：WordCount例子，统计单词。

# 06常用的数据序列号类型

# 07第一个MapReduce程序

pom

```xml

```

3个文件

```java

```

测试流程

```

```

# 08Hadoop的序列化

1. 什么是序列化

2. 为啥要序列化

3. 为啥不用Java序列化

   Java的序列化是一个重量级的序列化框架。

4. hadoop的序列化的特点

   紧凑：高效使用存储空间

   快速：读些数据的的额外开销小

   可扩展：随着通信协议的升级而可升级

   互操作：支持多语言的交互

# 09MpaReduce框架原理

Input ----（InputFormat）--》Mapper----（Shuffle）---》Reducer----（OutputFormat）---》Output

MapTask +ReduceTask=原理

## InputFormat

数据切片与MapTask并行读决定机制



文件====》切片=====》变成KV值====》Shuffle

### MapReduce的详细流程



#### 快速排序

#### 多次归并排序

### Shuffle机制

#### Partition分区

​	Partition告诉数据应该由哪个RdeuceTask来处理。

​	分区号不能跳，要连续。防止浪费资源。

#### 排序



# YARN是什么

# YARN的基本架构

# YARN的工作机制

# HDFS,YARN和YARN的联合工作模式

# 资源调度器

# 任务的推测执行























































































































