```
#{}和${}的区别是什么？

	${}是字符串替换，#{}是预处理；
    Mybatis在处理${}时，就是把${}直接替换成变量的值。而Mybatis在处理#{}时，会对sql语句进行预处理，将sql中的#{}替换为?号，调用PreparedStatement的set方法来赋值；
	使用#{}可以有效的防止SQL注入，提高系统安全性。
```



```
为什么说Mybatis是半自动ORM映射工具？它与全自动的区别在哪里？

	（1）Hibernate属于全自动ORM映射工具，使用Hibernate查询关联对象或者关联集合对象时，可以根据对象关系模型直接获取，所以它是全自动的。而Mybatis在查询关联对象或关联集合对象时，需要手动编写sql来完成，所以，称之为半自动ORM映射工具。
	
	（2）Mybatis直接编写原生态sql，可以严格控制sql执行性能，灵活度高，非常适合对关系数据模型要求不高的软件开发，因为这类软件需求变化频繁，一但需求变化要求迅速输出成果。但是灵活的前提是mybatis无法做到数据库无关性，如果需要实现支持多种数据库的软件，则需要自定义多套sql映射文件，工作量大。 

	（3）Hibernate对象/关系映射能力强，数据库无关性好，对于关系模型要求高的软件，如果用hibernate开发可以节省很多代码，提高效率。 
```



```
Mybatis动态sql是做什么的？都有哪些动态sql？能简述一下动态sql的执行原理不？
	答：Mybatis动态sql可以让我们在Xml映射文件内，以标签的形式编写动态sql，完成逻辑判断和动态拼接sql的功能，Mybatis提供了9种动态sql标签				trim|where|set|foreach|if|choose|when|otherwise|bind。
	其执行原理为，使用OGNL从sql参数对象中计算表达式的值，根据表达式的值动态拼接sql，以此来完成动态sql的功能。
```



```
简述一下Mybatis 的编程步骤
    A.创建 SqlSessionFactory
    B.通过 SqlSessionFactory 创建 SqlSession
    C.通过 sqlsession 执行数据库操作
    D.调用 session.commit()提交事务
    E.调用 session.close()关闭会话

```



```
MyBatis实现一对多有几种方式,怎么操作的？
A.联合查询：几个表联合查询，只查询一次，通过在resultMap里面配置collection节点配置一对多的类就可以完成.
B.嵌套查询：是先查一个表，根据这个表里面的结果的外键id去另外一个表里面查询数据，也是通过配置collection，但另外一个表的查询通过select节点配置。

```

