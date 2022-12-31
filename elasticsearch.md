## 1什么是elasticsearch

## 2安装elasticsearch

```shell
#
cd bin/
#启动
./elasticsearch
#错误信息
[root@hadoop102 elasticsearch]# cd bin/
[root@hadoop102 bin]# ./elasticsearch
[2022-03-21T09:35:13,268][WARN ][o.e.b.ElasticsearchUncaughtExceptionHandler] [] uncaught exception in thread [main]
org.elasticsearch.bootstrap.StartupException: java.lang.RuntimeException: can not run elasticsearch as root
	at org.elasticsearch.bootstrap.Elasticsearch.init(Elasticsearch.java:140) ~[elasticsearch-6.3.1.jar:6.3.1]
	at org.elasticsearch.bootstrap.Elasticsearch.execute(Elasticsearch.java:127) ~[elasticsearch-6.3.1.jar:6.3.1]
	at org.elasticsearch.cli.EnvironmentAwareCommand.execute(EnvironmentAwareCommand.java:86) ~[elasticsearch-6.3.1.jar:6.3.1]
	at org.elasticsearch.cli.Command.mainWithoutErrorHandling(Command.java:124) ~[elasticsearch-cli-6.3.1.jar:6.3.1]
	at org.elasticsearch.cli.Command.main(Command.java:90) ~[elasticsearch-cli-6.3.1.jar:6.3.1]
	at org.elasticsearch.bootstrap.Elasticsearch.main(Elasticsearch.java:93) ~[elasticsearch-6.3.1.jar:6.3.1]
	at org.elasticsearch.bootstrap.Elasticsearch.main(Elasticsearch.java:86) ~[elasticsearch-6.3.1.jar:6.3.1]
Caused by: java.lang.RuntimeException: can not run elasticsearch as root
	at org.elasticsearch.bootstrap.Bootstrap.initializeNatives(Bootstrap.java:104) ~[elasticsearch-6.3.1.jar:6.3.1]
	at org.elasticsearch.bootstrap.Bootstrap.setup(Bootstrap.java:171) ~[elasticsearch-6.3.1.jar:6.3.1]
	at org.elasticsearch.bootstrap.Bootstrap.init(Bootstrap.java:326) ~[elasticsearch-6.3.1.jar:6.3.1]
	at org.elasticsearch.bootstrap.Elasticsearch.init(Elasticsearch.java:136) ~[elasticsearch-6.3.1.jar:6.3.1]
	... 6 more
[root@hadoop102 bin]#

问题解决来源：
	https://www.cnblogs.com/gcgc/p/10297563.html
　1、创建用户：elasticsearch
		[root@iZbp1bb2egi7w0ueys548pZ bin]# adduser elasticsearch
　　2、创建用户密码，需要输入两次
		[root@iZbp1bb2egi7w0ueys548pZ bin]# passwd elasticsearch
　　3、将对应的文件夹权限赋给该用户
		[root@iZbp1bb2egi7w0ueys548pZ local]# chown -R elasticsearch elasticsearch
　　4、切换至elasticsearch用户
          [root@iZbp1bb2egi7w0ueys548pZ etc]# su elasticsearch
　　5、进入启动目录启动 /usr/local/elasticsearch-6.0.0/bin  使用后台启动方式：./elasticsearch -d
		[elasticsearch@vmt10003 bin]$ ./elasticsearch -d
　　6、启动后测试
　　输入curl ip:9200,如果返回一个json数据说明启动成功



#关闭程序
[elk1@localhost bin]$ ps -ef|grep elastic



$systemctl stop firewalld



```

