# 什么是SpringBoot



```
Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Spring Boot致力于在蓬勃发展的快速应用开发领域（rapid application development）成为领导者。
spring大家都知道，boot是启动的意思。所以，spring boot其实就是一个启动spring项目的一个工具而已。从最根本上来讲，Spring Boot就是一些库的集合，它能够被任意项目的构建系统所使用。
```

banner.gif

# Spring Boot的优缺点

## 优点

- 快速构建项目。
- 对主流开发框架的无配置集成。
- 项目可独立运行，无须外部依赖Servlet容器。
- 提供运行时的应用监控。
- 极大地提高了开发、部署效率。
- 与云计算的天然集成。

## 缺点

- 版本迭代速度很快，一些模块改动很大。
- 由于不用自己做配置，报错时很难定位。
- 网上现成的解决方案比较少。

# SpringBoot的源码

下载地址

​	github地址

​	spring-boot-2.0.x

编译之前修改

## spring-boot-2.0.x\pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-build</artifactId>
	<version>${revision}</version>
	<packaging>pom</packaging>
	<name>Spring Boot Build</name>
	<description>Spring Boot Build</description>
	<properties>
		<revision>2.0.10.BUILD-SNAPSHOT</revision>
		<main.basedir>${basedir}</main.basedir>
		<!-- 从github下载的源码中没有这个配置 -->
		<disable.checks>true</disable.checks>
	</properties>
	<!-- Most elements are in profiles so they are stripped out during maven-flatten -->
	<profiles>
		<!-- Default profile for command line build -->
		<profile>
			<id>default</id>
			<activation>
				<property>
					<name>!disable-spring-boot-default-profile</name>
				</property>
			</activation>
			<properties>
				<spring-javaformat.version>0.0.15</spring-javaformat.version>
				<nohttp-checkstyle.version>0.0.1.RELEASE</nohttp-checkstyle.version>
			</properties>
			<build>
				<plugins>
					<plugin>
						<groupId>org.apache.maven.plugins</groupId>
						<artifactId>maven-checkstyle-plugin</artifactId>
						<version>3.0.0</version>
						<dependencies>
							<dependency>
								<groupId>com.puppycrawl.tools</groupId>
								<artifactId>checkstyle</artifactId>
								<version>8.22</version>
							</dependency>
							<dependency>
								<groupId>io.spring.javaformat</groupId>
								<artifactId>spring-javaformat-checkstyle</artifactId>
								<version>${spring-javaformat.version}</version>
							</dependency>
							<dependency>
								<groupId>io.spring.nohttp</groupId>
								<artifactId>nohttp-checkstyle</artifactId>
								<version>${nohttp-checkstyle.version}</version>
							</dependency>
						</dependencies>
						<executions>
							<execution>
								<id>checkstyle-validation</id>
								<phase>validate</phase>
								<configuration>
									<skip>${disable.checks}</skip>
									<configLocation>src/checkstyle/checkstyle.xml</configLocation>
									<suppressionsLocation>src/checkstyle/checkstyle-suppressions.xml</suppressionsLocation>
									<includeTestSourceDirectory>true</includeTestSourceDirectory>
									<propertyExpansion>main.basedir=${main.basedir}</propertyExpansion>
									<encoding>UTF-8</encoding>
								</configuration>
								<goals>
									<goal>check</goal>
								</goals>
							</execution>
							<execution>
								<id>nohttp-checkstyle-validation</id>
								<phase>validate</phase>
								<configuration>
									<skip>${disable.checks}</skip>
									<configLocation>src/checkstyle/nohttp-checkstyle.xml</configLocation>
									<suppressionsLocation>src/checkstyle/nohttp-checkstyle-suppressions.xml</suppressionsLocation>
									<propertyExpansion>main.basedir=${main.basedir}</propertyExpansion>
									<encoding>UTF-8</encoding>
									<sourceDirectories>${basedir}</sourceDirectories>
									<includes>**/*</includes>
									<excludes>**/.git/**/*,**/target/**/,**/.flattened-pom.xml,**/*.class,**/spring-boot-gradle-plugin/build/**</excludes>
								</configuration>
								<goals>
									<goal>check</goal>
								</goals>
								<inherited>false</inherited>
							</execution>
						</executions>
					</plugin>
					<plugin>
						<groupId>io.spring.javaformat</groupId>
						<artifactId>spring-javaformat-maven-plugin</artifactId>
						<version>${spring-javaformat.version}</version>
						<executions>
							<execution>
								<phase>validate</phase>
								<configuration>
									<skip>${disable.checks}</skip>
								</configuration>
								<goals>
									<goal>validate</goal>
								</goals>
							</execution>
						</executions>
					</plugin>
				</plugins>
			</build>
			<modules>
				<module>spring-boot-project</module>
				<!-- Samples are built via the invoker plugin -->
				<module>spring-boot-samples-invoker</module>
				<module>spring-boot-tests</module>
			</modules>
		</profile>
		<!-- M2E profile to allow easy import into Eclipse -->
		<profile>
			<id>m2e</id>
			<activation>
				<property>
					<name>m2e.version</name>
				</property>
			</activation>
			<modules>
				<module>spring-boot-project</module>
				<module>spring-boot-samples</module>
				<module>spring-boot-tests</module>
			</modules>
		</profile>
		<profile>
			<id>repository</id>
			<activation>
				<property>
					<name>repository</name>
				</property>
			</activation>
			<repositories>
				<repository>
					<id>repository</id>
					<url>${repository}</url>
					<snapshots>
						<enabled>true</enabled>
					</snapshots>
				</repository>
			</repositories>
			<pluginRepositories>
				<pluginRepository>
					<id>repository</id>
					<url>${repository}</url>
					<snapshots>
						<enabled>true</enabled>
					</snapshots>
				</pluginRepository>
			</pluginRepositories>
		</profile>
	</profiles>
	<repositories>
		<!-- Repositories to allow snapshot and milestone BOM imports during development.
			This section is stripped by the flatten plugin during install/deploy. -->
		<repository>
			<id>central</id>
			<url>https://repo.maven.apache.org/maven2</url>
			<snapshots>
				<enabled>false</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>spring-milestone</id>
			<name>Spring Milestone</name>
			<url>https://repo.spring.io/milestone</url>
			<snapshots>
				<enabled>false</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>spring-snapshot</id>
			<name>Spring Snapshot</name>
			<url>https://repo.spring.io/snapshot</url>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>rabbit-milestone</id>
			<name>Rabbit Milestone</name>
			<url>https://dl.bintray.com/rabbitmq/maven-milestones</url>
			<snapshots>
				<enabled>false</enabled>
			</snapshots>
		</repository>
	</repositories>
	<pluginRepositories>
		<pluginRepository>
			<id>central</id>
			<url>https://repo.maven.apache.org/maven2</url>
			<snapshots>
				<enabled>false</enabled>
			</snapshots>
		</pluginRepository>
		<pluginRepository>
			<id>spring-milestone</id>
			<name>Spring Milestone</name>
			<url>https://repo.spring.io/milestone</url>
			<snapshots>
				<enabled>false</enabled>
			</snapshots>
		</pluginRepository>
		<pluginRepository>
			<id>spring-snapshot</id>
			<name>Spring Snapshot</name>
			<url>https://repo.spring.io/snapshot</url>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</pluginRepository>
	</pluginRepositories>
	<build>
		<pluginManagement>
			<plugins>
				<!--This plugin's configuration is used to store Eclipse m2e settings
					only. It has no influence on the Maven build itself. -->
				<plugin>
					<groupId>org.eclipse.m2e</groupId>
					<artifactId>lifecycle-mapping</artifactId>
					<version>1.0.0</version>
					<configuration>
						<lifecycleMappingMetadata>
							<pluginExecutions>
								<pluginExecution>
									<pluginExecutionFilter>
										<groupId>
											org.jetbrains.kotlin
										</groupId>
										<artifactId>
											kotlin-maven-plugin
										</artifactId>
										<versionRange>
											[1.1.51,)
										</versionRange>
										<goals>
											<goal>compile</goal>
											<goal>test-compile</goal>
										</goals>
									</pluginExecutionFilter>
									<action>
										<ignore></ignore>
									</action>
								</pluginExecution>
							</pluginExecutions>
						</lifecycleMappingMetadata>
					</configuration>
				</plugin>
			</plugins>
		</pluginManagement>
	</build>
</project>
```

## spring-boot-2.0.x\spring-boot-samples\pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>${revision}</version>
		<relativePath>../spring-boot-project/spring-boot-starters/spring-boot-starter-parent</relativePath>
	</parent>
	<artifactId>spring-boot-samples</artifactId>
	<packaging>pom</packaging>
	<name>Spring Boot Samples</name>
	<description>Spring Boot Samples</description>
	<properties>
		<main.basedir>${basedir}/..</main.basedir>
		<java.version>1.8</java.version>
		<disable.checks>false</disable.checks>
	</properties>
	<modules>
		<module>spring-boot-sample-tomcat</module>
		<!--
		<module>spring-boot-sample-ant</module>
		<module>spring-boot-sample-activemq</module>
		<module>spring-boot-sample-actuator</module>
		<module>spring-boot-sample-actuator-log4j2</module>
		<module>spring-boot-sample-actuator-noweb</module>
		<module>spring-boot-sample-actuator-ui</module>
		<module>spring-boot-sample-actuator-custom-security</module>
		<module>spring-boot-sample-amqp</module>
		<module>spring-boot-sample-animated-banner</module>
		<module>spring-boot-sample-aop</module>
		<module>spring-boot-sample-atmosphere</module>
		<module>spring-boot-sample-batch</module>
		<module>spring-boot-sample-cache</module>
		<module>spring-boot-sample-custom-layout</module>
		<module>spring-boot-sample-data-cassandra</module>
		<module>spring-boot-sample-data-couchbase</module>
		<module>spring-boot-sample-data-elasticsearch</module>
		<module>spring-boot-sample-data-jpa</module>
		<module>spring-boot-sample-data-ldap</module>
		<module>spring-boot-sample-data-mongodb</module>
		<module>spring-boot-sample-data-neo4j</module>
		<module>spring-boot-sample-data-redis</module>
		<module>spring-boot-sample-data-rest</module>
		<module>spring-boot-sample-data-solr</module>
		<module>spring-boot-sample-devtools</module>
		<module>spring-boot-sample-flyway</module>
		<module>spring-boot-sample-hateoas</module>
		<module>spring-boot-sample-integration</module>
		<module>spring-boot-sample-jersey</module>
		<module>spring-boot-sample-jersey1</module>
		<module>spring-boot-sample-jetty</module>
		<module>spring-boot-sample-jetty-jsp</module>
		<module>spring-boot-sample-jetty-ssl</module>
		<module>spring-boot-sample-jooq</module>
		<module>spring-boot-sample-jpa</module>
		<module>spring-boot-sample-jta-atomikos</module>
		<module>spring-boot-sample-jta-bitronix</module>
		<module>spring-boot-sample-jta-narayana</module>
		<module>spring-boot-sample-jta-jndi</module>
		<module>spring-boot-sample-junit-jupiter</module>
		<module>spring-boot-sample-kafka</module>
		<module>spring-boot-sample-liquibase</module>
		<module>spring-boot-sample-logback</module>
		<module>spring-boot-sample-oauth2-client</module>
		<module>spring-boot-sample-parent-context</module>
		<module>spring-boot-sample-profile</module>
		<module>spring-boot-sample-property-validation</module>
		<module>spring-boot-sample-quartz</module>
		<module>spring-boot-sample-secure</module>
		<module>spring-boot-sample-secure-webflux</module>
		<module>spring-boot-sample-servlet</module>
		<module>spring-boot-sample-session</module>
		<module>spring-boot-sample-session-webflux</module>
		<module>spring-boot-sample-simple</module>
		<module>spring-boot-sample-test</module>
		<module>spring-boot-sample-test-nomockito</module>
		<module>spring-boot-sample-testng</module>
		<module>spring-boot-sample-tomcat</module>
		<module>spring-boot-sample-tomcat-jsp</module>
		<module>spring-boot-sample-tomcat-ssl</module>
		<module>spring-boot-sample-tomcat-multi-connectors</module>
		<module>spring-boot-sample-traditional</module>
		<module>spring-boot-sample-undertow</module>
		<module>spring-boot-sample-undertow-ssl</module>
		<module>spring-boot-sample-war</module>
		<module>spring-boot-sample-web-freemarker</module>
		<module>spring-boot-sample-web-groovy-templates</module>
		<module>spring-boot-sample-web-jsp</module>
		<module>spring-boot-sample-web-method-security</module>
		<module>spring-boot-sample-web-mustache</module>
		<module>spring-boot-sample-web-secure</module>
		<module>spring-boot-sample-web-secure-custom</module>
		<module>spring-boot-sample-web-secure-jdbc</module>
		<module>spring-boot-sample-web-static</module>
		<module>spring-boot-sample-web-ui</module>
		<module>spring-boot-sample-webflux</module>
		<module>spring-boot-sample-websocket-jetty</module>
		<module>spring-boot-sample-websocket-tomcat</module>
		<module>spring-boot-sample-websocket-undertow</module>
		<module>spring-boot-sample-webservices</module>
		<module>spring-boot-sample-xml</module>
		-->
	</modules>
	<!-- No dependencies - otherwise the samples won't work if you change the
		parent -->
	<build>
		<pluginManagement>
			<plugins>
				<plugin>
					<groupId>org.codehaus.mojo</groupId>
					<artifactId>flatten-maven-plugin</artifactId>
					<inherited>true</inherited>
					<executions>
						<execution>
							<id>flatten</id>
							<phase>process-resources</phase>
							<goals>
								<goal>flatten</goal>
							</goals>
							<configuration>
								<updatePomFile>true</updatePomFile>
								<flattenMode>oss</flattenMode>
							</configuration>
						</execution>
					</executions>
				</plugin>
				<plugin>
					<groupId>org.eclipse.m2e</groupId>
					<artifactId>lifecycle-mapping</artifactId>
					<version>1.0.0</version>
					<configuration>
						<lifecycleMappingMetadata>
							<pluginExecutions>
								<pluginExecution>
									<pluginExecutionFilter>
										<groupId>
											org.apache.maven.plugins
										</groupId>
										<artifactId>
											maven-enforcer-plugin
										</artifactId>
										<versionRange>
											[1.3.1,)
										</versionRange>
										<goals>
											<goal>enforce</goal>
										</goals>
									</pluginExecutionFilter>
									<action>
										<ignore />
									</action>
								</pluginExecution>
								<pluginExecution>
									<pluginExecutionFilter>
										<groupId>
											org.springframework.boot
										</groupId>
										<artifactId>
											spring-boot-maven-plugin
										</artifactId>
										<versionRange>
											[1.4.0.BUILD-SNAPSHOT,)
										</versionRange>
										<goals>
											<goal>build-info</goal>
										</goals>
									</pluginExecutionFilter>
									<action>
										<ignore />
									</action>
								</pluginExecution>
							</pluginExecutions>
						</lifecycleMappingMetadata>
					</configuration>
				</plugin>
			</plugins>
		</pluginManagement>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-surefire-plugin</artifactId>
				<configuration>
					<includes>
						<include>**/*Tests.java</include>
					</includes>
					<excludes>
						<exclude>**/Abstract*.java</exclude>
					</excludes>
					<systemPropertyVariables>
						<java.security.egd>file:/dev/./urandom</java.security.egd>
						<java.awt.headless>true</java.awt.headless>
					</systemPropertyVariables>
				</configuration>
			</plugin>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-enforcer-plugin</artifactId>
				<executions>
					<execution>
						<id>enforce-rules</id>
						<goals>
							<goal>enforce</goal>
						</goals>
						<configuration>
							<rules>
								<bannedDependencies>
									<excludes>
										<exclude>commons-logging:*:*</exclude>
									</excludes>
									<searchTransitive>true</searchTransitive>
								</bannedDependencies>
							</rules>
							<fail>true</fail>
						</configuration>
					</execution>
				</executions>
			</plugin>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-install-plugin</artifactId>
				<configuration>
					<skip>true</skip>
				</configuration>
			</plugin>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-javadoc-plugin</artifactId>
				<configuration>
					<skip>true</skip>
				</configuration>
				<inherited>true</inherited>
			</plugin>
		</plugins>
	</build>
	<profiles>
		<profile>
			<id>fast</id>
			<activation>
				<property>
					<name>fast</name>
				</property>
			</activation>
			<properties>
				<disable.checks>true</disable.checks>
			</properties>
		</profile>
	</profiles>
