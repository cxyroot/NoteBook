# github使用

```shell
git ssh-key配置
git config --global user.name "John Doe" //配置用户名

git config --global user.email “johndoe@example.com //配置邮箱
ssh-keygen -t rsa -C "xxxx@qq.com" //配置ssh key文件


git config --global user.name "cxyroot"
git config --global user.email "1076675153@qq.com"
ssh-keygen -t rsa -C "1076675153@qq.com"


git更新强制覆盖本地:
    git pull 时出现冲突 放弃本地修改，使远程库内容强制覆盖本地代码
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

```shell
删除本地分支和远程分支
　　1 先切换到别的分支: git checkout master
　　2 删除本地分支： git branch -d 20220314
　　3 如果删除不了可以强制删除，git branch -D 20220314
　　4 有必要的情况下，删除远程分支(慎用)：git push origin --delete 20220314
　　5 在从公用的仓库fetch代码：git fetch origin 20220314:20220314
　　6 然后切换分支即可：git checkout 20220314

创建远程分支和将分支推送的master上
	git branch -d 20220328
	git push --set-upstream origin 20220328
	git remote add origin  [URL]
	git branch --set-upstream-to=origin/20220328 
	git branch 20220328
```

