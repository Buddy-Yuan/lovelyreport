# lovelyreport
This is an automatic oracle report

一、通过shell调用
可以直接生成一小时内监听每分钟连接数趋势图，当然这些是自己可以改成按秒，按小时，按IP都行，直接修改shell代码即可。
用法
1.在操作系统中运行connect.sh，第一个参数输入时间，比如："06-DEC-2017 10",第二个参数输入监听路径，比如："/oracle/app/11.2.0/grid/network/log/listener_1.log"
sh connect.sh "06-DEC-2017 10" "/oracle/app/11.2.0/grid/network/log/listener_1.log"
2.运行完成后会输出一些内容.
3.将输出的内容保存成html格式，放在根目录下，用google、IE浏览器打开即可。

二、通过SQL调用
可以生成一个小时的逻辑读趋势图。当然还有158种方式，可以修改SQL代码中V$SYSMETRIC_HISTORY的METRIC_NAME值
用法
1.在数据库中运行PhysicalRead.sql
2.运行完成后会在当前目录下生成PhysicalRead.html，将这个文件cat出来，放在根目录下，用google、IE浏览器打开即可。效果如下：
