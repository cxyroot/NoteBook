# 1mysql登录命令

mysql -u root -p  123456

退出命令

​	exit/quit

清屏命令

​	cls

# 2mysql基本操作

show databases;

use [databasename];

show tables;

select *from [tablename];

drop tables

# 3一些实用的操作

迁移数据

insert into [table]
  select *
    from [table]
commit;

# MySQL生成数据

```java
package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertDataDemo {
    static Connection conn = null;

    public static void initConn() throws ClassNotFoundException, SQLException {

        String url = "jdbc:mysql://localhost:3306/test?"
                + "user=root&password=123456&useUnicode=true&characterEncoding=UTF8&useSSL=false&serverTimezone=UTC";

        try {
            // 动态加载mysql驱动
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("成功加载MySQL驱动程序");
            conn = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static String randomStr(int size) {
        //定义一个空字符串
        String result = "";
        for (int i = 0; i < size; ++i) {
            //生成一个97~122之间的int类型整数
            int intVal = (int) (Math.random() * 26 + 97);
            //强制转换（char）intVal 将对应的数值转换为对应的字符，并将字符进行拼接
            result = result + (char) intVal;
        }
        //输出字符串
        return result;
    }


    public static void insert(int insertNum) {
        // 开时时间
        Long begin = System.currentTimeMillis();
        System.out.println("开始插入数据...");
        // sql前缀
        String prefix = "INSERT INTO t_dept (deptName, address) VALUES ";

        try {
            // 保存sql后缀
            StringBuffer suffix = new StringBuffer();
            // 设置事务为非自动提交
            conn.setAutoCommit(false);
            PreparedStatement pst = conn.prepareStatement("");
            for (int i = 1; i <= insertNum; i++) {
                // 构建sql后缀
                suffix.append("('"+ randomStr(8)  + "'," + i * Math.random() + "),");
            }
            // 构建完整sql
            String sql = prefix + suffix.substring(0, suffix.length() - 1);
            // 添加执行sql
            System.out.println(sql);
            pst.addBatch(sql);
            // 执行操作
            pst.executeBatch();
            // 提交事务
            conn.commit();

            // 关闭连接
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 结束时间
        Long end = System.currentTimeMillis();
        System.out.println("插入"+insertNum+"条数据数据完成！");
        System.out.println("耗时 : " + (end - begin) / 1000 + " 秒");
    }


    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        for (int i = 0;i < 10000;i++){
            initConn();
            insert(50);
        }

    }
}
```



# mysql的索引

简单索引

复合索引

# mysql的索引失效



```
1：索引列上不能有任何操作（计算，函数、自动或者类型转换）

2：存储引擎不能使用索引中范围条件右边的列

3：mysql在使用不等于（！=  和 <>）的时候 会有全表扫描的情况

4：mysql 使用is not null 的时候会有全表扫描，使用is null的时候不会

5：like 以通配符（%abc）的情况会使索引失效   / like 以通配符（abc%）的情况会使索引失效  

6：字符串不加单引号索引失效
```



```
一般性建议
```

# MySQL 创建数据表

```sql
CREATE TABLE IF NOT EXISTS `runoob_tbl`(
   `runoob_id` INT UNSIGNED AUTO_INCREMENT,
   `runoob_title` VARCHAR(100) NOT NULL commit '',
   `runoob_author` VARCHAR(40) NOT NULL,
   `submission_date` DATE,
   PRIMARY KEY ( `runoob_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

