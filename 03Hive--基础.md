# 01:Hive基本概念

将HQL转换为MapReduce程序：

​	Hive的数据存储在Hdfs上

​	hive分析数据传递称的实现是MapReduce

​	执行程序运行在YARN上



Hive的架构



Hive常用于数据分析，对实实时性要求不高



Hive和数据库比较

​		查询语言

​	    数据存储位置

​		数据更新

​	 	索引

​		执行

​		执行延迟

# 02Hive安装准备

版本，新特性

安装准备

​	启动hadoop

```shell
#在hadoop102上启动dataNode和nameNode
start-dfs.sh  

#在hadoop103上开启ResourceManager
start-yarn.sh 
```

```
Hadoop的各个Web界面的地址和接口
2019-08-26 16:39:11
1、HDFS页面：50070
2、YARN的管理界面：8088
3、HistoryServer的管理界面：19888
4、Zookeeper的服务端口号：2181
5、Mysql的服务端口号：3306
6、Hive.server1=10000
7、Kafka的服务端口号：9092
8、azkaban界面：8443
9、Hbase界面：16010,60010
10、Spark的界面：8080
11、Spark的URL：7077
```



安装

​	tar -zxvf  

配置文件  #cat hive-env.sh 

```shell
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set Hive and Hadoop environment variables here. These variables can be used
# to control the execution of Hive. It should be used by admins to configure
# the Hive installation (so that users do not have to set environment variables
# or set command line parameters to get correct behavior).
#
# The hive service being invoked (CLI/HWI etc.) is available via the environment
# variable SERVICE


# Hive Client memory usage can be an issue if a large number of clients
# are running at the same time. The flags below have been useful in 
# reducing memory usage:
#
# if [ "$SERVICE" = "cli" ]; then
#   if [ -z "$DEBUG" ]; then
#     export HADOOP_OPTS="$HADOOP_OPTS -XX:NewRatio=12 -Xms10m -XX:MaxHeapFreeRatio=40 -XX:MinHeapFreeRatio=15 -XX:+UseParNewGC -XX:-UseGCOverheadLimit"
#   else
#     export HADOOP_OPTS="$HADOOP_OPTS -XX:NewRatio=12 -Xms10m -XX:MaxHeapFreeRatio=40 -XX:MinHeapFreeRatio=15 -XX:-UseGCOverheadLimit"
#   fi
# fi

# The heap size of the jvm stared by hive shell script can be controlled via:
#
# export HADOOP_HEAPSIZE=1024
#
# Larger heap size may be required when running queries over large number of files or partitions. 
# By default hive shell scripts use a heap size of 256 (MB).  Larger heap size would also be 
# appropriate for hive server (hwi etc).


# Set HADOOP_HOME to point to a specific hadoop install directory
#hadoop的地址
 HADOOP_HOME=/home/soft/hadoop-2.7.2

# Hive Configuration Directory can be controlled by:
# hive 配置地址
export HIVE_CONF_DIR=/home/soft/hive/conf

# Folder containing extra ibraries required for hive compilation/execution can be controlled by:
# export HIVE_AUX_JARS_PATH=
```

使用hadoop来创建hadoop库文件

​		bin/hadoop fs -mkdir /tmp

​		bin/hadoop fs -chmod g+w /tmp

​	    bin/hadoop fs -mkdir -p /user/hive/warehouse

​		bin/hadoop fs -chmod g+w /user/hive/warehouse

启动hive 

​	bin/hive

​	bin/hive  启动 hive命令

查询数据库

​	show database；

打开默认数据库

​	use default;

显示default中的表

​	show tables;

创建一张表

​	 create  table student(id int,name string)  ;

​	 create  table student(id int,name string)  row format delimited fields terminated by '\t';

查看表的结构

​	desc student;

插入数据

​	insert  into student values(001,'caoxiaoyang');

​	插入的时候，使用hadoop的hdfs

查询表中的数据

​	select  *from studnet;

退出hive

​	quit;

# 03将本地文件导入到hive中

创建表

```sql
create table student(id int, name string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
```

```sql
load data local inpath '/home/soft/datas/student.txt' into table student;
```



# 04数据库的基本使用

## 安装MySql

