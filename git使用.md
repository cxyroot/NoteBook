# 1github使用

### …or create a new repository on the command line

```shell
git ssh-key配置
git config --global user.name "John Doe" //配置用户名
git config --global user.email johndoe@example.com //配置邮箱
ssh-keygen -t rsa -C "xxxx@qq.com" //配置ssh key文件


git更新强制覆盖本地:
git pull时出现冲突 放弃本地修改，使远程库内容强制覆盖本地代码
git fetch --all //只是下载代码到本地，不进行合并操作
git reset --hard origin/master //把HEAD指向最新下载的版本
```



```shell
echo "# BigDate" >> README.md
git init //初始化
git add README.md  //添加修改文件
git commit -m "first commit" //提交代码注释
git branch -M master
git remote add origin https://github.com/cxyroot/BigDate.git //链接远程分支
git push -u origin master //推送文件到 master
              
```

### …or push an existing repository from the command line



```shell
git remote add origin https://github.com/cxyroot/BigDate.git
git branch -M master
git push -u origin master



seckill in:name
查询的github上点赞数
springboot start:>=500

查询github上的forks
springboot forks:500

springboot  start:80..100 forks:100:200

awesome tomcat 

redis



在github上使用 #L来高亮显示代码
https://github.com/cxyroot/Tomcat8Src/blob/master/bin/configtest.sh#L13

小写英文字母t

```



