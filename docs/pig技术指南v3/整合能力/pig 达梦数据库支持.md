## <font style="color:rgb(38, 38, 38);"> ① 背景</font>
默认情况下 , pig 仅提供的 MySQL 的数据库脚本，很多同学咨询是否能够提供 PG、国产化等等各种数据库的支持，答案： **<font style="color:#DF2A3F;">必须支持</font>**。

:::warning
为了 SQL 的准确性、实时性，其他类型的数据库脚本，**<font style="color:#DF2A3F;">需要开发者基于 PIG MYSQL 版本转换一下</font>**，本文档以 达梦数据库为例；

:::

##   ② 安装达梦
### 2.1 Docker 运行 DM8
```shell
# X86 默认用户 SYSDBA/SYSDBA
docker run -p 5236:5236 registry.cn-hangzhou.aliyuncs.com/dockerhub_mirror/dm:8

# ARM 默认用户 SYSDBA/SYSDBA
docker run -p 5236:5236 registry.cn-hangzhou.aliyuncs.com/dockerhub_mirror/dm:8-arm64
```

### <font style="color:rgb(38, 38, 38);">2.2  安装 SQLark</font>
<font style="color:rgb(38, 38, 38);">SQLark 是一款面向信创应用开发者的数据库开发管理、数据库迁移 工具，用于快速查询、创建和管理不同类型的数据库系统，现已支持达梦、Oracle 和 MySQL 数据库。</font>

[SQLark-信创数据库开发，用百灵](https://www.sqlark.com/)

虽然安装达梦会自动安装 DTS (达梦自身的迁移工具)和图形化管理工具，但是之前的 UI 和操作性太差了并不支持 MacOS；目前达梦又搞了 SQLark ，笔者用起来挺好的，并且整合了数据迁移工具。

![](https://cdn.nlark.com/yuque/0/2024/png/283679/1732329067575-d3756054-0f9a-48c9-b444-1345bc14d516.png)

###   2.3  数据迁移
1. 先创建达梦数据库链接
2. 点击 SQLark 的数据迁移
3. 创建迁移评估
4. 链接源数据库 （MYSQL）
5. 选择待迁移的数据库 （pig/pig_config）, <font style="color:#DF2A3F;">迁移成功会自动创建 PIG/PIG_CONFIG 的达梦数据库</font>
6. 注意关闭检查
7. 注意迁移进度，由于 quartz 的数据结构外键 不适配达梦，有点不兼容可以忽略



![](https://cdn.nlark.com/yuque/0/2024/png/283679/1732331372684-551072c3-b9ce-4274-8a5c-049e250b161b.png)

![](https://cdn.nlark.com/yuque/0/2024/png/283679/1732332106399-1ee8cf7c-5820-4062-af31-5e8a9a79c4c8.png)

## ③ 应用修改
### 3.1 pig-register
+ 默认 nacos 应用需要引入相关的达梦驱动、达梦适配插件

```xml
<!--达梦数据库 nacos 插件-->
<dependency>
  <groupId>com.pig4cloud.plugin</groupId>
  <artifactId>nacos-datasource-plugin-dm8</artifactId>
  <version>${VERSION}</version>
</dependency>

<!--达梦数据库驱动-->
<dependency>
  <groupId>com.dameng</groupId>
  <artifactId>DmJdbcDriver18</artifactId>
  <version>8.1.1.193</version>
</dependency>
```

+ 配置 nacos 数据库链接信息

```yaml
db:
  num: 1
  url:
    0: jdbc:dm://127.0.0.01:5236?schema=PIG_CONFIG
  user: SYSDBA
  password: SYSDBA
  pool:
    config:
      driver-class-name: dm.jdbc.driver.DmDriver

# 配置数据库： dameng  （属性默认 mysql注意修改dameng）
spring:
  sql:
    init:
      platform: dameng
```

### 3.2 应用微服务增加达梦
+ pig-upms-biz、pig-codegen 、pig-quartz 所有链接数据库的模块增加达梦驱动

```xml
<!--达梦数据库驱动-->
<dependency>
  <groupId>com.dameng</groupId>
  <artifactId>DmJdbcDriver18</artifactId>
  <version>8.1.1.193</version>
</dependency>
```

+ 修改 nacos/pig-upms-biz-dev.yml 、pig-codegen-dev.yml、pig-quartz-dev.yml  **JdbcURL**

```yaml
spring:
  datasource:
    type: com.zaxxer.hikari.HikariDataSource
    driver-class-name: dm.jdbc.driver.DmDriver
    username: SYSDBA
    password: SYSDBA
    url: jdbc:dm://127.0.0.01:5236?schema=PIG
```

+ pig-codegen/pom.xml 增加 anyline 达梦插件依赖读取数据元数据

```xml
<dependency>
  <groupId>org.anyline</groupId>
  <artifactId>anyline-data-jdbc-dm</artifactId>
  <version>${anyline.version}</version>
</dependency>
```

## ④ 访问测试
![](https://cdn.nlark.com/yuque/0/2023/png/283679/1700527095040-b7284663-dc53-4c11-a0c2-7b59c1cd2a08.png)

