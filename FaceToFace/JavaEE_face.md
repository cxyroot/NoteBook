# git使用

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

# servlet实现的接口

```
1:说一说Servlet实现的接口？
servlet有三种实现方式：
　　1.实现servlet接口
　　2.继承GenericServlet
　　3.通过继承HttpServlet开发servlet
```

# 如何配置服务器（tomcat）的内存大小

```
如何配置服务器（tomcat）的内存大小？
　　修改tomcat/bin/catalina.bat文件。
　　
　　打开catalina.bat文件  打开后会从第一行开始注释，从上往下找到第一行没有注释的，在其上方，添加
   set JAVA_OPTS=-Xms1024M   -Xmx1024M -XX:MaxPermSize=1024M  来指定内存，这个可以根据自己的实际情况进行修改
```

# 工厂模式的singletion

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

# spring 的事物和传播方式

```
Spring的事物？
	Spring 两种事物的处理机制，一是声明式事物，二是编程式事物。
	Spring 事务传播方式
    
    REQUIRED(默认)：它是Spring里面默认的事务传播行为，也就新当前存在事务就加入到当前事务去执行，如果不存在事务就创建一个事务
    REQUIRE_NEW：它不管是否存在事务，它都会新开启一个事务来执行，新老事务相互独立的，外部事务抛出异常，并不会影响内部事务的一个正常提交
    NESTED:如果当前存在事务，就嵌套当前事务中去执行，如果当前没有事务，那么就新建一个事务，类似 REQUIRE_NEW这个样一个传播行为
    SUPPORTS:表示支持当前当前的事务，如果当前不存在事务，就以非事务的方式去执行
    NOT_SUPPORT:表示以非事务的方式来运行，如果当前存在事务，就需要把当前的事务挂起来。
    MANDATORY：它是一个强制的事务执行，如果当前不存在事务就抛出一个异常
    NEVER:就是以非事务的方式来执行，如果当前存在事务则抛出一个异常
    Spring的事务传播级别一般是不需要去定义的，默认就是 REQUIRED，除非在嵌套的事务情况下，需要去重点了解。
```

# hashMap

```
 HashMap是线程不安全的。HashMap的底层是一个Entry数组。当发生hash冲突时，hashmap是采用链表的方式解决的，在对应的数组位置存放链表的头结点。对链表而言，新加入的结点会从头结点加入。
```

# redis 是单线程还是多线程

```
redis 是单线程还是多线程。
　　Redis是单进程单线程的
　　redis利用队列技术将并发访问变为串行访问，消除了传统数据库串行控制的
```

# 启动一个线程是调用run()还是start()方法

```
启动一个线程是调用run()还是start()方法？
答：启动一个线程是调用start()方法，使线程所代表的虚拟处理机处于可运行状态，这意味着它可以由JVM 调度并执行，这并不意味着线程就会立即运行。run()方法是线程启动后要进行回调（callback）的方法。
```

# 列出一些你常见的运行时异常

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

# String s = new String("xyz");创建了几个字符串对象？

```
String s = new String("xyz");创建了几个字符串对象？
答：两个对象，一个是静态区的"xyz"，一个是用new创建在堆上的对象。
```

GC是什么？为什么要有GC？

```
GC是什么？为什么要有GC？
答：GC是垃圾收集的意思，内存处理是编程人员容易出现问题的地方，忘记或者错误的内存回收会导致程序或系统的不稳定甚至崩溃，Java提供的GC功能可以自动监测对象是否超过作用域从而达到自动回收内存的目的，Java语言没有提供释放已分配内存的显示操作方法。Java程序员不用担心内存管理，因为垃圾收集器会自动进行管理。要请求垃圾收集，可以调用下面的方法之一：System.gc() 或Runtime.getRuntime().gc() ，但JVM可以屏蔽掉显示的垃圾回收调用。
```

# String类的主要方法

