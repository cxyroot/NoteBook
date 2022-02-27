```
什么是 Spring Boot？
	SpringBoot 是 Spring 开源组织下的子项目，是 Spring 组件一站式解决方案，主要是简化了使用 Spring 的难度，简省了繁重的配置，提供了各种启动器，开发者能快速上手。
```

​	

```
pringboot常用的starter有哪些?

1、spring-boot-starter-web (嵌入tomcat和web开发需要servlet与jsp支持)
2、spring-boot-starter-data-jpa (数据库支持)
3、spring-boot-starter-data-redis (redis数据库支持)
4、spring-boot-starter-data-solr (solr搜索应用框架支持)
5、mybatis-spring-boot-starter (第三方的mybatis集成starter)
```



```
Spring Boot、Spring MVC 和 Spring 有什么区别？

1、SpringSpring最重要的特征是依赖注入。所有 SpringModules 不是依赖注入就是 IOC 控制反转。当我们恰当的使用 DI 或者是 IOC 的时候，我们可以开发松耦合应用。松耦合应用的单元测试可以很容易的进行。
2、Spring MVC提供了一种分离式的方法来开发 Web 应用。通过运用像DispatcherServelet，MoudlAndView 和ViewResolver 等一些简单的概念，开发 Web 应用将会变的非常简单。
3、Spring 和 SpringMVC 的问题在于需要配置大量的参数。
4、Spring Boot 通过一个自动配置和启动的项来目解决这个问题。为了更快的构建产品就绪应用程序，Spring Boot 提供了一些非功能性特征。
```



```
Spring Boot 配置加载顺序?
	
	1、properties文件
	2、YAML文件
	3、系统环境变量
	4、命令行参数
```



```
什么是YAML?

	YAML是一种人类可读的数据序列化语言。它通常用于配置文件。
	与属性文件相比，如果我们想要在配置文件中添加复杂的属性，YAML文件就更加结构化，而且更少混淆。可以看出YAML具有分层配置数据。
```

```
Spring Boot 的核心配置文件有哪几个？它们的区别是什么？
    Spring Boot 中有以下两种配置文件：

    bootstrap (.yml 或者 .properties)
    application (.yml 或者 .properties)

    bootstrap/ application 的区别：
    Spring Cloud 构建于 Spring Boot 之上，在 Spring Boot 中有两种上下文，一种是 bootstrap,，另外一种是 application,，bootstrap 是应用程序的父上下文，也就是说 bootstrap 加载优先于 applicaton。bootstrap 主要用于从额外的资源来加载配置信息，还可以在本地外部配置文件中解密属性。这两个上下文共用一个环境，它是任何Spring应用程序的外部属性的来源。bootstrap 里面的属性会优先加载，它们默认也不能被本地相同配置覆盖。

    因此，对比 application 配置文件，bootstrap 配置文件具有以下几个特性：
    boostrap 由父 ApplicationContext 加载，比 applicaton 优先加载。
    boostrap 里面的属性不能被覆盖。

    bootstrap/ application 的应用场景：
    application 配置文件这个容易理解，主要用于 Spring Boot 项目的自动化配置。

    bootstrap 配置文件有以下几个应用场景：
    使用 Spring Cloud Config 配置中心时，这时需要在 bootstrap 配置文件中添加连接到配置中心的配置属性来加载外部配置中心的配置信息；
    一些固定的不能被覆盖的属性；
    一些加密/解密的场景。	
```



```
Spring Boot 的核心注解是哪个？它主要由哪几个注解组成的？

启动类上面的注解是@SpringBootApplication，它也是 Spring Boot 的核心注解，主要组合包含了以下 3 个注解：
@SpringBootConfiguration：**组合了 @Configuration 注解，实现配置文件的功能。
@EnableAutoConfiguration：**打开自动配置的功能，也可以关闭某个自动配置的选项，如关闭数据源自动配置功能： @SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })。
@ComponentScan： Spring组件扫描。

```

```
Spring系列注解
	@Service
	用于标注业务层组件，以注解的方式把这个类注入到spring配置中
	@Autowired
	用来装配bean，都可以写在字段上，或者方法上。
	默认情况下必须要求依赖对象必须存在，如果要允许null值，可以设置它的required属性为false，例如：@Autowired(required=false)
	@ComponentScan：组件扫描和自动装配；
	@SpringBootConfiguration 这个注解主要是继承@Configuration注解，这个是为了加载配置文件用的
	@Service服务层组件
	@Controller用于标注控制层组件
	@Component泛指组件，当组件不好归类的时候，我们可以使用这个注解进行标注。 
	@RequestBody主要用来接收前端传递给后端的json字符串中的数据的(请求体中的数据的)，所以只能发送POST请求。
```



```
Spring Boot 需要独立的容器运行吗？
  可以不需要，内置了 Tomcat/Jetty 等容器。
```



```
运行 Spring Boot 有哪几种方式？
    1）打包用命令或者放到容器中运行
    2）用 Maven/Gradle 插件运行
    3）直接执行 main 方法运行
```



```
保护 Spring Boot 应用有哪些方法？
    1.在生产中使用HTTPS
    2.使用Snyk检查你的依赖关系
    3.升级到最新版本
    4.启用CSRF保护
    5.使用内容安全策略防止XSS攻击
    6.使用OpenID Connect进行身份验证
    7.管理密码？使用密码哈希！
    8.安全地存储秘密
    9.使用OWASP的ZAP测试您的应用程序
    10.让你的安全团队进行代码审查
```



```
Spring Boot 2.X 有什么新特性？与 1.X 有什么区别？
    配置变更
    JDK 版本升级
    第三方类库升级
    响应式 Spring 编程支持
    HTTP/2 支持
    配置属性绑定
    更多改进与加强…
```



```
SpringBoot 实现热部署有哪几种方式？

	主要有两种方式：
		Spring Loaded
		Spring-boot-devtools
```