```shell
#先查看是否安装mysql
rpm -qa|grep mysql
#卸载
rpm -e --nodeps mysql-libs-5.1.73-7.el6.x86_64
#解压mysql-libs.zip
unzip mysql-libs.zip
ls
mysql-libs.zip
mysql-libs
#进入my-libs
cd ./my-libs
#查看mysql-lib文件
cd /home/soft/tar/mysql-libs
[root@hadoop102 mysql-libs]# ll
total 76052
-rw-r--r--. 1 root root 18509960 Mar 26  2015 MySQL-client-5.6.24-1.el6.x86_64.rpm
drwxr-xr-x. 4 root root     4096 Oct 23  2013 mysql-connector-java-5.1.27
-rw-r--r--. 1 root root  3575135 Dec  1  2013 mysql-connector-java-5.1.27.tar.gz
-rw-r--r--. 1 root root 55782196 Mar 26  2015 MySQL-server-5.6.24-1.el6.x86_64.rpm
#安装mysql服务器
rpm -ivh MySQL-server-5.6.24-1.el6.x86_64.rpm
#查看安装mysql中产生的随机密码
cat /root/.mysql_secret
#查看安装mysql后的状态
service mysql status
[root@hadoop102 mysql-libs]# service mysql status
MySQL is not running                                       [FAILED]
#启动mysql服务器
service mysql start
[root@hadoop102 mysql-libs]# service mysql status
MySQL running (1822)
```

安装MySql

```shell
#安装mysql客户端
rpm -ivh MySQL-client-5.6.24-1.el6.x86_64.rpm
#链接mysql
mysql -uroot -p (随机密码 cat /root/.mysql_secret)
#修改密码
SET PASSWORD=PASSWORD('123456');
#退出mysql
exit
```

## 使用MySQL中user表中主机配置

```shell
#进入mysql
mysql -uroot -p123456
#显示数据库
show databases;
#使用数据库
use mysql;
#展示mysql数据库中的所有表
show databases;
#展示user表结构
desc user;
#查询user表
select User, Host, Password from user;
#修改user表。把host表内容修改为%
update user set host='%' where host='localhost';
#删除root用户的其他host
mysql>delete from user where Host='hadoop102';
mysql>delete from user where Host='127.0.0.1';
mysql>delete from user where Host='::1';
#刷新
mysql>flush privileges;
#退出
quit;
```

## hive元数据配置到Mysql

```shell
#解压
tar -zxvf mysql-connector-java-5.1.27.tar.gz
#复制驱动
cp mysql-connector-java-5.1.27-bin.jar  /home/soft/hive/lib/
#在/home/soft/hive/config/创建hive-site.xml
touch hive-site.xml

#编辑hive-site.xml

<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>javax.jdo.option.ConnectionURL</name>
        <value>jdbc:mysql://hadoop102:3306/metastore?createDatabaseIfNotExist=true</value>
        <description>JDBC connect string for a JDBC metastore</description>
    </property>

    <property>
        <name>javax.jdo.option.ConnectionDriverName</name>
        <value>com.mysql.jdbc.Driver</value>
        <description>Driver class name for a JDBC metastore</description>
    </property>

    <property>
        <name>javax.jdo.option.ConnectionUserName</name>
        <value>root</value>
        <description>username to use against metastore database</description>
    </property>

    <property>
        <name>javax.jdo.option.ConnectionPassword</name>
        <value>123456</value>
        <description>password to use against metastore database</description>
    </property>
</configuration>
```



mysql  -uroot -p123456

mysql表中主机配置

​	use mysql;

​	select host,user,password from user;

+------+------+-------------------------------------------+
| host | user | password                                  |
+------+------+-------------------------------------------+
| %    | root | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
+------+------+-------------------------------------------+
1 row in set (0.00 sec)

## 配置hive元数据到MySQL（重要）

```

bin/hiveserver2

bin/beeline

!connect jdbc:hive2://hadoop102:10000
root
回车
```



## HiveJDBC访问

service mysql status    查看本机 mysql启动状态

bin/hive -e  'select *from student;'  不启动hive,直接查询结果

bin/hive -f ./hsql.sql   使用外部的sql文件查询结果.



hive中查看hdfs文件系统中的内容

dfs  -lsr /user;

# 05一些基本命令操作

## 查看本地系统中的内容。

!ls  /opt;

## 查看hive 历史运行的命令	

```shell
[root@node01 ~]# cat .hivehistory 

```

## 显示当前数据库，以及查询表的头信息配置

```xml
<!-- 显示当前数据库，以及查询表的头信息配置 -->
<property>
	<name>hive.cli.print.header</name>
	<value>true</value>
</property>

<property>
	<name>hive.cli.print.current.db</name>
	<value>true</value>
</property>
```

