## 
[bilibili](https://player.bilibili.com/player.html?bvid=BV12t411B7e9&p=13&page=13)

## 安装 RocketMQ


+ 下载脚本文件



```shell
git clone https://github.com/pig-mesh/rocketmq-docker-compose
```



+ 修改 IP 为宿主机 IP



```shell
vim ./broker.conf
```



![](https://minio.pigx.vip/oss/1631422598.png)



+ 执行启动 rocketmq



```shell
docker-compose up -d
```



## 代码整合


+ 目标服务增加 rocketmq 依赖 jar



```xml
<dependency>
    <groupId>com.pig4cloud.plugin</groupId>
    <artifactId>rocketmq-spring-boot3-starter</artifactId>
    <version>2.2.3</version>
</dependency>
```



+ nacos **对应的服务**配置文件增加链接相关信息



```yaml
rocketmq:
  name-server: 192.168.0.12:9876
  producer:
    group: test-group
```



+ 配置队列监听消费者



```java
@Slf4j
@Service
@RocketMQMessageListener(topic = "test-topic-1", consumerGroup = "test-group")
public class MyConsumer1 implements RocketMQListener<String> {
    public void onMessage(String message) {
        log.info("received message: {}", message);
    }
}
```



+ 测试消息发送



```java
@SpringBootTest
class DemoApplicationTests {

    @Autowired
    private RocketMQTemplate rocketMQTemplate;

    @Test
    void contextLoads() {
        rocketMQTemplate.convertAndSend("test-topic-1", "Hello, World!");
    }
}
```

## ❤  问题咨询
![](https://cdn.nlark.com/yuque/0/2022/gif/283679/1662563973685-c22e9831-db66-42b5-973f-886d25d1e0e7.gif)

