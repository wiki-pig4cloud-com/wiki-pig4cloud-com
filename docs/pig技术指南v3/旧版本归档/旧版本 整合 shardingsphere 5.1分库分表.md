[此处为语雀卡片，点击链接查看](https://www.yuque.com/docs/135584005#LuU7y)

## 
:::warning
## 本文适配 SpringBoot 2.x ，PIG JDK8版本
:::

## 目标


<font style="color:#323232;">本章节以尽量短的时间，演示 PIG 框架如何整合 </font><font style="color:#323232;">Apache ShardingSphere 完成分表操作</font><font style="color:#323232;"> 。</font>



:::success
**实现效果:  日志表根据 请求方法的不同 拆分为 GET、POST、PUT、DELETE 数据库**

:::



## ![](https://cdn.nlark.com/yuque/0/2021/png/283679/1637109926530-3c9a5aa5-cced-4810-ab0b-a4fa2186f1b3.png)
## 
## 快速上手
### 1. 添加 maven 依赖
```xml
<dependency>
  <groupId>org.apache.shardingsphere</groupId>
  <artifactId>shardingsphere-jdbc-core-spring-boot-starter</artifactId>
  <version>5.1.2</version>
</dependency>
```

### 2. 添加四张测试表


```sql
CREATE TABLE `sys_log_GET` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                           `type` char(1) DEFAULT '1' COMMENT '日志类型',
                           `title` varchar(255) DEFAULT '' COMMENT '日志标题',
                           `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
                           `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
                           `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
                           `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
                           `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
                           `params` text COMMENT '操作提交的数据',
                           `time` mediumtext COMMENT '执行时间',
                           `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
                           `exception` text COMMENT '异常信息',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
                           `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
                           PRIMARY KEY (`id`),
                           KEY `sys_log_create_by` (`create_by`),
                           KEY `sys_log_request_uri` (`request_uri`),
                           KEY `sys_log_type` (`type`),
                           KEY `sys_log_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='日志表';

CREATE TABLE `sys_log_POST` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                           `type` char(1) DEFAULT '1' COMMENT '日志类型',
                           `title` varchar(255) DEFAULT '' COMMENT '日志标题',
                           `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
                           `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
                           `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
                           `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
                           `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
                           `params` text COMMENT '操作提交的数据',
                           `time` mediumtext COMMENT '执行时间',
                           `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
                           `exception` text COMMENT '异常信息',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
                           `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
                           PRIMARY KEY (`id`),
                           KEY `sys_log_create_by` (`create_by`),
                           KEY `sys_log_request_uri` (`request_uri`),
                           KEY `sys_log_type` (`type`),
                           KEY `sys_log_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='日志表';


CREATE TABLE `sys_log_PUT` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                           `type` char(1) DEFAULT '1' COMMENT '日志类型',
                           `title` varchar(255) DEFAULT '' COMMENT '日志标题',
                           `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
                           `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
                           `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
                           `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
                           `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
                           `params` text COMMENT '操作提交的数据',
                           `time` mediumtext COMMENT '执行时间',
                           `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
                           `exception` text COMMENT '异常信息',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
                           `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
                           PRIMARY KEY (`id`),
                           KEY `sys_log_create_by` (`create_by`),
                           KEY `sys_log_request_uri` (`request_uri`),
                           KEY `sys_log_type` (`type`),
                           KEY `sys_log_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='日志表';

CREATE TABLE `sys_log_DELETE` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                           `type` char(1) DEFAULT '1' COMMENT '日志类型',
                           `title` varchar(255) DEFAULT '' COMMENT '日志标题',
                           `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
                           `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
                           `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
                           `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
                           `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
                           `params` text COMMENT '操作提交的数据',
                           `time` mediumtext COMMENT '执行时间',
                           `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
                           `exception` text COMMENT '异常信息',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
                           `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
                           PRIMARY KEY (`id`),
                           KEY `sys_log_create_by` (`create_by`),
                           KEY `sys_log_request_uri` (`request_uri`),
                           KEY `sys_log_type` (`type`),
                           KEY `sys_log_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='日志表';

```

### 3.  nacos/pig-upms-biz-dev.yml 添加配置
```yaml
spring:
  shardingsphere:
    datasource:
      ds0:
        driver-class-name: com.mysql.cj.jdbc.Driver
        type: com.zaxxer.hikari.HikariDataSource
        username: root
        password: root
        jdbc-url: jdbc:mysql://pig-mysql:3306/pig?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true
      names: ds0
    props:
      sql-show: true
    rules:
      sharding:
        sharding-algorithms:
          table-inline:
            props:
              algorithm-expression: sys_log_$->{method}
            type: INLINE
        tables:
          sys_log:
            actual-data-nodes: ds0.sys_log_GET,ds0.sys_log_POST,ds0.sys_log_PUT,ds0.sys_log_DELETE
            table-strategy:
              standard:
                sharding-algorithm-name: table-inline
                sharding-column: method
```

### 4. 业务测试


:::warning
编辑角色、新增角色 查看数据库中日志表记录

:::





## ❤  问题咨询
![](https://cdn.nlark.com/yuque/0/2022/gif/283679/1662563973685-c22e9831-db66-42b5-973f-886d25d1e0e7.gif)

