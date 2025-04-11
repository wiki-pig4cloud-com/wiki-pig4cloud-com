## 引入依赖


```xml
<dependency>
  <groupId>com.pig4cloud</groupId>
  <artifactId>pig-common-test</artifactId>
  <version>${last.version}</version>
  <scope>test</scope>
</dependency>
```



## 单元测试 Controller 接口


+ 指定单元测试 token来源

```yaml
# 配置在 test/resources/application.yml
security:
  oauth2:
    client:
      access-token-uri: http://pig-gateway:3000/oauth/token
```



+ 模拟测试controller 接口 

```java
import com.pig4cloud.pig.test.annotation.WithMockOAuth2User;
import lombok.SneakyThrows;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static com.pig4cloud.pig.test.kit.OAuthMockKit.token;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SysLogControllerTest {

	private MockMvc mvc;

	@Autowired
	private WebApplicationContext applicationContext; // 注入WebApplicationContext
	
	@Before
	public void setUp() {
		this.mvc = MockMvcBuilders.webAppContextSetup(applicationContext).build();
	}

	@Test
	@SneakyThrows
	@WithMockOAuth2User
	public void testMvcToken() {
		mvc.perform(delete("/log/1").with(token())).andExpect(status().isOk());
	}
}
```



+ 模拟测试 FeignClient 传递 token



直接注入 FeignClient 实现即可 使用  **<font style="color:#F5222D;">@WithMockOAuth2User  注解测试类即可</font>**

**<font style="color:#000000;"></font>**

## **<font style="color:#000000;">WithMockOAuth2User 属性说明</font>**




+ 当前用例获取 token 使用的用户名

```java
String username() default "admin";
```

+ 当前用例获取 token 使用的密码

```java
String password() default "123456";
```

