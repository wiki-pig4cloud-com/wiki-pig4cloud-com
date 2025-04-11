#!/bin/bash

# FAQ - Service Startup Issues
if [ -f "docs/faq/service-startup/gateway启动报DocConfiguration空指针.mdx" ]; then
  mv "docs/faq/service-startup/gateway启动报DocConfiguration空指针.mdx" "docs/faq/service-startup/gateway-doc-config-null.mdx"
  echo "Renamed: docs/faq/service-startup/gateway启动报DocConfiguration空指针.mdx -> docs/faq/service-startup/gateway-doc-config-null.mdx"
fi

if [ -f "docs/faq/service-startup/服务启动失败Failed-to-configure-a-DataSource-url.mdx" ]; then
  mv "docs/faq/service-startup/服务启动失败Failed-to-configure-a-DataSource-url.mdx" "docs/faq/service-startup/failed-to-configure-datasource.mdx"
  echo "Renamed: docs/faq/service-startup/服务启动失败Failed-to-configure-a-DataSource-url.mdx -> docs/faq/service-startup/failed-to-configure-datasource.mdx"
fi

if [ -f "docs/faq/service-startup/pig-register启动报错失败.mdx" ]; then
  mv "docs/faq/service-startup/pig-register启动报错失败.mdx" "docs/faq/service-startup/pig-register-startup-fail.mdx"
  echo "Renamed: docs/faq/service-startup/pig-register启动报错失败.mdx -> docs/faq/service-startup/pig-register-startup-fail.mdx"
fi

if [ -f "docs/faq/service-startup/nacos服务列表为空.mdx" ]; then
  mv "docs/faq/service-startup/nacos服务列表为空.mdx" "docs/faq/service-startup/nacos-service-list-empty.mdx"
  echo "Renamed: docs/faq/service-startup/nacos服务列表为空.mdx -> docs/faq/service-startup/nacos-service-list-empty.mdx"
fi

if [ -f "docs/faq/service-startup/pig链接不上数据库.mdx" ]; then
  mv "docs/faq/service-startup/pig链接不上数据库.mdx" "docs/faq/service-startup/pig-db-connection-fail.mdx"
  echo "Renamed: docs/faq/service-startup/pig链接不上数据库.mdx -> docs/faq/service-startup/pig-db-connection-fail.mdx"
fi

if [ -f "docs/faq/service-startup/java-jar运行yml报错input-length-1.mdx" ]; then
  mv "docs/faq/service-startup/java-jar运行yml报错input-length-1.mdx" "docs/faq/service-startup/java-jar-yml-input-length-error.mdx"
  echo "Renamed: docs/faq/service-startup/java-jar运行yml报错input-length-1.mdx -> docs/faq/service-startup/java-jar-yml-input-length-error.mdx"
fi

if [ -f "docs/faq/service-startup/创建新模块提示资源不存在.mdx" ]; then
  mv "docs/faq/service-startup/创建新模块提示资源不存在.mdx" "docs/faq/service-startup/new-module-resource-not-found.mdx"
  echo "Renamed: docs/faq/service-startup/创建新模块提示资源不存在.mdx -> docs/faq/service-startup/new-module-resource-not-found.mdx"
fi

if [ -f "docs/faq/service-startup/fastjson安全漏洞.mdx" ]; then
  mv "docs/faq/service-startup/fastjson安全漏洞.mdx" "docs/faq/service-startup/fastjson-vulnerability.mdx"
  echo "Renamed: docs/faq/service-startup/fastjson安全漏洞.mdx -> docs/faq/service-startup/fastjson-vulnerability.mdx"
fi

if [ -f "docs/faq/service-startup/如何修改pig-register启动端口.mdx" ]; then
  mv "docs/faq/service-startup/如何修改pig-register启动端口.mdx" "docs/faq/service-startup/modify-pig-register-port.mdx"
  echo "Renamed: docs/faq/service-startup/如何修改pig-register启动端口.mdx -> docs/faq/service-startup/modify-pig-register-port.mdx"
fi

