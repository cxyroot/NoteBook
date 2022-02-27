```
git status 状态
git pull 获取代码
git mergetool 对比去除冲突
git log 查看提交历史记录
git push
git add -A 将所有文件变更提交到commit列表
git commit -m “注释”
git clone 地址 克隆服务器代码
git remote add 远程仓库名 地址
git pull origin master
git reset --hard HEAD 重置代码
```

```
1:说一说Servlet实现的接口？
servlet有三种实现方式：
　　1.实现servlet接口
　　2.继承GenericServlet
　　3.通过继承HttpServlet开发servlet
```

```
如何配置服务器（tomcat）的内存大小？
　　修改tomcat/bin/catalina.bat文件。
　　
　　打开catalina.bat文件  打开后会从第一行开始注释，从上往下找到第一行没有注释的，在其上方，添加
   set JAVA_OPTS=-Xms1024M   -Xmx1024M -XX:MaxPermSize=1024M  来指定内存，这个可以根据自己的实际情况进行修改
```

```
一个工厂模式的Singleton

public class Singleton {
	public static Singleton sig=null;

    private Singleton(){

    }
    public static Singleton getSingleton(){
   	 	if(null == sig){
        	sig = new Singleton();
    	}
		return sig;
	}
}
```



```
Spring的事物？
	Spring 两种事物的处理机制，一是声明式事物，二是编程式事物。
```



```
 HashMap是线程不安全的。HashMap的底层是一个Entry数组。当发生hash冲突时，hashmap是采用链表的方式解决的，在对应的数组位置存放链表的头结点。对链表而言，新加入的结点会从头结点加入。
```



```
redis 是单线程还是多线程。
　　Redis是单进程单线程的
　　redis利用队列技术将并发访问变为串行访问，消除了传统数据库串行控制的
```



```
启动一个线程是调用run()还是start()方法？
答：启动一个线程是调用start()方法，使线程所代表的虚拟处理机处于可运行状态，这意味着它可以由JVM 调度并执行，这并不意味着线程就会立即运行。run()方法是线程启动后要进行回调（callback）的方法。
```



```
列出一些你常见的运行时异常？
答：
- ArithmeticException（算术异常）
- ClassCastException （类转换异常）
- IllegalArgumentException （非法参数异常）
- IndexOutOfBoundsException （下标越界异常）
- NullPointerException （空指针异常）
- SecurityException （安全异常）
```



```
String s = new String("xyz");创建了几个字符串对象？
答：两个对象，一个是静态区的"xyz"，一个是用new创建在堆上的对象。
```





```
GC是什么？为什么要有GC？
答：GC是垃圾收集的意思，内存处理是编程人员容易出现问题的地方，忘记或者错误的内存回收会导致程序或系统的不稳定甚至崩溃，Java提供的GC功能可以自动监测对象是否超过作用域从而达到自动回收内存的目的，Java语言没有提供释放已分配内存的显示操作方法。Java程序员不用担心内存管理，因为垃圾收集器会自动进行管理。要请求垃圾收集，可以调用下面的方法之一：System.gc() 或Runtime.getRuntime().gc() ，但JVM可以屏蔽掉显示的垃圾回收调用。
```



```
String类的主要方法
toString();
```

```
索引的优缺点
	优点：查询快 
	缺点：修改慢
索引的原理
	平衡二叉树
```

```
hashmap和hashtable的比较
```

```
mybatis的优点和缺点
```

```
hibernate的
```

























































