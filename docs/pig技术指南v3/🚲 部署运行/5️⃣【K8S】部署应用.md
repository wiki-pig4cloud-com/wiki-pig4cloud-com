[bilibili](https://player.bilibili.com/player.html?bvid=BV12t411B7e9&p=38&page=38&autoplay=0)

# 准备<font style="color:rgb(23, 28, 52);">KubeSphere</font>环境
[KubeSphere](https://kubesphere.io/)<font style="color:rgb(54, 67, 92);"> 是在 </font>[Kubernetes](https://kubernetes.io/)<font style="color:rgb(54, 67, 92);"> 之上构建的面向云原生应用的</font>**<font style="color:rgb(54, 67, 92);">分布式操作系统</font>**<font style="color:rgb(54, 67, 92);">，完全开源，支持多云与多集群管理，提供全栈的 IT 自动化运维能力，简化企业的 DevOps 工作流。它的架构可以非常方便地使第三方应用与云原生生态组件进行即插即用 (plug-and-play) 的集成</font>

<font style="color:rgb(54, 67, 92);"></font>

```shell
export KKZONE=cn
curl -sfL https://get-kk.kubesphere.io | VERSION=v3.0.13 sh -

chmod +x kk
./kk create cluster --with-kubernetes v1.22.12 --with-kubesphere v3.4.0
```

# 图形化部署
![](https://cdn.nlark.com/yuque/0/2023/png/283679/1699792565741-679e490d-d597-4726-be94-dab9cca3c121.png)

以上 PIG 通过 Github Action 自动构建的镜像存储在阿里云 ACR，可通过以下地址获取：

```shell
# 有状态服务
registry.cn-hangzhou.aliyuncs.com/pigx/pig-mysql:latest

redis:7

# 无状态服务
registry.cn-hangzhou.aliyuncs.com/pigx/pig-register:latest

registry.cn-hangzhou.aliyuncs.com/pigx/pig-upms:latest

registry.cn-hangzhou.aliyuncs.com/pigx/pig-auth:latest

registry.cn-hangzhou.aliyuncs.com/pigx/pig-gateway:latest

registry.cn-hangzhou.aliyuncs.com/pigx/pig-codegen:latest

registry.cn-hangzhou.aliyuncs.com/pigx/pig-quartz:latest

registry.cn-hangzhou.aliyuncs.com/pigx/pig-ui:latest
```

[此处为语雀卡片，点击链接查看](https://www.yuque.com/docs/146680364#P1pc9)

