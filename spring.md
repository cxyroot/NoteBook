# spring启动日志

```
22:13:38: Executing ':spring02:MainApp.main()'...

Starting Gradle Daemon...
Connected to the target VM, address: '127.0.0.1:52667', transport: 'socket'
Gradle Daemon started in 1 s 159 ms
:buildSrc:compileJava NO-SOURCE
:buildSrc:compileGroovy UP-TO-DATE
:buildSrc:processResources UP-TO-DATE
:buildSrc:classes UP-TO-DATE
:buildSrc:jar UP-TO-DATE
:buildSrc:assemble UP-TO-DATE
:buildSrc:compileTestJava NO-SOURCE
:buildSrc:compileTestGroovy NO-SOURCE
:buildSrc:processTestResources NO-SOURCE
:buildSrc:testClasses UP-TO-DATE
:buildSrc:test NO-SOURCE
:buildSrc:check UP-TO-DATE
:buildSrc:build UP-TO-DATE
:spring-core:cglibRepackJar UP-TO-DATE
:spring-core:objenesisRepackJar UP-TO-DATE
:spring-jcl:compileKotlin UP-TO-DATE
:spring-jcl:compileJava UP-TO-DATE
:spring-jcl:processResources NO-SOURCE
:spring-jcl:classes UP-TO-DATE
:spring-jcl:inspectClassesForKotlinIC UP-TO-DATE
:spring-jcl:jar UP-TO-DATE
:spring-core:compileKotlin UP-TO-DATE
:spring-core:compileJava UP-TO-DATE
:spring-core:processResources NO-SOURCE
:spring-core:classes UP-TO-DATE
:spring-core:inspectClassesForKotlinIC UP-TO-DATE
:spring-core:jar UP-TO-DATE
:spring-beans:compileGroovy UP-TO-DATE
:spring-beans:compileKotlin UP-TO-DATE
:spring-beans:compileJava NO-SOURCE
:spring-beans:processResources UP-TO-DATE
:spring-beans:classes UP-TO-DATE
:spring-beans:inspectClassesForKotlinIC UP-TO-DATE
:spring-beans:jar UP-TO-DATE
:spring-aop:compileKotlin UP-TO-DATE
:spring-aop:compileJava UP-TO-DATE
:spring-aop:processResources UP-TO-DATE
:spring-aop:classes UP-TO-DATE
:spring-aop:inspectClassesForKotlinIC UP-TO-DATE
:spring-aop:jar UP-TO-DATE
:spring-expression:compileKotlin UP-TO-DATE
:spring-expression:compileJava UP-TO-DATE
:spring-expression:processResources UP-TO-DATE
:spring-expression:classes UP-TO-DATE
:spring-expression:inspectClassesForKotlinIC UP-TO-DATE
:spring-expression:jar UP-TO-DATE
:spring-instrument:compileKotlin UP-TO-DATE
:spring-instrument:compileJava UP-TO-DATE
:spring-instrument:processResources NO-SOURCE
:spring-instrument:classes UP-TO-DATE
:spring-instrument:inspectClassesForKotlinIC UP-TO-DATE
:spring-instrument:jar UP-TO-DATE
:spring-context:compileKotlin UP-TO-DATE
:spring-context:compileJava UP-TO-DATE
:spring-context:compileGroovy NO-SOURCE
:spring-context:processResources UP-TO-DATE
:spring-context:classes UP-TO-DATE
:spring-context:inspectClassesForKotlinIC UP-TO-DATE
:spring-context:jar UP-TO-DATE
:spring02:compileKotlin UP-TO-DATE
:spring02:compileJava UP-TO-DATE
:spring02:processResources UP-TO-DATE
:spring02:classes UP-TO-DATE
:spring02:MainApp.main()Disconnected from the target VM, address: '127.0.0.1:52667', transport: 'socket'
Connected to the target VM, address: 'localhost:52681', transport: 'socket'
ʮ���� 05, 2021 10:13:46 ���� org.springframework.context.support.AbstractApplicationContext prepareRefresh
��Ϣ: Refreshing org.springframework.context.support.ClassPathXmlApplicationContext@7dc36524: startup date [Sun Dec 05 22:13:46 CST 2021]; root of context hierarchy

org.springframework.context.support.AbstractXmlApplicationContext.loadBeanDefinitions(org.springframework.beans.factory.support.DefaultListableBeanFactory)
org.springframework.beans.factory.xml.XmlBeanDefinitionReader.loadBeanDefinitions(org.springframework.core.io.Resource)
doLoadBeanDefinitions
ʮ���� 05, 2021 10:13:46 ���� org.springframework.beans.factory.xml.XmlBeanDefinitionReader loadBeanDefinitions
��Ϣ: Loading XML bean definitions from class path resource [Beans.xml]
registerBeanDefinitions
org.springframework.beans.factory.xml.XmlBeanDefinitionReader.registerBeanDefinitions
org.springframework.beans.factory.xml.DefaultBeanDefinitionDocumentReader.doRegisterBeanDefinitions
//处理profile属�??
org.springframework.beans.factory.xml.DefaultBeanDefinitionDocumentReader.parseDefaultElement
org.springframework.beans.factory.xml.DefaultBeanDefinitionDocumentReader.processBeanDefinition
org.springframework.beans.factory.xml.BeanDefinitionParserDelegate.parseBeanDefinitionElement(org.w3c.dom.Element, java.lang.String, org.springframework.beans.factory.config.BeanDefinition)
//创建用于AbstractBeanDefinition类型的GenericBeanDefinition
//硬编码解析默认bean的属�? 
//提取description 
//解析元数�? 
//解析lookup-method属�?? 
//解析replaced-method 
//解析构�?�函数参�? 
//解析Property子元�? 
//解析Qualifier属子元素
Register the final decorated instance.
注册解析的BeanDefinition
Send registration event.
Your Message : Hello World!
Disconnected from the target VM, address: 'localhost:52681', transport: 'socket'
Connected to the target VM, address: '127.0.0.1:52667', transport: 'socket'

BUILD SUCCESSFUL in 14s
38 actionable tasks: 1 executed, 37 up-to-date
22:13:53: Execution finished ':spring02:MainApp.main()'.
Disconnected from the target VM, address: '127.0.0.1:52667', transport: 'socket'

```

# spring 源码解析







