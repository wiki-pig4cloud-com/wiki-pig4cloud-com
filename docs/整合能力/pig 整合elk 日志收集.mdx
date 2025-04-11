ELK即Elasticsearch、Logstash、Kibana,组合起来可以搭建线上日志系统，在目前这种分布式微服务系统中，通过ELK 会非常方便的查询和统计日志情况.



本文以pig 的upms 模块为例



+ Elasticsearch:用于存储收集到的日志信息；
+ Logstash:用于收集日志，应用整合了Logstash以后会把日志发送给Logstash,Logstash再把日志转发给Elasticsearch；
+ Kibana:通过Web端的可视化界面来查看日志。



![](https://cdn.nlark.com/yuque/0/2022/png/283679/1648973343218-b7a18b2f-0fe2-4cbf-b0f3-545482fa672f.png)



## 搭建ELK环境
### 
### ① 编写docker-compose.yml脚本启动ELK服务


```yaml
version: '3'
services:
  elasticsearch:
    image: elasticsearch:6.4.0
    container_name: elasticsearch
    environment:
      - "cluster.name=elasticsearch" #设置集群名称为elasticsearch
      - "discovery.type=single-node" #以单一节点模式启动
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m" #设置使用jvm内存大小
    volumes:
      - /mydata/elasticsearch/plugins:/usr/share/elasticsearch/plugins #插件文件挂载
      - /mydata/elasticsearch/data:/usr/share/elasticsearch/data #数据文件挂载
    ports:
      - 9200:9200
  kibana:
    image: kibana:6.4.0
    container_name: kibana
    links:
      - elasticsearch:es #可以用es这个域名访问elasticsearch服务
    depends_on:
      - elasticsearch #kibana在elasticsearch启动之后再启动
    environment:
      - "elasticsearch.hosts=http://es:9200" #设置访问elasticsearch的地址
    ports:
      - 5601:5601
  logstash:
    image: logstash:6.4.0
    container_name: logstash
    volumes:
      - /mydata/logstash/upms-logstash.conf:/usr/share/logstash/pipeline/logstash.conf 
    depends_on:
      - elasticsearch #kibana在elasticsearch启动之后再启动
    links:
      - elasticsearch:es #可以用es这个域名访问elasticsearch服务
    ports:
      - 4560:4560
```



### ② 创建对应容器挂载目录


```plain
mkdir -p /mydata/logstash

mkdir -p /mydata/elasticsearch/data

mkdir -p /mydata/elasticsearch/plugins


chmod 777 /mydata/elasticsearch/data  # 给777权限，不然启动elasticsearch 可能会有权限问题
```



### ③ 编写日志采集logstash


在  `/mydata/logstash`目录创建 `upms-logstash.conf`



```shell
input {
  tcp {
    mode => "server"
    host => "0.0.0.0"
    port => 4560
    codec => json_lines
  }
}
output {
  elasticsearch {
    hosts => "es:9200"
    index => "upms-logstash-%{+YYYY.MM.dd}"
  }
}
```



### ④ 启动ELK 服务


在`docker-compose.yml` 同级目录执行 `docker-compose up -d`



注意：Elasticsearch启动可能需要好几分钟，要耐心等待。



![](https://cdn.nlark.com/yuque/0/2020/png/283679/1599470403248-8d70b63e-a96e-4440-b2c1-4b65bf3d75a4.png)



### ⑤ logstash 安装json_lines 格式插件


```plain
# 进入logstash容器
docker exec -it logstash /bin/bash
# 进入bin目录
cd /bin/
# 安装插件
logstash-plugin install logstash-codec-json_lines
# 退出容器
exit
# 重启logstash服务
docker restart logstash
```



### ⑥ 访问宿主机5601 kibana


![](https://cdn.nlark.com/yuque/0/2020/png/283679/1599470402692-ec46654c-1e94-4ff8-8d11-39a1dc323a52.png)



## 服务整合Logstash （以UPMS模块为例）


### ① 添加pom 依赖


```xml
<!--集成logstash-->
<dependency>
    <groupId>net.logstash.logback</groupId>
    <artifactId>logstash-logback-encoder</artifactId>
    <version>5.3</version>
</dependency>
```



### ② logback-spring.xml 新增appender


```xml
 <!--输出到logstash的appender-->
<appender name="LOGSTASH" class="net.logstash.logback.appender.LogstashTcpSocketAppender">
    <!--可以访问的logstash日志收集端口-->
    <destination>192.168.0.31:4560</destination>
    <encoder charset="UTF-8" class="net.logstash.logback.encoder.LogstashEncoder"/>
</appender>
<root level="INFO">
    <appender-ref ref="LOGSTASH"/>
</root>
```



### ③ 启动pig 在kibana中查询日志


![](https://cdn.nlark.com/yuque/0/2020/png/283679/1599470402985-aeb1a6bc-079c-43c0-b30e-42ab8d5227b7.png)

![](https://cdn.nlark.com/yuque/0/2020/png/283679/1599470402668-b36392b1-bb06-4c9b-b814-e1af5b672b7a.png)



## 扩展:  采集多个模块日志


:::warning
`每个应用发送到不同的TCP 端口 这里注意logstash 的容器端口映射增加`

:::



```shell
input {
  tcp {
   add_field => {"service" => "upms"}
    mode => "server"
    host => "0.0.0.0"
    port => 4560
    codec => json_lines
  }
  tcp {
   add_field => {"service" => "auth"}
    mode => "server"
    host => "0.0.0.0"
    port => 4561
    codec => json_lines
  }
}
output {
   if [service] == "upms"{
    elasticsearch {
      hosts => "es:9200"
      index => "upms-logstash-%{+YYYY.MM.dd}"
    }
   }
  if [service] == "auth"{
    elasticsearch {
      hosts => "es:9200"
      index => "auth-logstash-%{+YYYY.MM.dd}"
    }
   }
}
```

## ❤  问题咨询
![](https://cdn.nlark.com/yuque/0/2022/gif/283679/1662563973685-c22e9831-db66-42b5-973f-886d25d1e0e7.gif)

