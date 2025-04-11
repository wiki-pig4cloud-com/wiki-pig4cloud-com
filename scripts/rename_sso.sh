#!/bin/bash

# Rename jfinal integration files
if [ -f "docs/integration/单点案例-jfinal系统接入pig.mdx" ]; then
  mv "docs/integration/单点案例-jfinal系统接入pig.mdx" "docs/integration/sso-jfinal-pig.mdx"
  echo "Renamed: docs/integration/单点案例-jfinal系统接入pig.mdx -> docs/integration/sso-jfinal-pig.mdx"
fi

if [ -f "docs/integration/[单点案例]  jfinal系统接入pig.mdx" ]; then
  mv "docs/integration/[单点案例]  jfinal系统接入pig.mdx" "docs/integration/sso-jfinal-pig.mdx"
  echo "Renamed: docs/integration/[单点案例]  jfinal系统接入pig.mdx -> docs/integration/sso-jfinal-pig.mdx"
fi

# Rename guns integration files
if [ -f "docs/integration/单点案例-guns系统接入pig.mdx" ]; then
  mv "docs/integration/单点案例-guns系统接入pig.mdx" "docs/integration/sso-guns-pig.mdx"
  echo "Renamed: docs/integration/单点案例-guns系统接入pig.mdx -> docs/integration/sso-guns-pig.mdx"
fi

if [ -f "docs/integration/[单点案例] guns系统接入pig.mdx" ]; then
  mv "docs/integration/[单点案例] guns系统接入pig.mdx" "docs/integration/sso-guns-pig.mdx"
  echo "Renamed: docs/integration/[单点案例] guns系统接入pig.mdx -> docs/integration/sso-guns-pig.mdx"
fi

# Rename renren integration files
if [ -f "docs/integration/单点案例-renren系统接入pig.mdx" ]; then
  mv "docs/integration/单点案例-renren系统接入pig.mdx" "docs/integration/sso-renren-pig.mdx"
  echo "Renamed: docs/integration/单点案例-renren系统接入pig.mdx -> docs/integration/sso-renren-pig.mdx"
fi

if [ -f "docs/integration/[单点案例] renren系统接入pig.mdx" ]; then
  mv "docs/integration/[单点案例] renren系统接入pig.mdx" "docs/integration/sso-renren-pig.mdx"
  echo "Renamed: docs/integration/[单点案例] renren系统接入pig.mdx -> docs/integration/sso-renren-pig.mdx"
fi

# Rename jeecg integration files
if [ -f "docs/integration/单点案例-jeecg前后端分离系统接入pig.mdx" ]; then
  mv "docs/integration/单点案例-jeecg前后端分离系统接入pig.mdx" "docs/integration/sso-jeecg-pig.mdx"
  echo "Renamed: docs/integration/单点案例-jeecg前后端分离系统接入pig.mdx -> docs/integration/sso-jeecg-pig.mdx"
fi

if [ -f "docs/integration/[单点案例] jeecg前后端分离系统接入pig.mdx" ]; then
  mv "docs/integration/[单点案例] jeecg前后端分离系统接入pig.mdx" "docs/integration/sso-jeecg-pig.mdx"
  echo "Renamed: docs/integration/[单点案例] jeecg前后端分离系统接入pig.mdx -> docs/integration/sso-jeecg-pig.mdx"
fi

# Rename jeesite integration files
if [ -f "docs/integration/单点案例-jeesite前后端分离系统接入pig.mdx" ]; then
  mv "docs/integration/单点案例-jeesite前后端分离系统接入pig.mdx" "docs/integration/sso-jeesite-pig.mdx"
  echo "Renamed: docs/integration/单点案例-jeesite前后端分离系统接入pig.mdx -> docs/integration/sso-jeesite-pig.mdx"
fi

if [ -f "docs/integration/[单点案例] jeesite前后端分离系统接入pig.mdx" ]; then
  mv "docs/integration/[单点案例] jeesite前后端分离系统接入pig.mdx" "docs/integration/sso-jeesite-pig.mdx"
  echo "Renamed: docs/integration/[单点案例] jeesite前后端分离系统接入pig.mdx -> docs/integration/sso-jeesite-pig.mdx"
fi

echo "SSO file renaming completed!" 