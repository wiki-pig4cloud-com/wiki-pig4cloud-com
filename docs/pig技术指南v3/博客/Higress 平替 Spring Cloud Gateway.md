## 
## Higress 是什么


![](https://minio.pigx.top/oss/202307/1689167917.jpg)



如上图所示，① 在传统的虚拟化部署中，微服务通常选择使用 Spring Cloud Gateway 作为业务网关，而nginx则作为前置流量网关。



② 在容器和K8s主导的云原生时代，Ingress 成为 K8s 生态的网关标准，赋予了网关新的使命，使得流量网关和微服务网关的合并成为可能。



③ Higress 是基于阿里内部构建的下一代云原生网关，实现了流量调度 + 服务治理 + 安全防护三合一的高集成能力，并深度集成了Dubbo、Nacos、Sentinel等微服务技术栈。



**在最新的 Higress 1.1 版本中，支持脱离 K8s 部署。本文将使用 Higress 替代原有的 Spring Cloud Gateway，实现 Spring Cloud 微服务的无缝迁移。**



> 云原生网关部署新范式丨 Higress 发布 1.1 版本，支持脱离 K8s 部署
>



![](https://minio.pigx.top/oss/202307/1689203847.jpg)



## 部署 PIG 微服务


PIG 是基于 Spring Boot 3.1、Spring Cloud 2022 & Alibaba、Spring Authorization Server 的微服务开发平台。



#### ① 部署微服务应用


```plain
# 获取源码

git clone https://gitee.com/log4j/pig.git -b jdk17

git clone https://gitee.com/log4j/pig-ui.git -b jdk17
```



+ 配套文档： [https://wiki.pig4cloud.com](https://wiki.pig4cloud.com)

## 部署 Higress


使用一行命令即可完成非 K8s 环境下的部署（兼容 macOS 和 Linux，Windows 需要安装 Cygwin）：



```plain
# nacos 指向 pig-register 对应的nacos 服务
curl -fsSL https://higress.io/standalone/get-higress.sh | bash -s -- -c nacos://172.16.1.109:8848 --nacos-username=nacos --nacos-password=nacos
```



启动成功后，本机端口占用情况如下：



+ 80端口：Higress 暴露，用于 HTTP 协议代理
+ 443端口：Higress 暴露，用于 HTTPS 协议代理
+ 15020端口：Higress 暴露，用于暴露 Prometheus 指标





#### ① 配置 higress 域名


+ 配置域名解析至 higress 所在机器的 80/443 端口



![](https://minio.pigx.top/oss/202307/1689204738.png)



#### ② 服务列表


+ 服务列表自动同步指向的 naco 中已注册服务列表



![](https://minio.pigx.top/oss/202307/1689204805.png)



#### ③ 配置路由转发


+ 在路由管理中创建两条新的路由，根据路由前缀将其转发至相应的微服务



![](https://minio.pigx.top/oss/202307/1689204980.png)



#### ④ 配置路由规则以及对应的重写策略


![](https://cdn.nlark.com/yuque/0/2024/png/283679/1713623732600-7b75f0c2-3fa2-4376-ab2b-158928f54886.png)

通过重写策略，可以将 /admin/user/info 转发为 /user/info，从而删除对应的路由前缀，实现 Spring Cloud Gateway path rewrite filter 的功能

```shell
/auth/oauth2/token -> /oauth2/token
/admin/user/info  -> /user/info
```



![](https://minio.pigx.top/oss/202307/1689205035.png)

## 运行测试
+  停用原有的 spring-cloud-gateway 服务（pig-gateway） 
+  将前端链接至 higress 



![](https://cdn.nlark.com/yuque/0/2024/png/283679/1713623837669-7ada85ef-32a8-4127-b2dd-c5767a60e191.png)



+ 访问本地 UI 测试 ， [http://localhost:8888](http://localhost:8888)



## 总结


相比于其他网关竞品如 kong/apisix，Higress + Nacos 的组合提供了最小集运行环境，同时满足用户服务注册、配置管理和微服务治理的需求，**易于上手，非常优秀！**



![](https://minio.pigx.top/oss/202307/1689205484.png)