```
String类的主要方法
	toString();
    int length()：返回字符串的长度： return value.length
    char charAt(int index)： 返回某索引处的字符return value[index]
    boolean isEmpty()：判断是否是空字符串：return value.length == 0
    String toLowerCase()：使用默认语言环境，将 String 中的所有字符转换为小写
    String toUpperCase()：使用默认语言环境，将 String 中的所有字符转换为大写
    String trim()：返回字符串的副本，忽略前导空白和尾部空白
    boolean equals(Object obj)：比较字符串的内容是否相同
    boolean equalsIgnoreCase(String anotherString)：与equals方法类似，忽略大小写
    String concat(String str)：将指定字符串连接到此字符串的结尾。 等价于用“+”
    int compareTo(String anotherString)：比较两个字符串的大小
    String substring(int beginIndex)：返回一个新的字符串，它是此字符串的
    beginIndex开始截取到最后的一个子字符串。
    String substring(int beginIndex, int endIndex) ：返回一个新字符串，它是此字符串从beginIndex开始截取到endIndex(不包含)的一个子字符串。
```

# 索引的优缺点

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

# spring中类的作用域

```
24. 你怎样定义类的作用域？
当定义一个<bean> 在Spring里，我们还能给这个bean声明一个作用域。它可以通过bean 定义中的scope属性来定义。如，当Spring要在需要的时候每次生产一个新的bean实例，bean的scope属性被指定为prototype。另一方面，一个bean每次使用的时候必须返回同一个实例，这个bean的scope 属性 必须设为 singleton。
```

# 使用Spring框架的好处是什么？

```
使用Spring框架的好处是什么？
	轻量：Spring 是轻量的，基本的版本大约2MB
	控制反转：Spring通过控制反转实现了松散耦合，对像们给出它们的依赖，而不是创建或查找依赖的对象们
	面向切面的编程(AOP)：Spring支持面向切面的编程，并且把应用业务逻辑和系统服务分开
	容器：Spring 包含并管理应用中对象的生命周期和配置
	MVC框架：Spring的WEB框架是个精心设计的框架，是Web框架的一个很好的替代品
	事务管理：Spring 提供一个持续的事务管理接口，可以扩展到上至本地事务下至全局事务（JTA）
	异常处理：Spring 提供方便的API把具体技术相关的异常（比如由JDBC，Hibernate or JDO抛出的）转化为一致的unchecked 异常
```

# BeanFactory – BeanFactory 实现举例

```
BeanFactory – BeanFactory 实现举例
	Bean 工厂是工厂模式的一个实现，提供了控制反转功能，用来把应用的配置和依赖从真正的应用代码中分离。
	最常用的BeanFactory 实现是XmlBeanFactory 类。
```

# XMLBeanFactory

```
XMLBeanFactory
最常用的就是
org.springframework.beans.factory.xml.XmlBeanFactory ，它根据XML文件中的定义加载beans。该容器从XML 文件读取配置元数据并用它去创建一个完全配置的系统或应用
```

# ApplicationContext通常的实现是什么？

```
ApplicationContext通常的实现是什么？

    FileSystemXmlApplicationContext ：此容器从一个XML文件中加载beans的定义，XML Bean 配置文件的全路径名必须提供给它的构造函数。
    ClassPathXmlApplicationContext：此容器也从一个XML文件中加载beans的定义，这里，你需要正确设置classpath因为这个容器将在classpath里找bean配置。
    WebXmlApplicationContext：此容器加载一个XML文件，此文件定义了一个WEB应用的所有bean。
```

# String,StringBuffer, StringBuilder 的区别是什么？String为什么是不可变的？

```
String,StringBuffer, StringBuilder 的区别是什么？String为什么是不可变的？
答：
1、String是字符串常量，StringBuffer和StringBuilder都是字符串变量。后两者的字符内容可变，而前者创建后内容不可变。
2、String不可变是因为在JDK中String类被声明为一个final类。
3、StringBuffer是线程安全的，而StringBuilder是非线程安全的。
ps：线程安全会带来额外的系统开销，所以StringBuilder的效率比StringBuffer高。如果对系统中的线程是否安全很掌握，可用StringBuffer，在线程不安全处加上关键字Synchronize。
```

