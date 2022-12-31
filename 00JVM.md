# JVM是什么？

java 的虚拟机

# JVM体系结构概览

# 类装载器ClassLoader

负责加载Class文件，class文件在文件开头有特定的文件标示

将class文件字节码内容加载到内存中，并将这些内容转换成方法区中的运行时数据结构并且ClassLoader只责class文件的加载，

至于他是否可以运行，则由Execution Engine决定。



C:\Users\YANG>echo %JAVA_HOME%
C:\Java\jdk1.8.0_201

C:\Users\YANG>echo %PATH%
C:\Program Files (x86)\Common Files\NetSarang;D:\JavaTools\apache-maven-3.6.3\bin;C:\Java\jdk1.8.0_201\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\Git\cmd;C:\Users\YANG\AppData\Local\Microsoft\WindowsApps

C:\Users\YANG>echo %ClASSPATH%
​	%ClASSPATH%

C:\Users\YANG>



类加载器的种类

虚拟机自带的类加载器

​	启动类加载器 （Bootstrap ClassLoader） 加载 $JAVA_HOME/jre/lib/rt.jar

​	扩展类加载器   加载 $JAVA_HOME/jre/lib/ext/rt.jar

​	应用程序类加载器 $CLASSPATH

用户自定义类加载器

​	java.lang.ClassLoader的子类，用户可以定制类的加载方式

什么是双亲委派机制？

如何打破双亲委派机制？

# JVM调优



# GCROOT



可达性分析法













