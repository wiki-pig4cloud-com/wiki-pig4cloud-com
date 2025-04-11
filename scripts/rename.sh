#!/bin/bash

# Deployment section
if [ -f "docs/deployment/说明 - 版本分支.mdx" ]; then
  mv "docs/deployment/说明 - 版本分支.mdx" "docs/deployment/version-branch.mdx"
  echo "Renamed: docs/deployment/说明-版本分支.mdx -> docs/deployment/version-branch.mdx"
fi

if [ -f "docs/deployment/开发 - 快速开始.mdx" ]; then
  mv "docs/deployment/开发 - 快速开始.mdx" "docs/deployment/quick-start.mdx"
  echo "Renamed: docs/deployment/开发-快速开始.mdx -> docs/deployment/quick-start.mdx"
fi

if [ -f "docs/deployment/进阶 - 单体使用.mdx" ]; then
  mv "docs/deployment/进阶 - 单体使用.mdx" "docs/deployment/monolith-usage.mdx"
  echo "Renamed: docs/deployment/进阶-单体使用.mdx -> docs/deployment/monolith-usage.mdx"
fi

if [ -f "docs/deployment/Linux-部署应用.mdx" ]; then
  mv "docs/deployment/Linux-部署应用.mdx" "docs/deployment/linux-deploy.mdx"
  echo "Renamed: docs/deployment/Linux-部署应用.mdx -> docs/deployment/linux-deploy.mdx"
fi

if [ -f "docs/deployment/K8S-部署应用.mdx" ]; then
  mv "docs/deployment/K8S-部署应用.mdx" "docs/deployment/k8s-deploy.mdx"
  echo "Renamed: docs/deployment/K8S-部署应用.mdx -> docs/deployment/k8s-deploy.mdx"
fi

# Secondary Dev section
if [ -f "docs/secondary-dev/创建微服务项目骨架.mdx" ]; then
  mv "docs/secondary-dev/创建微服务项目骨架.mdx" "docs/secondary-dev/create-microservice-skeleton.mdx"
  echo "Renamed: docs/secondary-dev/创建微服务项目骨架.mdx -> docs/secondary-dev/create-microservice-skeleton.mdx"
fi

if [ -f "docs/secondary-dev/微调微服务配置管理.mdx" ]; then
  mv "docs/secondary-dev/微调微服务配置管理.mdx" "docs/secondary-dev/microservice-config-management.mdx"
  echo "Renamed: docs/secondary-dev/微调微服务配置管理.mdx -> docs/secondary-dev/microservice-config-management.mdx"
fi

if [ -f "docs/secondary-dev/进阶 - 单体版二次开发.mdx" ]; then
  mv "docs/secondary-dev/进阶 - 单体版二次开发.mdx" "docs/secondary-dev/monolith-secondary-dev.mdx"
  echo "Renamed: docs/secondary-dev/进阶-单体版二次开发.mdx -> docs/secondary-dev/monolith-secondary-dev.mdx"
fi

# Backend Programming Basics
if [ -f "docs/backend/programming-basics/lombok 使用及技巧.mdx" ]; then
  mv "docs/backend/programming-basics/lombok 使用及技巧.mdx" "docs/backend/programming-basics/lombok-usage.mdx"
  echo "Renamed: docs/backend/programming-basics/lombok使用及技巧.mdx -> docs/backend/programming-basics/lombok-usage.mdx"
fi

if [ -f "docs/backend/programming-basics/java 工具类使用.mdx" ]; then
  mv "docs/backend/programming-basics/java 工具类使用.mdx" "docs/backend/programming-basics/java-util-usage.mdx"
  echo "Renamed: docs/backend/programming-basics/java工具类使用.mdx -> docs/backend/programming-basics/java-util-usage.mdx"
fi

if [ -f "docs/backend/programming-basics/java8 资料汇总.mdx" ]; then
  mv "docs/backend/programming-basics/java8 资料汇总.mdx" "docs/backend/programming-basics/java8-resources.mdx"
  echo "Renamed: docs/backend/programming-basics/java8资料汇总.mdx -> docs/backend/programming-basics/java8-resources.mdx"
fi

if [ -f "docs/backend/programming-basics/pig-stream 使用及其技巧.mdx" ]; then
  mv "docs/backend/programming-basics/pig-stream 使用及其技巧.mdx" "docs/backend/programming-basics/pig-stream-usage.mdx"
  echo "Renamed: docs/backend/programming-basics/pig-stream使用及其技巧.mdx -> docs/backend/programming-basics/pig-stream-usage.mdx"
fi

if [ -f "docs/backend/programming-basics/pig-lambda 使用及其技巧.mdx" ]; then
  mv "docs/backend/programming-basics/pig-lambda 使用及其技巧.mdx" "docs/backend/programming-basics/pig-lambda-usage.mdx"
  echo "Renamed: docs/backend/programming-basics/pig-lambda使用及其技巧.mdx -> docs/backend/programming-basics/pig-lambda-usage.mdx"
fi

