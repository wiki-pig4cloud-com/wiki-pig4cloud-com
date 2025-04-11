## ⭐️  feign 接口调用使用
:::info
**以新创建的demo 模块为例，需要在 spi 配置如下类的全路径**

:::

+ feign 调用包含 feign-client、 spi 定义 两个部分

```java
// feign-client
@FeignClient(contextId = "remoteDemoService", value = "demo-biz")
public interface RemoteDemoService {
}
```

+ **<font style="color:#DF2A3F;">配置feignclient 路径： demo-api/src/main/resources/META-INF/spring/org.springframework.cloud.openfeign.FeignClient.imports</font>**

```java
com.pig4cloud.pig.demo.api.feign.RemoteDemoService
```

## ① 带Token 请求 (<font style="color:#DF2A3F;">不需要携带 FROM_IN header</font>)


1. 如下图客户端携带token访问A服务。
2. A服务通过FeginClient 调用B服务获取相关依赖数据。
3. 所以只要带token 访问A 无论后边链路有多长 ABCD 都可以获取当前用户信息
4. 权限需要有这些整个链路接口的全部权限才能成功



![](https://cdn.nlark.com/yuque/0/2020/png/283679/1599314191979-fea7b81a-4a6b-41f2-8a0c-139a2f9691c0.png)



## ② 无Token请求 (<font style="color:#DF2A3F;">需要携带 FROM_IN header</font>)


![](https://cdn.nlark.com/yuque/0/2020/png/283679/1599314191907-97e3a538-9710-406f-9924-ca88a6312589.png)



:::warning
**<font style="color:#F5222D;">很多情况下，比如定时任务。A服务并没有token 去请求B服务，pig也对这种情况进行了兼容。类似于A对外暴露API，但是又安全限制</font>**

:::



+ FeignClient 需要带一个请求token,FROM_IN 声明是内部调用



```java
remoteLogService.saveLog(sysLog, SecurityConstants.FROM_IN);
```



![](https://cdn.nlark.com/yuque/0/2022/png/283679/1660454269266-cb6f54bd-a707-4484-a1b1-d863f61193d6.png)

+ 目标接口对内外调用进行限制添加 [@Inner ](/Inner ) 注解，这样就避免接口对外暴露的安全问题。只能通过内部调用才能使用，浏览器不能直接访问该接口



```java
	@Inner
	@PostMapping
	public R save(@Valid @RequestBody SysLog sysLog) {
		return new R<>(sysLogService.save(sysLog));
	}
```



+ 若代码无法加 `@Inner` 也可以参考API 对外暴露章节对外暴露目标接口





## ③ 核心代码


fein 拦截器将本服务的token 通过copyToken的形式传递给下游服务



```java
public class PigFeignClientInterceptor extends OAuth2FeignRequestInterceptor {

	@Override
	public void apply(RequestTemplate template) {
		Collection<String> fromHeader = template.headers().get(SecurityConstants.FROM);
		if (CollUtil.isNotEmpty(fromHeader) && fromHeader.contains(SecurityConstants.FROM_IN)) {
			return;
		}

		accessTokenContextRelay.copyToken();
		if (oAuth2ClientContext != null
			&& oAuth2ClientContext.getAccessToken() != null) {
			super.apply(template);
		}
	}
}
```

## ❤  问题咨询
![](https://cdn.nlark.com/yuque/0/2022/gif/283679/1662563973685-c22e9831-db66-42b5-973f-886d25d1e0e7.gif)