</project>
```

编译命令

```shell

```

导入IDEA中

启动



# SpringBoot启动日志

```
C:\Java\jdk1.8.0_201\bin\java.exe -agentlib:jdwp=transport=dt_socket,address=127.0.0.1:51332,suspend=y,server=n -javaagent:D:\JavaTools\ideaIC-2021.2.3.win\plugins\Groovy\lib\agent\gragent.jar -javaagent:D:\JavaTools\ideaIC-2021.2.3.win\plugins\java\lib\rt\debugger-agent.jar=file:/C:/Users/YANG/AppData/Local/Temp/capture.props -Dfile.encoding=UTF-8 -classpath C:\Java\jdk1.8.0_201\jre\lib\charsets.jar;C:\Java\jdk1.8.0_201\jre\lib\deploy.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\access-bridge-64.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\cldrdata.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\dnsns.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\jaccess.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\jfxrt.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\localedata.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\nashorn.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\sunec.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\sunjce_provider.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\sunmscapi.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\sunpkcs11.jar;C:\Java\jdk1.8.0_201\jre\lib\ext\zipfs.jar;C:\Java\jdk1.8.0_201\jre\lib\javaws.jar;C:\Java\jdk1.8.0_201\jre\lib\jce.jar;C:\Java\jdk1.8.0_201\jre\lib\jfr.jar;C:\Java\jdk1.8.0_201\jre\lib\jfxswt.jar;C:\Java\jdk1.8.0_201\jre\lib\jsse.jar;C:\Java\jdk1.8.0_201\jre\lib\management-agent.jar;C:\Java\jdk1.8.0_201\jre\lib\plugin.jar;C:\Java\jdk1.8.0_201\jre\lib\resources.jar;C:\Java\jdk1.8.0_201\jre\lib\rt.jar;D:\JavaCode\SrcCode\spring-boot-2.0.x\spring-boot-samples\spring-boot-sample-tomcat\target\classes;D:\JavaCode\SrcCode\spring-boot-2.0.x\spring-boot-project\spring-boot-starters\spring-boot-starter\target\classes;D:\JavaCode\SrcCode\spring-boot-2.0.x\spring-boot-project\spring-boot\target\classes;D:\JavaCode\SrcCode\spring-boot-2.0.x\spring-boot-project\spring-boot-autoconfigure\target\classes;D:\JavaCode\SrcCode\spring-boot-2.0.x\spring-boot-project\spring-boot-starters\spring-boot-starter-logging\target\classes;D:\JavaTools\localRepository\ch\qos\logback\logback-classic\1.2.3\logback-classic-1.2.3.jar;D:\JavaTools\localRepository\ch\qos\logback\logback-core\1.2.3\logback-core-1.2.3.jar;D:\JavaTools\localRepository\org\apache\logging\log4j\log4j-to-slf4j\2.10.0\log4j-to-slf4j-2.10.0.jar;D:\JavaTools\localRepository\org\apache\logging\log4j\log4j-api\2.10.0\log4j-api-2.10.0.jar;D:\JavaTools\localRepository\org\slf4j\jul-to-slf4j\1.7.26\jul-to-slf4j-1.7.26.jar;D:\JavaTools\localRepository\javax\annotation\javax.annotation-api\1.3.2\javax.annotation-api-1.3.2.jar;D:\JavaTools\localRepository\org\springframework\spring-core\5.0.13.RELEASE\spring-core-5.0.13.RELEASE.jar;D:\JavaTools\localRepository\org\springframework\spring-jcl\5.0.13.RELEASE\spring-jcl-5.0.13.RELEASE.jar;D:\JavaTools\localRepository\org\yaml\snakeyaml\1.19\snakeyaml-1.19.jar;D:\JavaCode\SrcCode\spring-boot-2.0.x\spring-boot-project\spring-boot-starters\spring-boot-starter-tomcat\target\classes;D:\JavaTools\localRepository\org\apache\tomcat\embed\tomcat-embed-core\8.5.39\tomcat-embed-core-8.5.39.jar;D:\JavaTools\localRepository\org\apache\tomcat\embed\tomcat-embed-el\8.5.39\tomcat-embed-el-8.5.39.jar;D:\JavaTools\localRepository\org\apache\tomcat\embed\tomcat-embed-websocket\8.5.39\tomcat-embed-websocket-8.5.39.jar;D:\JavaTools\localRepository\org\springframework\spring-webmvc\5.0.13.RELEASE\spring-webmvc-5.0.13.RELEASE.jar;D:\JavaTools\localRepository\org\springframework\spring-aop\5.0.13.RELEASE\spring-aop-5.0.13.RELEASE.jar;D:\JavaTools\localRepository\org\springframework\spring-beans\5.0.13.RELEASE\spring-beans-5.0.13.RELEASE.jar;D:\JavaTools\localRepository\org\springframework\spring-context\5.0.13.RELEASE\spring-context-5.0.13.RELEASE.jar;D:\JavaTools\localRepository\org\springframework\spring-expression\5.0.13.RELEASE\spring-expression-5.0.13.RELEASE.jar;D:\JavaTools\localRepository\org\springframework\spring-web\5.0.13.RELEASE\spring-web-5.0.13.RELEASE.jar;D:\JavaTools\localRepository\org\slf4j\slf4j-api\1.7.26\slf4j-api-1.7.26.jar;D:\JavaTools\ideaIC-2021.2.3.win\lib\idea_rt.jar sample.tomcat.SampleTomcatApplication
Connected to the target VM, address: '127.0.0.1:51332', transport: 'socket'
class sample.tomcat.SampleTomcatApplication
org.springframework.boot.SpringApplication.SpringApplication(org.springframework.core.io.ResourceLoader, java.lang.Class<?>...)
org.springframework.boot.SpringApplication.setInitializers
org.springframework.boot.SpringApplication.getSpringFactoriesInstances(java.lang.Class<T>, java.lang.Class<?>[], java.lang.Object...)
org.springframework.core.io.support.SpringFactoriesLoader.loadFactoryNames
org.springframework.core.io.support.SpringFactoriesLoader.loadSpringFactories
java.util.Properties
org.springframework.boot.context.ConfigurationWarningsApplicationContextInitializer
org.springframework.boot.context.ContextIdApplicationContextInitializer
org.springframework.boot.context.config.DelegatingApplicationContextInitializer
org.springframework.boot.web.context.ServerPortInfoApplicationContextInitializer
org.springframework.boot.autoconfigure.SharedMetadataReaderFactoryContextInitializer
org.springframework.boot.autoconfigure.logging.ConditionEvaluationReportLoggingListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.ConfigurationWarningsApplicationContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.ContextIdApplicationContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.config.DelegatingApplicationContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.web.context.ServerPortInfoApplicationContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.autoconfigure.SharedMetadataReaderFactoryContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.autoconfigure.logging.ConditionEvaluationReportLoggingListener
org.springframework.boot.SpringApplication.getSpringFactoriesInstances(java.lang.Class<T>, java.lang.Class<?>[], java.lang.Object...)
org.springframework.core.io.support.SpringFactoriesLoader.loadFactoryNames
org.springframework.core.io.support.SpringFactoriesLoader.loadSpringFactories
java.util.Properties
org.springframework.boot.context.ConfigurationWarningsApplicationContextInitializer
org.springframework.boot.context.ContextIdApplicationContextInitializer
org.springframework.boot.context.config.DelegatingApplicationContextInitializer
org.springframework.boot.web.context.ServerPortInfoApplicationContextInitializer
org.springframework.boot.autoconfigure.SharedMetadataReaderFactoryContextInitializer
org.springframework.boot.autoconfigure.logging.ConditionEvaluationReportLoggingListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.ConfigurationWarningsApplicationContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.ContextIdApplicationContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.config.DelegatingApplicationContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.web.context.ServerPortInfoApplicationContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.autoconfigure.SharedMetadataReaderFactoryContextInitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.autoconfigure.logging.ConditionEvaluationReportLoggingListener
org.springframework.boot.SpringApplication.setListeners
org.springframework.boot.SpringApplication.getSpringFactoriesInstances(java.lang.Class<T>, java.lang.Class<?>[], java.lang.Object...)
org.springframework.core.io.support.SpringFactoriesLoader.loadFactoryNames
org.springframework.core.io.support.SpringFactoriesLoader.loadSpringFactories
java.util.Properties
sample.tomcat.MyListener
org.springframework.boot.ClearCachesApplicationListener
org.springframework.boot.builder.ParentContextCloserApplicationListener
org.springframework.boot.context.FileEncodingApplicationListener
org.springframework.boot.context.config.AnsiOutputApplicationListener
org.springframework.boot.context.config.ConfigFileApplicationListener
org.springframework.boot.context.config.DelegatingApplicationListener
org.springframework.boot.context.logging.ClasspathLoggingApplicationListener
org.springframework.boot.context.logging.LoggingApplicationListener
org.springframework.boot.liquibase.LiquibaseServiceLocatorApplicationListener
org.springframework.boot.autoconfigure.BackgroundPreinitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
sample.tomcat.MyListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.ClearCachesApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.builder.ParentContextCloserApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.FileEncodingApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.config.AnsiOutputApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.config.ConfigFileApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.config.DelegatingApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.logging.ClasspathLoggingApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.logging.LoggingApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.liquibase.LiquibaseServiceLocatorApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.autoconfigure.BackgroundPreinitializer
org.springframework.boot.SpringApplication.getSpringFactoriesInstances(java.lang.Class<T>, java.lang.Class<?>[], java.lang.Object...)
org.springframework.core.io.support.SpringFactoriesLoader.loadFactoryNames
org.springframework.core.io.support.SpringFactoriesLoader.loadSpringFactories
java.util.Properties
sample.tomcat.MyListener
org.springframework.boot.ClearCachesApplicationListener
org.springframework.boot.builder.ParentContextCloserApplicationListener
org.springframework.boot.context.FileEncodingApplicationListener
org.springframework.boot.context.config.AnsiOutputApplicationListener
org.springframework.boot.context.config.ConfigFileApplicationListener
org.springframework.boot.context.config.DelegatingApplicationListener
org.springframework.boot.context.logging.ClasspathLoggingApplicationListener
org.springframework.boot.context.logging.LoggingApplicationListener
org.springframework.boot.liquibase.LiquibaseServiceLocatorApplicationListener
org.springframework.boot.autoconfigure.BackgroundPreinitializer
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
sample.tomcat.MyListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.ClearCachesApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.builder.ParentContextCloserApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.FileEncodingApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.config.AnsiOutputApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.config.ConfigFileApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.config.DelegatingApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.logging.ClasspathLoggingApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.logging.LoggingApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.liquibase.LiquibaseServiceLocatorApplicationListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.autoconfigure.BackgroundPreinitializer
deduceMainApplicationClass
<init>
<init>
main
org.springframework.boot.SpringApplication.getSpringFactoriesInstances(java.lang.Class<T>, java.lang.Class<?>[], java.lang.Object...)
org.springframework.core.io.support.SpringFactoriesLoader.loadFactoryNames
org.springframework.core.io.support.SpringFactoriesLoader.loadSpringFactories
java.util.Properties
org.springframework.boot.context.event.EventPublishingRunListener
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.context.event.EventPublishingRunListener
spring 的监听模式。
java.lang.ClassNotFoundException: main
	at java.net.URLClassLoader.findClass(URLClassLoader.java:382)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:349)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
	at java.lang.Class.forName0(Native Method)
	at java.lang.Class.forName(Class.java:264)
	at org.springframework.boot.SpringApplication.deduceMainApplicationClass(SpringApplication.java:280)
	at org.springframework.boot.SpringApplication.<init>(SpringApplication.java:270)
	at org.springframework.boot.SpringApplication.<init>(SpringApplication.java:241)
	at sample.tomcat.SampleTomcatApplication.main(SampleTomcatApplication.java:54)
