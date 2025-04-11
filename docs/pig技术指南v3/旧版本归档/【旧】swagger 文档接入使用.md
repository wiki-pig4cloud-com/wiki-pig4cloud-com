[bilibili](https://player.bilibili.com/player.html?bvid=BV12t411B7e9&p=5&page=5&autoplay=0)

:::success
## <font style="color:#DF2A3F;">本文适配 v3.7 以下版本</font>
:::

## ①  服务添加 swagger  依赖
```xml
<!--接口文档-->
<dependency>
  <groupId>com.pig4cloud</groupId>
  <artifactId>pig-common-swagger</artifactId>
</dependency>
```



## ②   nacos 维护swagger 转发
+ ①  当前的服务名称，以注册到 nacos 中的为准
+ ②   在 application-dev.yml 路由前缀 ， 注意和 pig-gateway-dev.yml 里面的配置对应

![](https://cdn.nlark.com/yuque/0/2022/png/283679/1648806142182-3e544f4c-d532-46e3-8c97-611fa4a00289.png)



## ③ 特别注意


+ **Controller 接口上边必须增加 ****<font style="color:#bbb529;">@SecurityRequirement</font>****(name = HttpHeaders.**_**<font style="color:#9876aa;">AUTHORIZATION</font>**_**)**

![](https://cdn.nlark.com/yuque/0/2022/png/283679/1648806396932-bb15d848-c7bc-4d8c-8451-05e3490fa2f2.png)



## ④ 常用注解


:::success
详细注解可以参考: [https://blog.csdn.net/weixin_44768189/article/details/115055784](https://blog.csdn.net/weixin_44768189/article/details/115055784)

:::

![](https://cdn.nlark.com/yuque/0/2022/png/283679/1648806259602-add9c677-a602-443b-8060-f4d1e72f5cd6.png)

## 关闭 swagger 接口文档


+ nacos/gateway-dev.yml 配置关闭属性



```yaml
springdoc:
  api-docs:
    enabled: false
```



+ SpringDocConfiguration 增加关闭配置



![](https://minio.pigx.top/oss/202308/1692198689.png)

## 
## ❤  问题咨询
![](https://cdn.nlark.com/yuque/0/2022/gif/283679/1662563973685-c22e9831-db66-42b5-973f-886d25d1e0e7.gif)

