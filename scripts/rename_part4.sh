#!/bin/bash

# Auth & Authorization
if [ -f "docs/backend/auth-authorization/token, jwt, oauth2, session.mdx" ]; then
  mv "docs/backend/auth-authorization/token, jwt, oauth2, session.mdx" "docs/backend/auth-authorization/token-jwt-oauth2-session.mdx"
  echo "Renamed: docs/backend/auth-authorization/token, jwt, oauth2, session.mdx -> docs/backend/auth-authorization/token-jwt-oauth2-session.mdx"
fi

if [ -f "docs/backend/auth-authorization/pig 生成 token 认证详解.mdx" ]; then
  mv "docs/backend/auth-authorization/pig 生成 token 认证详解.mdx" "docs/backend/auth-authorization/pig-token-authentication.mdx"
  echo "Renamed: docs/backend/auth-authorization/pig生成token认证详解.mdx -> docs/backend/auth-authorization/pig-token-authentication.mdx"
fi

if [ -f "docs/backend/auth-authorization/pig 生成 token (认证) 详解 ⭐️.mdx" ]; then
  mv "docs/backend/auth-authorization/pig 生成 token (认证) 详解 ⭐️.mdx" "docs/backend/auth-authorization/pig-token-authentication.mdx"
  echo "Renamed: docs/backend/auth-authorization/pig 生成 token (认证) 详解 ⭐️.mdx -> docs/backend/auth-authorization/pig-token-authentication.mdx"
fi

if [ -f "docs/backend/auth-authorization/pig-token 有效期及个性化.mdx" ]; then
  mv "docs/backend/auth-authorization/pig-token 有效期及个性化.mdx" "docs/backend/auth-authorization/pig-token-expiration.mdx"
  echo "Renamed: docs/backend/auth-authorization/pig-token有效期及个性化.mdx -> docs/backend/auth-authorization/pig-token-expiration.mdx"
fi

if [ -f "docs/backend/auth-authorization/pig 授权码模式使用 - 开放平台.mdx" ]; then
  mv "docs/backend/auth-authorization/pig 授权码模式使用 - 开放平台.mdx" "docs/backend/auth-authorization/pig-authorization-code.mdx"
  echo "Renamed: docs/backend/auth-authorization/pig授权码模式使用-开放平台.mdx -> docs/backend/auth-authorization/pig-authorization-code.mdx"
fi

if [ -f "docs/backend/auth-authorization/pig 授权码模式使用（开放平台）.mdx" ]; then
  mv "docs/backend/auth-authorization/pig 授权码模式使用（开放平台）.mdx" "docs/backend/auth-authorization/pig-authorization-code.mdx"
  echo "Renamed: docs/backend/auth-authorization/pig 授权码模式使用（开放平台）.mdx -> docs/backend/auth-authorization/pig-authorization-code.mdx"
fi

if [ -f "docs/backend/auth-authorization/pig 客户端模式使用.mdx" ]; then
  mv "docs/backend/auth-authorization/pig 客户端模式使用.mdx" "docs/backend/auth-authorization/pig-client-mode.mdx"
  echo "Renamed: docs/backend/auth-authorization/pig客户端模式使用.mdx -> docs/backend/auth-authorization/pig-client-mode.mdx"
fi

if [ -f "docs/backend/auth-authorization/pig 客户端模式使用.mdx" ]; then
  mv "docs/backend/auth-authorization/pig 客户端模式使用.mdx" "docs/backend/auth-authorization/pig-client-mode.mdx"
  echo "Renamed: docs/backend/auth-authorization/pig 客户端模式使用.mdx -> docs/backend/auth-authorization/pig-client-mode.mdx"
fi

if [ -f "docs/backend/auth-authorization/Inner 注解使用说明.mdx" ]; then
  mv "docs/backend/auth-authorization/Inner 注解使用说明.mdx" "docs/backend/auth-authorization/inner-annotation.mdx"
  echo "Renamed: docs/backend/auth-authorization/Inner注解使用说明.mdx -> docs/backend/auth-authorization/inner-annotation.mdx"
fi

