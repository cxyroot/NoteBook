# 1：聊聊Spring

# 2：说明bean的生命周期

# 3：循环依赖

# 4：三级缓存

# 5：FactoryBean和BeanFactory

# 4：ApplicationContext和BeanFactory的区别

# 5：设计模式

# 6：spring 源码

## IOC容器

org.springframework.beans.factory.config.BeanPostProcessor

org.springframework.beans.factory.

org.springframework.beans.factory.config.BeanDefinition

org.springframework.beans.factory.support.BeanDefinitionReader



AOP核心问题

```java
org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator#postProcessAfterInitialization==》

org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator#wrapIfNecessary==》

org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator#createProxy==》

org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator#createProxy==》

org.springframework.beans.factory.config.BeanPostProcessor==》org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator#createProxy==》
org.springframework.aop.framework.ProxyFactory#getProxy(java.lang.ClassLoader)==》org.springframework.aop.framework.ProxyCreatorSupport#createAopProxy==》org.springframework.aop.framework.AopProxyFactory#createAopProxy==》org.springframework.aop.framework.DefaultAopProxyFactory#createAopProxy==》org.springframework.aop.framework.JdkDynamicAopProxy   ==》1

org.springframework.aop.framework.ObjenesisCglibAopProxy ==》2
```

## org.springframework.beans.factory.BeanFactory

1. BeanNameAware's setBeanName
2. BeanClassLoaderAware's setBeanClassLoader
3. BeanFactoryAware's setBeanFactory
4. EnvironmentAware's setEnvironment
5. EmbeddedValueResolverAware's setEmbeddedValueResolver
6. ResourceLoaderAware's setResourceLoader (only applicable when running in an application context)
7. ApplicationEventPublisherAware's setApplicationEventPublisher (only applicable when running in an application context)
8. MessageSourceAware's setMessageSource (only applicable when running in an application context)
9. ApplicationContextAware's setApplicationContext (only applicable when running in an application context)
10. ServletContextAware's setServletContext (only applicable when running in a web application context)
11. postProcessBeforeInitialization methods of BeanPostProcessors
12. InitializingBean's afterPropertiesSet
13. a custom init-method definition
14. postProcessAfterInitialization methods of BeanPostProcessors

# org.springframework.core.env.Environment

org.springframework.core.env.StandardEnvironment

org.springframework.core.env.StandardEnvironment#customizePropertySources



# 观察者模式



org.springframework.context.support.AbstractApplicationContext#refresh

org.springframework.context.support.AbstractApplicationContext#createEnvironment

org.springframework.context.support.AbstractApplicationContext#obtainFreshBeanFactory

org.springframework.context.support.AbstractRefreshableApplicationContext#createBeanFactory

org.springframework.beans.factory.support.DefaultListableBeanFactory

org.springframework.context.support.AbstractApplicationContext#prepareBeanFactory

org.springframework.context.support.AbstractApplicationContext#initApplicationEventMulticaster

org.springframework.context.support.AbstractApplicationContext#registerListeners



org.springframework.context.support.AbstractApplicationContext#finishBeanFactoryInitialization

org.springframework.beans.factory.support.DefaultListableBeanFactory#preInstantiateSingletons



干活的地方

org.springframework.beans.factory.support.AbstractBeanFactory#doGetBean



org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#createBean(java.lang.String, org.springframework.beans.factory.support.RootBeanDefinition, java.lang.Object[])

org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#doCreateBean

org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#createBeanInstance

org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#determineConstructorsFromBeanPostProcessors

org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#instantiateBean

org.springframework.beans.factory.support.SimpleInstantiationStrategy#instantiate(org.springframework.beans.factory.support.RootBeanDefinition, java.lang.String, org.springframework.beans.factory.BeanFactory)



org.springframework.beans.BeanUtils#instantiateClass(java.lang.reflect.Constructor<T>, java.lang.Object...)





org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory#populateBean

```
springbean生命周期面试
Spring Bean 的生命周期可以概括为以下几个步骤：

1实例化（Instantiation）：Spring 容器通过反射或者克隆创建 bean 的实例。

2属性赋值（Populate properties）：为 bean 的属性设置值和对其他 bean 的引用。

3初始化（Initialization）：如果 bean 实现了 BeanNameAware, BeanFactoryAware, ApplicationContextAware 或者其他相应的 Aware 接口，容器调用相应的 setBeanName(), setBeanFactory() 或者 setApplicationContext() 方法。

4依赖注入（Dependency Injection）：如果这个 bean 被声明为依赖其他 bean，那么在这一步，容器将注入那些 bean 的依赖。

5BeanPostProcessor：如果有 BeanPostProcessor 注册到容器中，容器将调用 postProcessBeforeInitialization() 方法。

6预初始化（Pre-initialization）：如果 bean 实现了 InitializingBean 接口，调用 afterPropertiesSet() 方法。

7自定义初始化：如果在配置文件中定义了 init-method 属性，容器将调用这个自定义的初始化方法。

8BeanPostProcessor：容器调用 postProcessAfterInitialization() 方法。

9使用（In use）：此时，bean 可以被应用程序使用了。

10销毁（Destruction）：当 bean 不再需要时，如果 bean 实现了 DisposableBean 接口，容器将调用 destroy() 方法。

11自定义销毁：如果在配置文件中定义了 destroy-method 属性，容器将调用这个自定义的销毁方法。

以下是一个简单的 Spring Bean 的生命周期示例：
```



## AOP



