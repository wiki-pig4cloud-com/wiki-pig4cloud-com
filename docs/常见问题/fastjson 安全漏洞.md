

## **<font style="color:rgb(30, 30, 30);">一、漏洞概述</font>**
<font style="color:rgb(119, 119, 119);">5月23日，绿盟科技CERT监测到Fastjson官方发布公告称在1.2.80及以下版本中存在新的反序列化风险，在特定条件下可绕过默认autoType关闭限制，从而反序列化有安全风险的类，攻击者利用该漏洞可实现在目标机器上的远程代码执行。请相关用户尽快采取防护措施。</font>

<font style="color:rgb(119, 119, 119);">Fastjson是阿里巴巴的开源JSON解析库，它可以解析JSON格式的字符串，支持将Java Bean序列化为JSON字符串，也可以从JSON字符串反序列化到JavaBean。由于具有执行效率高的特点，应用范围广泛。</font>

## **<font style="color:rgb(30, 30, 30);">二、影响范围</font>**
**<font style="color:rgb(119, 119, 119);">受影响版本</font>**

+ <font style="color:rgb(119, 119, 119);">Fastjson ≤ 1.2.80</font>

**<font style="color:rgb(119, 119, 119);">不受影响版本</font>**

+ <font style="color:rgb(119, 119, 119);">Fastjson = 1.2.83</font>



## 三、修复方案
### <font style="color:rgb(51, 51, 51);">① 开源版本</font>![](https://minio.pigx.vip/oss/1653357139.png)
### ② 商业版本
![](https://minio.pigx.vip/oss/1653357207.png)



## 四、修复确认
![](https://minio.pigx.vip/oss/1653357261.png)

