## 动态数据源


pig 的多数据配置，是基于 [dynamic-datasource-spring-boot-starter](https://github.com/baomidou/dynamic-datasource-spring-boot-starter/wiki)实现，理论上支持此组件的全部功能。



## 如何使用


#### 1. 业务服务引入动态数据源服务


```xml
<dependency>
  <groupId>com.pig4cloud</groupId>
  <artifactId>pig-common-datasource</artifactId>
</dependency>
```



#### 2. 配置数据源信息来源 （JDBC配置）


```yaml
## 默认查询本服务数据源 ` gen_datasource_conf` ，可参考 `pig_codegen` 模块
spring:
  datasource:
    druid:
      query-ds-sql: 'select * from gen_datasource_conf where del_flag = 0'
```



![](https://cdn.nlark.com/yuque/0/2020/png/283679/1599315066287-0a240b69-3494-476e-8892-0f4abba9ff2c.png)



#### 3. 开启动态数据源


```java
@EnableDynamicDataSource
public class App {
   public static void main(String[] args) {
      SpringApplication.run(App.class, args);
   }
}
```



#### 4. 使用动态数据源查询
:::color3
**Mapper 层 **`**@Ds("#last")**`** 固定写法，最后一个参数为指定数据源(必须有)**

:::

```java
@Mapper
public interface DemoMapper extends BaseMapper<Demo> {
   @DS("#last")
   Map selectDs(String dsName);
}
```



+ Service 层调用



```java
@Service
public class DemoServiceImpl extends ServiceImpl<DemoMapper, Demo> implements DemoService {
   @Override
   public Object getByDs(Integer id) {
      // 此处 dsName 为以上 gen_datasource_conf 加载数据源 name 字段
      return baseMapper.selectDs("pigxx_core");
   }
}
```



#### 扩展使用


+ [可以参考官方文档： 动态参数解析数据源](https://github.com/baomidou/dynamic-datasource-spring-boot-starter/wiki/Dynamic-Analysis-DataSource)



```java
@DS("#session.tenantName")//从session获取
public List selectSpelBySession() {
   return userMapper.selectUsers();
}

@DS("#header.tenantName")//从header获取
public List selectSpelByHeader() {
   return userMapper.selectUsers();
}

@DS("#tenantName")//使用spel从参数获取
public List selectSpelByKey(String tenantName) {
   return userMapper.selectUsers();
}

@DS("#user.tenantName")//使用spel从复杂参数获取
public List selecSpelByTenant(User user) {
   return userMapper.selectUsers();
}
```

## ❤  问题咨询
![](https://cdn.nlark.com/yuque/0/2022/gif/283679/1662563973685-c22e9831-db66-42b5-973f-886d25d1e0e7.gif)

