## 1JUC

java.util.concurrent包

## 2进程/线程

什么是进程

```
我们都知道计算机的核心是CPU，它承担了所有的计算任务，而操作系统是计算机的管理者，它负责任务的调度，资源的分配和管理，统领整个计算机硬件；应用程序是具有某种功能的程序，程序是运行于操作系统之上的。进程是一个具有一定独立功能的程序在一个数据集上的一次动态执行的过程，是操作系统进行资源分配和调度的一个独立单位，是应用程序运行的载体。进程是一种抽象的概念，从来没有统一的标准定义。进程一般由程序，数据集合和进程控制块三部分组成。程序用于描述进程要完成的功能，是控制进程执行的指令集；数据集合是程序在执行时所需要的数据和工作区；程序控制块包含进程的描述信息和控制信息是进程存在的唯一标志
进程具有的特征：
​	动态性：进程是程序的一次执行过程，是临时的，有生命期的，是动态产生，动态消亡的；
​	并发性：任何进程都可以同其他进行一起并发执行；
​	独立性：进程是系统进行资源分配和调度的一个独立单位；
​	结构性：进程由程序，数据和进程控制块三部分组成
```

什么是线程

```
	在早期的操作系统中并没有线程的概念，进程是拥有资源和独立运行的最小单位，也是程序执行的最小单位。任务调度采用的是时间片
轮转的抢占式调度方式，而进程是任务调度的最小单位，每个进程有各自独立的一块内存，使得各个进程之间内存地址相互隔离。后来，随着计算机的发展，对CPU的要求越来越高，进程之间的切换开销较大，已经无法满足越来越复杂的程序的要求了。于是就发明了线程，线程是程序执行中一个单一的顺序控制流程，是程序执行流的最小单元，是处理器调度和分派的基本单位。一个进程可以有一个或多个线程，各个线程之间共享程序的内存空间(也就是所在进程的内存空间)。一个标准的线程由线程ID，当前指令指针PC，寄存器和堆栈组成。而进程由内存空间(代码，数据，进程空间，打开的文件)和一个或多个线程组成。
```

进程和线程的区别

```
进程与线程的区别
1. 线程是程序执行的最小单位，而进程是操作系统分配资源的最小单位；
2. 一个进程由一个或多个线程组成，线程是一个进程中代码的不同执行路线；
3. 进程之间相互独立，但同一进程下的各个线程之间共享程序的内存空间(包括代码段，数据集，堆等)及一些进程级的资源(如打开文件和信
号等)，某进程内的线程在其他进程不可见；
4. 调度和切换：线程上下文切换比进程上下文切换要快得多
```

## 3并发/并行 

并发

并行

## 4三个包

Java.util.concurrent

java.util.concurrent.atomic

java.util.concurrent.locks

## 5多线程

线程 

操作 

资源类

```java
package com.google;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class Ticket{
	private int number = 300;
	Lock lock = new ReentrantLock();
	public void sale(){
		lock.lock();
		try {
			if(number > 0){
				System.out.println(Thread.currentThread().getName() +"\t卖出第："+(number--)+"\t 还剩："+number);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			lock.unlock();
		}
	}
	
}
public class LockDemo {
	public static void main(String[] args) {
		
		Ticket t = new Ticket();
		new Thread(new Runnable() {
			@Override
			public void run() {
				for (int i = 0; i <= 100; i++) {
					t.sale();
				}
			}
		},"A").start();
		
		new Thread(new Runnable() {
			@Override
			public void run() {
				for (int i = 0; i <= 100; i++) {
					t.sale();
				}
			}
		},"B").start();
		
		new Thread(new Runnable() {
			@Override
			public void run() {
				for (int i = 0; i <= 100; i++) {
					t.sale();
				}
			}
		},"C").start();
	}
}

```



