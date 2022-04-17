# hive查询

基本查询

```sql
create table if not exists dept(
deptno int,
dname string,
loc int
)
row format delimited fields terminated by '\t';

create table if not exists emp(
empno int,
ename string,
job string,
mgr int,
hiredate string, 
sal double, 
comm double,
deptno int)
row format delimited fields terminated by '\t';

#
load data local inpath '/home/soft/dept.txt' into table dept;

#
load data local inpath '/home/soft/emp.txt' into table emp;

/*
0: jdbc:hive2://hadoop102:10000> load data local inpath '/home/soft/dept.txt' into table dept;
INFO  : Loading data to table db_hive.dept from file:/home/soft/dept.txt
INFO  : Table db_hive.dept stats: [numFiles=1, totalSize=71]
No rows affected (0.151 seconds)
0: jdbc:hive2://hadoop102:10000> load data local inpath '/home/soft/emp.txt' into table emp;
INFO  : Loading data to table db_hive.emp from file:/home/soft/emp.txt
INFO  : Table db_hive.emp stats: [numFiles=1, totalSize=656]
No rows affected (0.123 seconds)
0: jdbc:hive2://hadoop102:10000> 
*/

select * from emp;

select id from emp;

select e.ename from emp e;

select e.ename nn from emp e;

select sal+1 from emp;



```