listenersorg/springframework/boot/SpringApplication.java:296
org.springframework.boot.SpringApplicationRunListeners.starting
org.springframework.boot.context.event.EventPublishingRunListener@35083305
org.springframework.boot.context.event.EventPublishingRunListener.starting
-----------------------------------------------------------------------------
sample.tomcat.MyListener.onApplicationEvent
配置文件的顺序。
org.springframework.boot.SpringApplication.prepareEnvironment
-----------------------------------------------------------------------------
sample.tomcat.MyListener.onApplicationEvent
   ___     ___     ___   __  __    ___     ___     ___   __   __   ___    _  _     ___
  / __|   /   \   / _ \  \ \/ /   |_ _|   /   \   / _ \  \ \ / /  /   \  | \| |   / __|
 | (__    | - |  | (_) |  >  <     | |    | - |  | (_) |  \ V /   | - |  | .` |  | (_ |
  \___|   |_|_|   \___/  /_/\_\   |___|   |_|_|   \___/   _|_|_   |_|_|  |_|\_|   \___|
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_| """ |_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
org.springframework.boot.SpringApplication.createApplicationContext
org.springframework.boot.SpringApplication.getSpringFactoriesInstances(java.lang.Class<T>, java.lang.Class<?>[], java.lang.Object...)
org.springframework.core.io.support.SpringFactoriesLoader.loadFactoryNames
org.springframework.core.io.support.SpringFactoriesLoader.loadSpringFactories
java.util.Properties
org.springframework.boot.diagnostics.FailureAnalyzers
org.springframework.boot.SpringApplication.createSpringFactoriesInstances
org.springframework.boot.diagnostics.FailureAnalyzers
准备工厂
2021-12-15 22:42:39.982  INFO 11892 --- [           main] o.s.boot.SpringApplication               : Starting application on YANG with PID 11892 (started by YANG in D:\JavaCode\SrcCode\spring-boot-2.0.x)
2021-12-15 22:42:39.986  INFO 11892 --- [           main] o.s.boot.SpringApplication               : No active profile set, falling back to default profiles: default
-----------------------------------------------------------------------------
sample.tomcat.MyListener.onApplicationEvent
org.springframework.context.support.AbstractApplicationContext.refresh
org.springframework.context.support.AbstractApplicationContext.onRefresh 下的实现可以 createTomcat
2021-12-15 22:42:40.034  INFO 11892 --- [           main] ConfigServletWebServerApplicationContext : Refreshing org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@7c83dc97: startup date [Wed Dec 15 22:42:40 CST 2021]; root of context hierarchy
org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.onRefresh
org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.createWebServer
tomcat 启动问题!!!
org.springframework.boot.web.embedded.tomcat.TomcatWebServer.getPortsDescription
2021-12-15 22:42:41.467  INFO 11892 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
org.apache.catalina.startup.Tomcat@515f4131
2021-12-15 22:42:41.494  INFO 11892 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2021-12-15 22:42:41.495  INFO 11892 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/8.5.39
2021-12-15 22:42:41.503  INFO 11892 --- [ost-startStop-1] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [C:\Java\jdk1.8.0_201\bin;C:\Windows\Sun\Java\bin;C:\Windows\system32;C:\Windows;D:\JavaTools\apache-ant-1.9.15\bin;D:\JavaTools\apache-maven-3.6.3\bin;C:\Java\jdk1.8.0_201\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\Git\cmd;C:\Users\YANG\AppData\Local\Microsoft\WindowsApps;;.]
2021-12-15 22:42:41.606  INFO 11892 --- [ost-startStop-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2021-12-15 22:42:41.606  INFO 11892 --- [ost-startStop-1] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 1574 ms
2021-12-15 22:42:41.682  INFO 11892 --- [ost-startStop-1] o.s.b.w.servlet.ServletRegistrationBean  : Servlet dispatcherServlet mapped to [/]
2021-12-15 22:42:41.687  INFO 11892 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'characterEncodingFilter' to: [/*]
2021-12-15 22:42:41.687  INFO 11892 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
2021-12-15 22:42:41.687  INFO 11892 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpPutFormContentFilter' to: [/*]
2021-12-15 22:42:41.687  INFO 11892 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'requestContextFilter' to: [/*]
2021-12-15 22:42:41.709  INFO 11892 --- [ost-startStop-1] sample.tomcat.SampleTomcatApplication    : ServletContext initialized
2021-12-15 22:42:41.794  INFO 11892 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2021-12-15 22:42:41.874  INFO 11892 --- [           main] s.w.s.m.m.a.RequestMappingHandlerAdapter : Looking for @ControllerAdvice: org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@7c83dc97: startup date [Wed Dec 15 22:42:40 CST 2021]; root of context hierarchy
2021-12-15 22:42:41.937  INFO 11892 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/],methods=[GET]}" onto public java.lang.String sample.tomcat.web.SampleController.helloWorld()
2021-12-15 22:42:41.939  INFO 11892 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error]}" onto public org.springframework.http.ResponseEntity<java.util.Map<java.lang.String, java.lang.Object>> org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.error(javax.servlet.http.HttpServletRequest)
2021-12-15 22:42:41.940  INFO 11892 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error],produces=[text/html]}" onto public org.springframework.web.servlet.ModelAndView org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.errorHtml(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
2021-12-15 22:42:41.962  INFO 11892 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/webjars/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2021-12-15 22:42:41.962  INFO 11892 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2021-12-15 22:42:42.082  INFO 11892 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Registering beans for JMX exposure on startup
-----------------------------------------------------------------------------
sample.tomcat.MyListener.onApplicationEvent
org.springframework.boot.web.embedded.tomcat.TomcatWebServer.start
org.springframework.boot.web.embedded.tomcat.TomcatWebServer.getPortsDescription
2021-12-15 22:42:42.128  INFO 11892 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
-----------------------------------------------------------------------------
sample.tomcat.MyListener.onApplicationEvent
8080
2021-12-15 22:42:42.132  INFO 11892 --- [           main] o.s.boot.SpringApplication               : Started application in 2.696 seconds (JVM running for 3.672)
listener：org.springframework.boot.context.event.EventPublishingRunListener@35083305
-----------------------------------------------------------------------------
sample.tomcat.MyListener.onApplicationEvent
-----------------------------------------------------------------------------
sample.tomcat.MyListener.onApplicationEvent
run end----------------------------------

```



# SpringBoot源码的启动方式

```java
SampleTomcatApplication
```



```java
Class<SampleTomcatApplication> sampleTomcatApplicationClass = SampleTomcatApplication.class;
System.out.println(sampleTomcatApplicationClass);
SpringApplication springApplication = new SpringApplication(sampleTomcatApplicationClass);
springApplication.run();

org.springframework.boot.SpringApplication#deduceMainApplicationClass
org.springframework.boot.web.embedded.tomcat.TomcatWebServer#start

```



org.springframework.boot.SpringApplication#SpringApplication(org.springframework.core.io.ResourceLoader, java.lang.Class<?>...)

# SpringBoot中的Tomcat

org.springframework.boot.web.embedded.tomcat.TomcatWebServer.getPortsDescription