# Java集合类框架的基本接口有哪些？

```
Java集合类框架的基本接口有哪些？
集合类接口指定了一组叫做元素的对象。集合类接口的每一种具体的实现类都可以选择以它自己的方式对元素进行保存和排序。有的集合类允许重复的键，有些不允许。Java集合类提供了一套设计良好的支持对一组对象进行操作的接口和类。Java集合类里面最基本的接口有：
Collection：代表一组对象，每一个对象都是它的子元素。
Set：不包含重复元素的Collection。
List：有顺序的collection，并且可以包含重复元素。
Map：可以把键(key)映射到值(value)的对象，键不能重复。
```

# Session, Cookie区别

```
Session, Cookie区别
答：  
1、Session由应用服务器维护的一个服务器端的存储空间；Cookie是客户端的存储空间，由浏览器维护。
2、用户可以通过浏览器设置决定是否保存Cookie，而不能决定是否保存Session，因为Session是由服务器端维护的。
3、Session中保存的是对象，Cookie中保存的是字符串。
4、Session和Cookie不能跨窗口使用，每打开一个浏览器系统会赋予一个SessionID，此时的SessionID不同，若要完成跨浏览器访问数据，可以使用 Application。
5、Session、Cookie都有失效时间，过期后会自动删除，减少系统开销。
```

# 对Spring的理解，项目中都用什么？怎么用的？对IOC、和AOP的理解及实现原理

```
对Spring的理解，项目中都用什么？怎么用的？对IOC、和AOP的理解及实现原理
答：  
Spring是一个开源框架，处于MVC模式中的控制层，它能应对需求快速的变化，其主要原因它有一种面向切面编程（AOP）的优势，其次它提升了系统性能，因为通过依赖倒置机制（IOC），系统中用到的对象不是在系统加载时就全部实例化，而是在调用到这个类时才会实例化该类的对象，从而提升了系统性能。这两个优秀的性能使得Spring受到许多J2EE公司的青睐，如阿里中使用最多的也是Spring相关技术。
```

# Spring的优点：

```
Spring的优点：
1、降低了组件之间的耦合性，实现了软件各层之间的解耦。
2、可以使用容易提供的众多服务，如事务管理，消息服务，日志记录等。
3、容器提供了AOP技术，利用它很容易实现如权限拦截、运行期监控等功能。
Spring中AOP技术是设计模式中的动态代理模式。只需实现jdk提供的动态代理接口InvocationHandler，所有被代理对象的方法都由InvocationHandler接管实际的处理任务。面向切面编程中还要理解切入点、切面、通知、织入等概念。
Spring中IOC则利用了Java强大的反射机制来实现。所谓依赖注入即组件之间的依赖关系由容器在运行期决定。其中依赖注入的方法有两种，通过构造函数注入，通过set方法进行注入。
```

# HashTable，HashMap，TreeMap区别？

```
HashTable，HashMap，TreeMap区别？
答：   
1、HashTable线程同步，HashMap非线程同步。
2、HashTable不允许<键,值>有空值，HashMap允许<键,值>有空值。
3、HashTable使用Enumeration，HashMap使用Iterator。
4、HashTable中hash数组的默认大小是11，增加方式的old*2+1，HashMap中hash数组的默认大小是16，增长方式一定是2的指数倍。
5、TreeMap能够把它保存的记录根据键排序，默认是按升序排序。
```

# wait()与sleep()的区别

```
wait()与sleep()的区别
关于这两者已经在上面进行详细的说明,这里就做个概括好了:
•	sleep()来自Thread类，和wait()来自Object类。调用sleep()方法的过程中，线程不会释放对象锁。而 调用 wait 方法线程会释放对象锁
•	sleep()睡眠后不出让系统资源，wait让其他线程可以占用CPU
•	sleep(milliseconds)需要指定一个睡眠时间，时间一到会自动唤醒.而wait()需要配合notify()或者notifyAll()使用
```

