## ![](https://cdn.nlark.com/yuque/0/2023/png/283679/1689226025463-1790ba61-4503-4e4b-b397-5bba04fd77fb.png)
## 整体效果
![](https://cdn.nlark.com/yuque/0/2020/png/283679/1599315026359-ea4af661-f598-4202-a60f-41bd4bb6324a.png)



## 整体设计思路


> 1. 依赖于 `OAuth2`的授权码模式， pig 作为SSO 的认证中心
> 2. pig 用户 包含 ruoyi 用户表的全部
> 3. pig 负责 `shirorealm` 的认证过程，ruoyi 负责鉴权过程
>



## 基础环境


基于`pig 3.5` & `ruoyi 4.7` 实现 `sso` 效果



## pig 增加客户端


`sys_oauth_client_details` 表直接增加即可



```sql
INSERT INTO `sys_oauth_client_details`(`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('ruoyi', NULL, 'ruoyi', 'server', 'refresh_token,authorization_code', 'http://127.0.0.1:80/sso/login', NULL, 43200, 2592001, NULL, 'true');
```



## 客户端SDK


`ruoyi-framework/pom.xml 添加依赖`



```xml
<dependency>
    <groupId>com.pig4cloud.shiro</groupId>
    <artifactId>sso-sdk</artifactId>
    <version>0.1.0</version>
</dependency>
```



`ruoyi-admin/application.yml 配置认证信息`



```shell
oauth2:
  client:
    client-id: ruoyi
    client-secret: ruoyi
    redirect-uri: http://127.0.0.1:${server.port}/sso/login  #登录回调地址
    target-uri: http://127.0.0.1:${server.port}/  #登录后跳转到首页的地址
    logout-uri: http://127.0.0.1:${server.port}/  #退出后跳转的地址
    sso-server-uri: http://localhost:3000      #pig认证中心的地址
    scope: server
```



## ruoyi 代码调整


`com.ruoyi.framework.shiro.realm 目录新增OAuth2Realm逻辑`



```java
@Component
public class OAuth2Realm extends UserRealm {
    @Autowired
    private ISysUserService userService;
    @Autowired
    private OAuth2SsoKit auth2SsoKit;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        OAuth2SsoAuthenticationToken oAuth2SsoAuthenticationToken = (OAuth2SsoAuthenticationToken) token;
        String username = auth2SsoKit.getUser(oAuth2SsoAuthenticationToken.getCode());
        SysUser sysUser = userService.selectUserByLoginName(username);
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(sysUser, sysUser.getPassword(), ByteSource.Util.bytes(sysUser.getSalt()), getName());
        oAuth2SsoAuthenticationToken.setUsername(sysUser.getUserName());
        oAuth2SsoAuthenticationToken.setPassword(sysUser.getPassword().toCharArray());
        return info;
    }

    @Override
    public CredentialsMatcher getCredentialsMatcher() {
        return (token, info) -> true;
    }

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof OAuth2SsoAuthenticationToken;
    }
}
```



`ShiroConfig` 配置



```java
/**
 * 安全管理器 配置OAuth2Realm
 */
@Bean
public SecurityManager securityManager(OAuth2Realm oAuth2Realm, UserRealm userRealm)
{
    securityManager.setRealms(Arrays.asList(oAuth2Realm, userRealm));
    ...
    return securityManager;
}
```



```java
 /**
  * Shiro过滤器配置
  */
@Bean
public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager)
{
    ....
        filterChainDefinitionMap.put("/sso/login", "anon"); # 开放sso/login endpoint

}
```



## SSO 登录地址


```shell
# 如视频中增加 登录按钮
http://127.0.0.1:80/sso/login
```





## 退出流程


+ 跳转 LogoutFilter.java 

![](https://cdn.nlark.com/yuque/0/2020/png/283679/1601965363647-457dca27-c865-426a-b4ae-793101b1c763.png)



## ❤  问题咨询
![](https://cdn.nlark.com/yuque/0/2022/gif/283679/1662563973685-c22e9831-db66-42b5-973f-886d25d1e0e7.gif)

