#!/bin/bash

# Backend Microservice Basics
if [ -f "docs/backend/microservice-basics/nacos 配置中心作用.mdx" ]; then
  mv "docs/backend/microservice-basics/nacos 配置中心作用.mdx" "docs/backend/microservice-basics/nacos-config-center.mdx"
  echo "Renamed: docs/backend/microservice-basics/nacos配置中心作用.mdx -> docs/backend/microservice-basics/nacos-config-center.mdx"
fi

if [ -f "docs/backend/microservice-basics/nacos-server 源码运行实现.mdx" ]; then
  mv "docs/backend/microservice-basics/nacos-server 源码运行实现.mdx" "docs/backend/microservice-basics/nacos-server-implementation.mdx"
  echo "Renamed: docs/backend/microservice-basics/nacos-server源码运行实现.mdx -> docs/backend/microservice-basics/nacos-server-implementation.mdx"
fi

if [ -f "docs/backend/microservice-basics/gateway 业务网关作用.mdx" ]; then
  mv "docs/backend/microservice-basics/gateway 业务网关作用.mdx" "docs/backend/microservice-basics/gateway-usage.mdx"
  echo "Renamed: docs/backend/microservice-basics/gateway业务网关作用.mdx -> docs/backend/microservice-basics/gateway-usage.mdx"
fi

if [ -f "docs/backend/microservice-basics/loadBalancer 负载均衡器作用.mdx" ]; then
  mv "docs/backend/microservice-basics/loadBalancer 负载均衡器作用.mdx" "docs/backend/microservice-basics/loadbalancer-usage.mdx"
  echo "Renamed: docs/backend/microservice-basics/loadBalancer负载均衡器作用.mdx -> docs/backend/microservice-basics/loadbalancer-usage.mdx"
fi

if [ -f "docs/backend/microservice-basics/sentinel 流量保护作用.mdx" ]; then
  mv "docs/backend/microservice-basics/sentinel 流量保护作用.mdx" "docs/backend/microservice-basics/sentinel-protection.mdx"
  echo "Renamed: docs/backend/microservice-basics/sentinel流量保护作用.mdx -> docs/backend/microservice-basics/sentinel-protection.mdx"
fi

# Backend Gateway Features
if [ -f "docs/backend/gateway-features/网关路由配置.mdx" ]; then
  mv "docs/backend/gateway-features/网关路由配置.mdx" "docs/backend/gateway-features/gateway-routing.mdx"
  echo "Renamed: docs/backend/gateway-features/网关路由配置.mdx -> docs/backend/gateway-features/gateway-routing.mdx"
fi

if [ -f "docs/backend/gateway-features/网关配置跨域.mdx" ]; then
  mv "docs/backend/gateway-features/网关配置跨域.mdx" "docs/backend/gateway-features/gateway-cors.mdx"
  echo "Renamed: docs/backend/gateway-features/网关配置跨域.mdx -> docs/backend/gateway-features/gateway-cors.mdx"
fi

if [ -f "docs/backend/gateway-features/网关限流使用.mdx" ]; then
  mv "docs/backend/gateway-features/网关限流使用.mdx" "docs/backend/gateway-features/gateway-rate-limiting.mdx"
  echo "Renamed: docs/backend/gateway-features/网关限流使用.mdx -> docs/backend/gateway-features/gateway-rate-limiting.mdx"
fi

if [ -f "docs/backend/gateway-features/网关超时及异常处理.mdx" ]; then
  mv "docs/backend/gateway-features/网关超时及异常处理.mdx" "docs/backend/gateway-features/gateway-timeout-handling.mdx"
  echo "Renamed: docs/backend/gateway-features/网关超时及异常处理.mdx -> docs/backend/gateway-features/gateway-timeout-handling.mdx"
fi

# Production
if [ -f "docs/production/https 部署前端项目.mdx" ]; then
  mv "docs/production/https 部署前端项目.mdx" "docs/production/https-frontend-deployment.mdx"
  echo "Renamed: docs/production/https部署前端项目.mdx -> docs/production/https-frontend-deployment.mdx"
fi

if [ -f "docs/production/centos 部署整套应用.mdx" ]; then
  mv "docs/production/centos 部署整套应用.mdx" "docs/production/centos-deployment.mdx"
  echo "Renamed: docs/production/centos部署整套应用.mdx -> docs/production/centos-deployment.mdx"
fi

if [ -f "docs/production/Rainbond 部署整套应用.mdx" ]; then
  mv "docs/production/Rainbond 部署整套应用.mdx" "docs/production/rainbond-deployment.mdx"
  echo "Renamed: docs/production/Rainbond部署整套应用.mdx -> docs/production/rainbond-deployment.mdx"
fi

# FAQ - Asking Guidelines
if [ -f "docs/faq/asking-guidelines/提问须知.mdx" ]; then
  mv "docs/faq/asking-guidelines/提问须知.mdx" "docs/faq/asking-guidelines/question-guidelines.mdx"
  echo "Renamed: docs/faq/asking-guidelines/提问须知.mdx -> docs/faq/asking-guidelines/question-guidelines.mdx"
fi

# FAQ - Client Settings
if [ -f "docs/faq/client-settings/如何修改客户端 pig 信息.mdx" ]; then
  mv "docs/faq/client-settings/如何修改客户端 pig 信息.mdx" "docs/faq/client-settings/modify-client-info.mdx"
  echo "Renamed: docs/faq/client-settings/如何修改客户端pig信息.mdx -> docs/faq/client-settings/modify-client-info.mdx"
fi

# FAQ - Login Issues
if [ -f "docs/faq/login-issues/登录提示 clientId 不合法.mdx" ]; then
  mv "docs/faq/login-issues/登录提示 clientId 不合法.mdx" "docs/faq/login-issues/invalid-clientid.mdx"
  echo "Renamed: docs/faq/login-issues/登录提示clientId不合法.mdx -> docs/faq/login-issues/invalid-clientid.mdx"
fi

if [ -f "docs/faq/login-issues/登录提示密码错误.mdx" ]; then
  mv "docs/faq/login-issues/登录提示密码错误.mdx" "docs/faq/login-issues/wrong-password.mdx"
  echo "Renamed: docs/faq/login-issues/登录提示密码错误.mdx -> docs/faq/login-issues/wrong-password.mdx"
fi

if [ -f "docs/faq/login-issues/登录页面不显示验证码.mdx" ]; then
  mv "docs/faq/login-issues/登录页面不显示验证码.mdx" "docs/faq/login-issues/captcha-not-showing.mdx"
  echo "Renamed: docs/faq/login-issues/登录页面不显示验证码.mdx -> docs/faq/login-issues/captcha-not-showing.mdx"
fi

echo "Part 2 file renaming completed!" 