# 事务的ACID是指什么？

```
事务的ACID是指什么？
答：
•	原子性(Atomic)：事务中各项操作，要么全做要么全不做，任何一项操作的失败都会导致整个事务的失败；
•	一致性(Consistent)：事务结束后系统状态是一致的；
•	隔离性(Isolated)：并发执行的事务彼此无法看到对方的中间状态；
•	持久性(Durable)：事务完成后所做的改动都会被持久化，即使发生灾难性的失败。通过日志和同步备份可以在故障发生后重建数据。
```

# List、Map、Set三个接口存取元素时，各有什么特点？

```
List、Map、Set三个接口存取元素时，各有什么特点？
答：List以特定索引来存取元素，可以有重复元素。Set不能存放重复元素（用对象的equals()方法来区分元素是否重复）。Map保存键值对（key-value pair）映射，映射关系可以是一对一或多对一。Set和Map容器都有基于哈希存储和排序树的两种实现版本，基于哈希存储的版本理论存取时间复杂度为O(1)，而基于排序树版本的实现在插入或删除元素时会按照元素或元素的键（key）构成排序树从而达到排序和去重的效果。

```

# 简述synchronized 和java.util.concurrent.locks.Lock的异同？

```
简述synchronized 和java.util.concurrent.locks.Lock的异同？
答：Lock是Java 5以后引入的新的API，和关键字synchronized相比主要相同点：Lock 能完成synchronized所实现的所有功能；主要不同点：Lock有比synchronized更精确的线程语义和更好的性能，而且不强制性的要求一定要获得锁。synchronized会自动释放锁，而Lock一定要求程序员手工释放，并且最好在finally 块中释放（这是释放外部资源的最好的地方）。
```

# 什么是乐观锁和悲观锁

```
什么是乐观锁和悲观锁
乐观锁：乐观锁认为竞争不总是会发生，因此它不需要持有锁，将比较-替换这两个动作作为一个原子操作尝试去修改内存中的变量，如果失败则表示发生冲突，那么就应该有相应的重试逻辑。
悲观锁：悲观锁认为竞争总是会发生，因此每次对某资源进行操作时，都会持有一个独占的锁，就像synchronized，不管三七二十一，直接上了锁就操作资源了。
```

# spring boot的自动装配

```
自动装配是什么及作用
	springboot的自动装配实际上就是为了从spring.factories文件中获取到对应的需要进行自动装配的类，
	并生成相应的Bean对象，然后将它们交给spring容器来帮我们进行管理。
```



# spring自动装配的原理

```
启动类上注解的作用
	@SpringBootApplication
	这个注解是springboot启动类上的一个注解，是一个组合注解，
	也就是由其他注解组合起来，它的主要作用就是标记说明这个类是springboot的主配置类，
	springboot应该运行这个类里面的main()方法来启动程序
	
这个SpringBootApplication注解主要由三个子注解组成：
    @SpringBootConfiguration
    @EnableAutoConfiguration
    @ComponentScan
```

# OOM问题处理流程

```
一、OOM(OutOfMemoryError):
		对象无法释放或无法被垃圾回收，造成内存浪费，导致程序运行速度减慢，
		甚至系统崩溃等严重后果，就是内存泄漏。多个内存泄漏造成可使用内存变少，会导致内存溢出。
		代码问题new 一个很大对象，导致内存溢出。
		也可能内存真的不足导致内存溢出。
	二、考虑：
		1、垃圾回收算法设置是否合理
		2、年轻代、老年代划分是否合理
		3、内存泄漏
```

# 常用的 JVM 调优的参数都有哪些？