## 查看hive所有的配置信息

set;    -- 查看hive所有的配置信息

```xml
<property>
	<name>hive.cli.print.header</name>
	<value>true</value>
</property>

<property>
	<name>hive.cli.print.current.db</name>
	<value>true</value>
</property>
```





```xml
<property>
<name>hive.metastore.warehouse.dir</name>
<value>/user/hive/warehouse</value>
<description>location of default database for the warehouse</description>
</property>
```





## 修改hive中的默认日志配置

​	mv  hive-log4j.properties.temp  hive-log4j.properties

​    vi  hive-log4j.properties

```properties
hive.log.threshold=ALL 
hive.root.logger=INFO,DRFA
hive.log.dir=/home/soft/hive/logs
hive.log.file=hive.log
```

## 配置的优先级

文件配置





# 06数据类型

基本数据类型

集合数据类型

# 07DDL数据定义

## 创建数据库

```
hdfs safemode -get

bin/hiveserver2


bin/beeline

!connect jdbc:hive2://hadoop102:10000
root
回车
```

  创建数据库

​		create database db_hive;

   创建数据库，如果存在则不创建

​    	create database if not exists db_hive;

​	创建数据库，指定创建位置

​    		create database if not exists db_hive2

​			location ' /db_hive2.db'  ---/为hadoop下的目录，查看地址为[http://192.168.10.120:50070](http://192.168.10.120:50070/)

## 修改数据库

​	  只能修改配置信息，不能修改数据库名和数据库所在位置。

​		 desc database db_hive

​	  在mysql中查看修改结果

​     	desc database extended db_hive

​	 查询数据库

​		show databases;

​		show databases like 'db*'

​     显示数据库信息。

​		desc db_hive;

​		use db_hive;

​		show tables;

## 删除数据库

​	删除空数据库

​      drop database db_hive;

​	  drop database  if exists db_hive;

​	  show databases;

​	删除有数据的数据库

​		 drop database if exists  db_hive cascade;

## 创建表 

### 内部表管理表	

​	创建表语句

```sql
create table if not exists student2(
    id int,
    name string
)
row format delimited fields terminated by '\t'
stored as textfile
location '/user/hive/warehouse/db_hive.db/student2';

#删除hadoop里面的目录文件
hadoop fs -rm /user/hive/warehouse/student2
#删除hadoop里面的目录文件(加入了-r 选项 循环删除)
hadoop fs -rm -r /user
/*location 表示的是数据在hadoop的位置**/
```

 

```sql

#删除表及数据# 迁移数据，相当于生成备份表
create table if not exists student
as select id, name from student2;

# 只创建表不迁移数据。
create table if not exists student4 like student;

#查看详情
desc formatted student2;

#删除表及数据
drop table student;

#
hadoop fs -put ./student.txt /student
```

​	

外部表

外部表：项目组可以同时操作一个表，主要进行查询。	

创建外部表。 

```sql
hadoop fs -mkdir /student
hadoop fs -put  /home/soft/student.txt /student
create table student6(
    id int,
    name string
)
row format delimited fields terminated by '\t'
stored as textfile
location '/student';
drop table student6;


-- external
hadoop fs -mkdir /student
hadoop fs -put  /home/soft/student.txt /student
create external table student6(
    id int,
    name string
)
row format delimited fields terminated by '\t'
stored as textfile
location '/student';
```

### 管理表和内部表转换



### 分区表

创建分区表。

```sql
-- partitioned by (month string)
-- 创建一级分区表
create table dept_partition(
    deptno int, 
    dname string, 
    loc string
 ) partitioned by (month string)
 row format delimited fields terminated by '\t';
 #加载数据到分区表
load data local input '/home/soft/datas/dept.txt'
into table default.dept_partition partition(month='201709')

# 指定查询分区表中的数据 
select * from dept_partition where month = '201709';

# 联合查询
select * from dept_partition where month = '201709'
union
select * from dept_partition where month = '201708';

#增加分区


#删除分区


#创建二级分区表
create table dept_partition2(
    deptno int, 
    dname string, 
    loc string
 ) partitioned by (month string,day string)
 row format delimited fields terminated by '\t';
 
 #分区表需要注意的事情
 HDFS中有数据
 hive中创建了表但是没有数据
 
 #haiv 只是改变了HDFS中数据的表现样式
 
```

# 08DML数据库定义  

## 数据导入

#### 	   第一种方式向hive导入数据

​		加载本地文件到hive

```sql
-- 加载本地文件到hive
load data local inpath /home/soft/student.txt into student; 
load data local inpath '/home/soft/student.txt' into table default.student;
load data local inpath '本地文件地址' into table 数据库名称.数据库表名称 -- local 表示从linux系统上上传

--- 加载hdfs文件到hive    
hadoop fs -put /home/soft/student.txt  / --上传数据到hdfs中

create table student(id string, name string) row format delimited fields terminated by '\t';

load data inpath '/student.txt' into table student;

------------------------------------------------------------------------------------------------------
hadoop fs -mkdir /student  -- 在hdfs下创建stdent目录  注意目录的权限问题
hadoop fs -put  /home/soft/student.txt /student --上传本地/home/soft/student.txt 文件到 hdfs /student目录下。

create table student6(
    id int,
    name string
)
row format delimited fields terminated by '\t'
stored as textfile
location '/student';


--   加载数据覆盖表中已有数据  overwrite
load data local input /home/soft/student.txt overwrite into table student
```

####   第二种方式向hive导入数据

insert 方式进行数据导入

```sql
-- 创建分区表
-- partitioned
create table student7(
     id int, name string
) partitioned by (month string)
row format delimited fields terminated by '\t';

insert into table student7 partition(month ='201709') values(100,'张三');
#执行 这个语句会产生启动map
/**
0: jdbc:hive2://hadoop102:10000> insert into table student7 partition(month ='201709') values(100,'张三');
INFO  : Number of reduce tasks is set to 0 since there's no reduce operator
INFO  : number of splits:1
INFO  : Submitting tokens for job: job_1649984531147_0001
INFO  : The url to track the job: http://hadoop103:8088/proxy/application_1649984531147_0001/
INFO  : Starting Job = job_1649984531147_0001, Tracking URL = http://hadoop103:8088/proxy/application_1649984531147_0001/
INFO  : Kill Command = /home/soft/hadoop-2.7.2/bin/hadoop job  -kill job_1649984531147_0001
INFO  : Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
INFO  : 2022-04-15 02:12:56,326 Stage-1 map = 0%,  reduce = 0%
INFO  : 2022-04-15 02:13:01,466 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 2.11 sec
INFO  : MapReduce Total cumulative CPU time: 2 seconds 110 msec
INFO  : Ended Job = job_1649984531147_0001
INFO  : Stage-4 is selected by condition resolver.
INFO  : Stage-3 is filtered out by condition resolver.
INFO  : Stage-5 is filtered out by condition resolver.
INFO  : Moving data to: hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/student7/month=201709/.hive-staging_hive_2022-04-15_02-12-49_377_6928154102701663989-1/-ext-10000 from hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/student7/month=201709/.hive-staging_hive_2022-04-15_02-12-49_377_6928154102701663989-1/-ext-10002
INFO  : Loading data to table db_hive.student7 partition (month=201709) from hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/student7/month=201709/.hive-staging_hive_2022-04-15_02-12-49_377_6928154102701663989-1/-ext-10000
INFO  : Partition db_hive.student7{month=201709} stats: [numFiles=1, numRows=1, totalSize=7, rawDataSize=6]
No rows affected (13.349 seconds)
*/

# 导入数据 （备份数据）
insert overwrite table student7 partition(month='201708') select id,name from student7 where month='201709';
/**
执行过程
0: jdbc:hive2://hadoop102:10000> insert overwrite table student7 partition(month='201708') select id,name from student7 where month='201709';

INFO  : Number of reduce tasks is set to 0 since there's no reduce operator
INFO  : number of splits:1
INFO  : Submitting tokens for job: job_1649984531147_0003
INFO  : The url to track the job: http://hadoop103:8088/proxy/application_1649984531147_0003/
INFO  : Starting Job = job_1649984531147_0003, Tracking URL = http://hadoop103:8088/proxy/application_1649984531147_0003/
INFO  : Kill Command = /home/soft/hadoop-2.7.2/bin/hadoop job  -kill job_1649984531147_0003
INFO  : Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
INFO  : 2022-04-15 02:16:54,995 Stage-1 map = 0%,  reduce = 0%
INFO  : 2022-04-15 02:16:59,092 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.0 sec
INFO  : MapReduce Total cumulative CPU time: 1 seconds 0 msec
INFO  : Ended Job = job_1649984531147_0003
INFO  : Stage-4 is selected by condition resolver.
INFO  : Stage-3 is filtered out by condition resolver.
INFO  : Stage-5 is filtered out by condition resolver.
INFO  : Moving data to: hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/student7/month=201708/.hive-staging_hive_2022-04-15_02-16-48_516_7282749969946638844-1/-ext-10000 from hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/student7/month=201708/.hive-staging_hive_2022-04-15_02-16-48_516_7282749969946638844-1/-ext-10002
INFO  : Loading data to table db_hive.student7 partition (month=201708) from hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/student7/month=201708/.hive-staging_hive_2022-04-15_02-16-48_516_7282749969946638844-1/-ext-10000
INFO  : Partition db_hive.student7{month=201708} stats: [numFiles=1, numRows=1, totalSize=6, rawDataSize=5]
No rows affected (11.8 seconds)
0: jdbc:hive2://hadoop102:10000> 
*/
# 导入数据
from student7
insert overwrite table student7 partition(month='201708') 
select id,name from student7 where month = '201709'
insert overwrite table student7 partition(month='201708') 
select id,name from student7 where month = '201709';
```

#### 第三种方式向hive导入数据

```sql
create table if not exists student8
as select id,name from student;
/**
0: jdbc:hive2://hadoop102:10000> create table if not exists student8
0: jdbc:hive2://hadoop102:10000> as select id,name from student;
INFO  : Number of reduce tasks is set to 0 since there's no reduce operator
INFO  : number of splits:1
INFO  : Submitting tokens for job: job_1649984531147_0005
INFO  : The url to track the job: http://hadoop103:8088/proxy/application_1649984531147_0005/
INFO  : Starting Job = job_1649984531147_0005, Tracking URL = http://hadoop103:8088/proxy/application_1649984531147_0005/
INFO  : Kill Command = /home/soft/hadoop-2.7.2/bin/hadoop job  -kill job_1649984531147_0005
INFO  : Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
INFO  : 2022-04-15 02:35:27,125 Stage-1 map = 0%,  reduce = 0%
INFO  : 2022-04-15 02:35:31,205 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 0.89 sec
INFO  : MapReduce Total cumulative CPU time: 890 msec
INFO  : Ended Job = job_1649984531147_0005
INFO  : Stage-4 is selected by condition resolver.
INFO  : Stage-3 is filtered out by condition resolver.
INFO  : Stage-5 is filtered out by condition resolver.
INFO  : Moving data to: hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/.hive-staging_hive_2022-04-15_02-35-23_664_6886647803983637797-6/-ext-10001 from hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/.hive-staging_hive_2022-04-15_02-35-23_664_6886647803983637797-6/-ext-10003
INFO  : Moving data to: hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/student8 from hdfs://hadoop102:9000/user/hive/warehouse/db_hive.db/.hive-staging_hive_2022-04-15_02-35-23_664_6886647803983637797-6/-ext-10001
INFO  : Table db_hive.student8 stats: [numFiles=1, numRows=0, totalSize=0, rawDataSize=0]
No rows affected (8.649 seconds)
*/
```

#### 第四种方式向hive导入数据

location 加载数据

```sql
drop table student;

dfs -mkdir /student;

dfs -put /home/soft/student.txt   /student;

create table student(
    deptno int, 
    dname string
)row format delimited fields terminated by '\t'
location '/student';
-- location '/student' 在hdfs 下有一个student文件夹下有student.txt 文件 
-- http://192.168.175.102:50070/explorer.html# 
-- http://192.168.175.102:50070/explorer.html#/

/*
0: jdbc:hive2://hadoop102:10000> create external table student(
0: jdbc:hive2://hadoop102:10000>     id int, 
0: jdbc:hive2://hadoop102:10000>     name string
0: jdbc:hive2://hadoop102:10000> )row format delimited fields terminated by '\t'
0: jdbc:hive2://hadoop102:10000> location '/student';
No rows affected (0.031 seconds)
*/
```

#### 第五种向hive导入数据

```sql
-- 
import table db_hive.student10 from '/export/student';
/*
0: jdbc:hive2://hadoop102:10000> import table db_hive.student10 from '/export/student';
INFO  : Copying data from hdfs://hadoop102:9000/export/student/data to hdfs://hadoop102:9000/export/student/.hive-staging_hive_2022-04-15_03-47-35_673_2921046789811998505-8/-ext-10000
INFO  : Copying file: hdfs://hadoop102:9000/export/student/data/student.txt
INFO  : Loading data to table db_hive.student10 from hdfs://hadoop102:9000/export/student/.hive-staging_hive_2022-04-15_03-47-35_673_2921046789811998505-8/-ext-10000
No rows affected (0.14 seconds)
*/
/*第二种写法*/
import table db_hive.student10 partition(month='201709') from '/export/student';
```



## 数据导出

#### 第一种方式

insert 导出数据

```sql
insert overwrite local directory '/home/soft/datas/export/student' 
select * from student;
/**
0: jdbc:hive2://hadoop102:10000> insert overwrite local directory '/home/soft/datas/export/student' 
0: jdbc:hive2://hadoop102:10000> select * from student;
INFO  : Number of reduce tasks is set to 0 since there's no reduce operator
INFO  : number of splits:1
INFO  : Submitting tokens for job: job_1649984531147_0006
INFO  : The url to track the job: http://hadoop103:8088/proxy/application_1649984531147_0006/
INFO  : Starting Job = job_1649984531147_0006, Tracking URL = http://hadoop103:8088/proxy/application_1649984531147_0006/
INFO  : Kill Command = /home/soft/hadoop-2.7.2/bin/hadoop job  -kill job_1649984531147_0006
INFO  : Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
INFO  : 2022-04-15 02:55:59,020 Stage-1 map = 0%,  reduce = 0%
INFO  : 2022-04-15 02:56:04,123 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.21 sec
INFO  : MapReduce Total cumulative CPU time: 1 seconds 210 msec
INFO  : Ended Job = job_1649984531147_0006
INFO  : Copying data to local directory /home/soft/datas/export/student from hdfs://hadoop102:9000/tmp/hive/root/2114f150-2589-499b-bdee-b97d0c22ccd2/hive_2022-04-15_02-55-55_365_1596929057137095706-8/-mr-10000
INFO  : Copying data to local directory /home/soft/datas/export/student from hdfs://hadoop102:9000/tmp/hive/root/2114f150-2589-499b-bdee-b97d0c22ccd2/hive_2022-04-15_02-55-55_365_1596929057137095706-8/-mr-10000
No rows affected (9.809 seconds)
0: jdbc:hive2://hadoop102:10000> 
*/

insert overwrite local directory '/home/soft/datas/export/student1' 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'  -- 格式化输出语句
select * from student;
/**
0: jdbc:hive2://hadoop102:10000> insert overwrite local directory '/home/soft/datas/export/student1' 
0: jdbc:hive2://hadoop102:10000> ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
0: jdbc:hive2://hadoop102:10000> select * from student;
INFO  : Number of reduce tasks is set to 0 since there's no reduce operator
INFO  : number of splits:1
INFO  : Submitting tokens for job: job_1649984531147_0007
INFO  : The url to track the job: http://hadoop103:8088/proxy/application_1649984531147_0007/
INFO  : Starting Job = job_1649984531147_0007, Tracking URL = http://hadoop103:8088/proxy/application_1649984531147_0007/
INFO  : Kill Command = /home/soft/hadoop-2.7.2/bin/hadoop job  -kill job_1649984531147_0007
INFO  : Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
INFO  : 2022-04-15 02:59:19,400 Stage-1 map = 0%,  reduce = 0%
INFO  : 2022-04-15 02:59:22,474 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 0.91 sec
INFO  : MapReduce Total cumulative CPU time: 910 msec
INFO  : Ended Job = job_1649984531147_0007
INFO  : Copying data to local directory /home/soft/datas/export/student1 from hdfs://hadoop102:9000/tmp/hive/root/2114f150-2589-499b-bdee-b97d0c22ccd2/hive_2022-04-15_02-59-14_993_5708696570995345258-8/-mr-10000
INFO  : Copying data to local directory /home/soft/datas/export/student1 from hdfs://hadoop102:9000/tmp/hive/root/2114f150-2589-499b-bdee-b97d0c22ccd2/hive_2022-04-15_02-59-14_993_5708696570995345258-8/-mr-10000
No rows affected (9.552 seconds)
0: jdbc:hive2://hadoop102:10000> 
*/

insert overwrite directory '/studentexport' 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'  -- 格式化输出语句
select * from student;
```

#### 第二种导出方式

```sql
dfs -get /下载命令
```

#### 第三种导出方式

```sql
-- bin/hive -e '执行的sql' > '路径地址'
bin/hive -e 'select * from db_hive.student;' > /home/soft/datas/export/stu.txt
/*
[root@hadoop102 hive]# bin/hive -e 'select * from db_hive.student;' > /home/soft/datas/export/stu.txt

Logging initialized using configuration in file:/home/soft/hive/conf/hive-log4j.properties
OK
Time taken: 0.884 seconds, Fetched: 16 row(s)
[root@hadoop102 hive]# 
*/
```

#### 第四种方式导入数据

```sql
export table db_hive.student to '/export/student';

一个表构成的组合 数据 和 元数据（_metadata ）
	
/*
0: jdbc:hive2://hadoop102:10000> export table db_hive.student to '/export/student';
INFO  : Copying data from file:/tmp/root/2114f150-2589-499b-bdee-b97d0c22ccd2/hive_2022-04-15_03-44-16_463_7703447412327772980-8/-local-10000/_metadata to hdfs://hadoop102:9000/export/student
INFO  : Copying file: file:/tmp/root/2114f150-2589-499b-bdee-b97d0c22ccd2/hive_2022-04-15_03-44-16_463_7703447412327772980-8/-local-10000/_metadata
INFO  : Copying data from hdfs://hadoop102:9000/student to hdfs://hadoop102:9000/export/student/data
INFO  : Copying file: hdfs://hadoop102:9000/student/student.txt
No rows affected (0.15 seconds)
0: jdbc:hive2://hadoop102:10000> 
*/
```



## 清除表中的数据

```sql
truncate table student;
```

Hive是基于Hadoop的一个数据仓库工具，可以将结构化的数据文件映射为一张数据库表，并提供简单的sql查询功能，可以将sql语句转换为MapReduce任务进行运行。HBase是Hadoop的数据库，一个分布式、可扩展、大数据的存储。单个的从字面意思上或许很难看出二者的区别，别急，下面我们就对二者做个详细的介绍。

两者的特点


hive和hbase的区别。
      Hive帮助熟悉SQL的人运行MapReduce任务。因为它是JDBC兼容的，同时，它也能够和现存的SQL工具整合在一起。运行Hive查询会花费很长时间，因为它会默认遍历表中所有的数据。虽然有这样的缺点，一次遍历的数据量可以通过Hive的分区机制来控制。分区允许在数据集上运行过滤查询，这些数据集存储在不同的文件夹内，查询的时候只遍历指定文件夹(分区)中的数据。这种机制可以用来，例如，只处理在某一个时间范围内的文件，只要这些文件名中包括了时间格式。

      HBase通过存储key/value来工作。它支持四种主要的操作：增加或者更新行，查看一个范围内的cell，获取指定的行，删除指定的行、列或者是列的版本。版本信息用来获取历史数据(每一行的历史数据可以被删除，然后通过Hbase compactions就可以释放出空间)。虽然HBase包括表格，但是schema仅仅被表格和列簇所要求，列不需要schema。Hbase的表格包括增加/计数功能。

限制

Hive目前不支持更新操作。另外，由于hive在hadoop上运行批量操作，它需要花费很长的时间，通常是几分钟到几个小时才可以获取到查询的结果。Hive必须提供预先定义好的schema将文件和目录映射到列，并且Hive与ACID不兼容。

HBase查询是通过特定的语言来编写的，这种语言需要重新学习。类SQL的功能可以通过Apache Phonenix实现，但这是以必须提供schema为代价的。另外，Hbase也并不是兼容所有的ACID特性，虽然它支持某些特性。最后但不是最重要的–为了运行Hbase，Zookeeper是必须的，zookeeper是一个用来进行分布式协调的服务，这些服务包括配置服务，维护元信息和命名空间服务。

应用场景

Hive适合用来对一段时间内的数据进行分析查询，例如，用来计算趋势或者网站的日志。Hive不应该用来进行实时的查询。因为它需要很长时间才可以返回结果。

Hbase非常适合用来进行大数据的实时查询。Facebook用Hbase进行消息和实时的分析。它也可以用来统计Facebook的连接数。

总结

Hive和Hbase是两种基于Hadoop的不同技术–Hive是一种类SQL的引擎，并且运行MapReduce任务，Hbase是一种在Hadoop之上的NoSQL 的Key/vale数据库。当然，这两种工具是可以同时使用的。就像用