if [ -f "docs/faq/service-startup/升级后无法启动提示sentinel-bean重复.mdx" ]; then
  mv "docs/faq/service-startup/升级后无法启动提示sentinel-bean重复.mdx" "docs/faq/service-startup/sentinel-bean-duplicate.mdx"
  echo "Renamed: docs/faq/service-startup/升级后无法启动提示sentinel-bean重复.mdx -> docs/faq/service-startup/sentinel-bean-duplicate.mdx"
fi

if [ -f "docs/faq/service-startup/网关机器被挖矿服务不可用.mdx" ]; then
  mv "docs/faq/service-startup/网关机器被挖矿服务不可用.mdx" "docs/faq/service-startup/gateway-crypto-mining.mdx"
  echo "Renamed: docs/faq/service-startup/网关机器被挖矿服务不可用.mdx -> docs/faq/service-startup/gateway-crypto-mining.mdx"
fi

if [ -f "docs/faq/service-startup/pig-auth报错Cannot-deserialize.mdx" ]; then
  mv "docs/faq/service-startup/pig-auth报错Cannot-deserialize.mdx" "docs/faq/service-startup/pig-auth-deserialize-error.mdx"
  echo "Renamed: docs/faq/service-startup/pig-auth报错Cannot-deserialize.mdx -> docs/faq/service-startup/pig-auth-deserialize-error.mdx"
fi

if [ -f "docs/faq/service-startup/main方法启动失败-提示yml语法错误.mdx" ]; then
  mv "docs/faq/service-startup/main方法启动失败-提示yml语法错误.mdx" "docs/faq/service-startup/main-yml-syntax-error.mdx"
  echo "Renamed: docs/faq/service-startup/main方法启动失败-提示yml语法错误.mdx -> docs/faq/service-startup/main-yml-syntax-error.mdx"
fi

# FAQ - Deployment Issues
if [ -f "docs/faq/deployment-issues/如何获取免费公网Docker镜像仓库.mdx" ]; then
  mv "docs/faq/deployment-issues/如何获取免费公网Docker镜像仓库.mdx" "docs/faq/deployment-issues/free-docker-registry.mdx"
  echo "Renamed: docs/faq/deployment-issues/如何获取免费公网Docker镜像仓库.mdx -> docs/faq/deployment-issues/free-docker-registry.mdx"
fi

# FAQ - Frontend Issues
if [ -f "docs/faq/frontend-issues/如何修改pig-ui启动端口.mdx" ]; then
  mv "docs/faq/frontend-issues/如何修改pig-ui启动端口.mdx" "docs/faq/frontend-issues/modify-pig-ui-port.mdx"
  echo "Renamed: docs/faq/frontend-issues/如何修改pig-ui启动端口.mdx -> docs/faq/frontend-issues/modify-pig-ui-port.mdx"
fi

if [ -f "docs/faq/frontend-issues/前端项目启动失败.mdx" ]; then
  mv "docs/faq/frontend-issues/前端项目启动失败.mdx" "docs/faq/frontend-issues/frontend-startup-fail.mdx"
  echo "Renamed: docs/faq/frontend-issues/前端项目启动失败.mdx -> docs/faq/frontend-issues/frontend-startup-fail.mdx"
fi

# FAQ - Code References
if [ -f "docs/faq/code-references/nacos-naming-nacos-config的源码在哪里.mdx" ]; then
  mv "docs/faq/code-references/nacos-naming-nacos-config的源码在哪里.mdx" "docs/faq/code-references/nacos-naming-config-source.mdx"
  echo "Renamed: docs/faq/code-references/nacos-naming-nacos-config的源码在哪里.mdx -> docs/faq/code-references/nacos-naming-config-source.mdx"
fi

if [ -f "docs/faq/code-references/根pom-pig-cloud-dependencies-parent源码.mdx" ]; then
  mv "docs/faq/code-references/根pom-pig-cloud-dependencies-parent源码.mdx" "docs/faq/code-references/root-pom-dependencies.mdx"
  echo "Renamed: docs/faq/code-references/根pom-pig-cloud-dependencies-parent源码.mdx -> docs/faq/code-references/root-pom-dependencies.mdx"
fi

echo "Part 3 file renaming completed!" 