```
常用的 JVM 调优的参数都有哪些？
-Xms2g：初始化推大小为 2g；
-Xmx2g：堆最大内存为 2g；
-XX:NewRatio=4：设置年轻的和老年代的内存比例为 1:4；
-XX:SurvivorRatio=8：设置新生代 Eden 和 Survivor 比例为 8:2；
–XX:+UseParNewGC：指定使用 ParNew + Serial Old 垃圾回收器组合；
-XX:+UseParallelOldGC：指定使用 ParNew + ParNew Old 垃圾回收器组合；
-XX:+UseConcMarkSweepGC：指定使用 CMS + Serial Old 垃圾回收器组合；
-XX:+PrintGC：开启打印 gc 信息；
-XX:+PrintGCDetails：打印 gc 详细信息
```

# 说一下 JVM 调优的工具？

```
说一下 JVM 调优的工具？
JDK 自带了很多监控工具，都位于 JDK 的 bin 目录下，其中最常用的是 jconsole 和 jvisualvm 这两款视图监控工具。

jconsole：用于对 JVM 中的内存、线程和类等进行监控；
jvisualvm：JDK 自带的全能分析工具，可以分析：内存快照、线程快照、程序死锁、监控内存的变化、gc 变化等。


jps
jstack
jmap
```

# 说一下 JVM 有哪些垃圾回收算法

```
说一下 JVM 有哪些垃圾回收算法？
标记-清除算法：标记无用对象，然后进行清除回收。缺点：效率不高，无法清除垃圾碎片。
标记-整理算法：标记无用对象，让所有存活的对象都向一端移动，然后直接清除掉端边界以外的内存。
复制算法：按照容量划分二个大小相等的内存区域，当一块用完的时候将活着的对象复制到另一块上，然后再把已使用的内存空间一次清理掉。缺点：内存使用率不高，只有原来的一半。
分代算法：根据对象存活周期的不同将内存划分为几块，一般是新生代和老年代，新生代基本采用复制算法，老年代采用标记整理算法.
```

#  说一下类装载的执行过程？

```
类装载分为以下 5 个步骤：	
    加载：根据查找路径找到相应的 class 文件然后导入；
    检查：检查加载的 class 文件的正确性；
    准备：给类中的静态变量分配内存空间；
    解析：虚拟机将常量池中的符号引用替换成直接引用的过程。符号引用就理解为一个标示，而在直接引用直接指向内存中的地址；
    初始化：对静态变量和静态代码块执行初始化工作。
```

# **如何获取当前数据库版本？**

```
使用 select version() 获取当前 MySQL 数据库版本。
```



# **float 和 double 的区别是什么？**

```
- float 最多可以存储 8 位的十进制数，并在内存中占 4 字节。
- double 最可可以存储 16 位的十进制数，并在内存中占 8 字节。
```

# 请谈谈你对volatile是什么？

```
volatiol是JVM提供的轻量级的同步机制，三个特性：保证可见性，不保证原子性，禁止指令重排序。
```

# MyBatis中井号与美元符号的区别

```
#{变量名}可以进行预编译、类型匹配等操作，#{变量名}会转化为jdbc的类型。
select * from tablename where id = #{id}
假设id的值为12，其中如果数据库字段id为字符型，那么#{id}表示的就是'12'，如果id为整型，那么id就是12，并且MyBatis会将上面SQL语句转化为jdbc的select * from tablename where id=?，把?参数设置为id的值。

${变量名}不进行数据类型匹配，直接替换。

select * from tablename where id = ${id}
如果字段id为整型，sql语句就不会出错，但是如果字段id为字符型， 那么sql语句应该写成
select * from table where id = '${id}'。

#方式能够很大程度防止sql注入。
$方式无法方式sql注入。
$方式一般用于传入数据库对象，例如传入表名。
尽量多用#方式，少用$方式。
```

# Spring 常用注解及功能

```
@SpringBootApplication
@MapperScan("com.google")
@EnableFeignClients
@EnableCaching
@Bean
@PostMapping
@GetMapping
@PutMapping
@Autowired
@RestController
@Service
@Transactional
@RestController
@TableField
@Data
@TableName
@ApiOperation
```