if [ -f "docs/backend/auth-authorization/feign 调用及服务间鉴权.mdx" ]; then
  mv "docs/backend/auth-authorization/feign 调用及服务间鉴权.mdx" "docs/backend/auth-authorization/feign-service-auth.mdx"
  echo "Renamed: docs/backend/auth-authorization/feign调用及服务间鉴权.mdx -> docs/backend/auth-authorization/feign-service-auth.mdx"
fi

if [ -f "docs/backend/auth-authorization/接口对外直接暴露.mdx" ]; then
  mv "docs/backend/auth-authorization/接口对外直接暴露.mdx" "docs/backend/auth-authorization/api-exposure.mdx"
  echo "Renamed: docs/backend/auth-authorization/接口对外直接暴露.mdx -> docs/backend/auth-authorization/api-exposure.mdx"
fi

if [ -f "docs/backend/auth-authorization/接口对外直接暴露 👍.mdx" ]; then
  mv "docs/backend/auth-authorization/接口对外直接暴露 👍.mdx" "docs/backend/auth-authorization/api-exposure.mdx"
  echo "Renamed: docs/backend/auth-authorization/接口对外直接暴露 👍.mdx -> docs/backend/auth-authorization/api-exposure.mdx"
fi

if [ -f "docs/backend/auth-authorization/服务中获取当前用户.mdx" ]; then
  mv "docs/backend/auth-authorization/服务中获取当前用户.mdx" "docs/backend/auth-authorization/get-current-user.mdx"
  echo "Renamed: docs/backend/auth-authorization/服务中获取当前用户.mdx -> docs/backend/auth-authorization/get-current-user.mdx"
fi

if [ -f "docs/backend/auth-authorization/前端登录请求加密.mdx" ]; then
  mv "docs/backend/auth-authorization/前端登录请求加密.mdx" "docs/backend/auth-authorization/frontend-login-encryption.mdx"
  echo "Renamed: docs/backend/auth-authorization/前端登录请求加密.mdx -> docs/backend/auth-authorization/frontend-login-encryption.mdx"
fi

if [ -f "docs/backend/auth-authorization/短信登录配置短信渠道.mdx" ]; then
  mv "docs/backend/auth-authorization/短信登录配置短信渠道.mdx" "docs/backend/auth-authorization/sms-login-config.mdx"
  echo "Renamed: docs/backend/auth-authorization/短信登录配置短信渠道.mdx -> docs/backend/auth-authorization/sms-login-config.mdx"
fi

if [ -f "docs/backend/auth-authorization/扩展 - 登录用户支持多表存储.mdx" ]; then
  mv "docs/backend/auth-authorization/扩展 - 登录用户支持多表存储.mdx" "docs/backend/auth-authorization/extension-user-multi-table.mdx"
  echo "Renamed: docs/backend/auth-authorization/扩展-登录用户支持多表存储.mdx -> docs/backend/auth-authorization/extension-user-multi-table.mdx"
fi

if [ -f "docs/backend/auth-authorization/【扩展】登录用户支持多表存储.mdx" ]; then
  mv "docs/backend/auth-authorization/【扩展】登录用户支持多表存储.mdx" "docs/backend/auth-authorization/extension-user-multi-table.mdx"
  echo "Renamed: docs/backend/auth-authorization/【扩展】登录用户支持多表存储.mdx -> docs/backend/auth-authorization/extension-user-multi-table.mdx"
fi

if [ -f "docs/backend/auth-authorization/扩展 - 暴力生成 token.mdx" ]; then
  mv "docs/backend/auth-authorization/扩展 - 暴力生成 token.mdx" "docs/backend/auth-authorization/extension-force-token.mdx"
  echo "Renamed: docs/backend/auth-authorization/扩展-暴力生成token.mdx -> docs/backend/auth-authorization/extension-force-token.mdx"
fi

if [ -f "docs/backend/auth-authorization/【扩展】暴力生成 token.mdx" ]; then
  mv "docs/backend/auth-authorization/【扩展】暴力生成 token.mdx" "docs/backend/auth-authorization/extension-force-token.mdx"
  echo "Renamed: docs/backend/auth-authorization/【扩展】暴力生成 token.mdx -> docs/backend/auth-authorization/extension-force-token.mdx"
fi

echo "Part 4 file renaming completed!" 