# Frontend section
if [ -f "docs/frontend/浏览器兼容性.mdx" ]; then
  mv "docs/frontend/浏览器兼容性.mdx" "docs/frontend/browser-compatibility.mdx"
  echo "Renamed: docs/frontend/浏览器兼容性.mdx -> docs/frontend/browser-compatibility.mdx"
fi

if [ -f "docs/frontend/前端字体图标配置.mdx" ]; then
  mv "docs/frontend/前端字体图标配置.mdx" "docs/frontend/font-icon-config.mdx"
  echo "Renamed: docs/frontend/前端字体图标配置.mdx -> docs/frontend/font-icon-config.mdx"
fi

if [ -f "docs/frontend/前端配置项说明.mdx" ]; then
  mv "docs/frontend/前端配置项说明.mdx" "docs/frontend/config-explanation.mdx"
  echo "Renamed: docs/frontend/前端配置项说明.mdx -> docs/frontend/config-explanation.mdx"
fi

if [ -f "docs/frontend/前端通用工具函数.mdx" ]; then
  mv "docs/frontend/前端通用工具函数.mdx" "docs/frontend/util-functions.mdx"
  echo "Renamed: docs/frontend/前端通用工具函数.mdx -> docs/frontend/util-functions.mdx"
fi

if [ -f "docs/frontend/前端表格组件.mdx" ]; then
  mv "docs/frontend/前端表格组件.mdx" "docs/frontend/table-component.mdx"
  echo "Renamed: docs/frontend/前端表格组件.mdx -> docs/frontend/table-component.mdx"
fi

if [ -f "docs/frontend/前端国际化配置.mdx" ]; then
  mv "docs/frontend/前端国际化配置.mdx" "docs/frontend/i18n-config.mdx"
  echo "Renamed: docs/frontend/前端国际化配置.mdx -> docs/frontend/i18n-config.mdx"
fi

if [ -f "docs/frontend/前端权限管理.mdx" ]; then
  mv "docs/frontend/前端权限管理.mdx" "docs/frontend/permission-management.mdx"
  echo "Renamed: docs/frontend/前端权限管理.mdx -> docs/frontend/permission-management.mdx"
fi

if [ -f "docs/frontend/前端数据状态管理.mdx" ]; then
  mv "docs/frontend/前端数据状态管理.mdx" "docs/frontend/data-state-management.mdx"
  echo "Renamed: docs/frontend/前端数据状态管理.mdx -> docs/frontend/data-state-management.mdx"
fi

if [ -f "docs/frontend/前端富文本组件.mdx" ]; then
  mv "docs/frontend/前端富文本组件.mdx" "docs/frontend/rich-text-component.mdx"
  echo "Renamed: docs/frontend/前端富文本组件.mdx -> docs/frontend/rich-text-component.mdx"
fi

if [ -f "docs/frontend/前端悬浮输入组件.mdx" ]; then
  mv "docs/frontend/前端悬浮输入组件.mdx" "docs/frontend/floating-input.mdx"
  echo "Renamed: docs/frontend/前端悬浮输入组件.mdx -> docs/frontend/floating-input.mdx"
fi

if [ -f "docs/frontend/前端左侧查询树.mdx" ]; then
  mv "docs/frontend/前端左侧查询树.mdx" "docs/frontend/left-query-tree.mdx"
  echo "Renamed: docs/frontend/前端左侧查询树.mdx -> docs/frontend/left-query-tree.mdx"
fi

if [ -f "docs/frontend/前端文字提示组件.mdx" ]; then
  mv "docs/frontend/前端文字提示组件.mdx" "docs/frontend/text-tooltip.mdx"
  echo "Renamed: docs/frontend/前端文字提示组件.mdx -> docs/frontend/text-tooltip.mdx"
fi

if [ -f "docs/frontend/前端表格工具栏组件.mdx" ]; then
  mv "docs/frontend/前端表格工具栏组件.mdx" "docs/frontend/table-toolbar.mdx"
  echo "Renamed: docs/frontend/前端表格工具栏组件.mdx -> docs/frontend/table-toolbar.mdx"
fi

if [ -f "docs/frontend/前端字典功能.mdx" ]; then
  mv "docs/frontend/前端字典功能.mdx" "docs/frontend/dictionary-feature.mdx"
  echo "Renamed: docs/frontend/前端字典功能.mdx -> docs/frontend/dictionary-feature.mdx"
fi

if [ -f "docs/frontend/前端路由管理.mdx" ]; then
  mv "docs/frontend/前端路由管理.mdx" "docs/frontend/route-management.mdx"
  echo "Renamed: docs/frontend/前端路由管理.mdx -> docs/frontend/route-management.mdx"
fi

if [ -f "docs/frontend/前端标签页管理.mdx" ]; then
  mv "docs/frontend/前端标签页管理.mdx" "docs/frontend/tab-management.mdx"
  echo "Renamed: docs/frontend/前端标签页管理.mdx -> docs/frontend/tab-management.mdx"
fi

echo "File renaming completed!"
