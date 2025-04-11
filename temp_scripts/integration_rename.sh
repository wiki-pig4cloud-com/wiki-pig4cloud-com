#!/bin/bash

# Integration Section
if [ -f "docs/integration/pig达梦数据库支持.mdx" ]; then
  mv "docs/integration/pig达梦数据库支持.mdx" "docs/integration/pig-dm-database.mdx"
  echo "Renamed: docs/integration/pig达梦数据库支持.mdx -> docs/integration/pig-dm-database.mdx"
fi

if [ -f "docs/integration/pig 达梦数据库支持.mdx" ]; then
  mv "docs/integration/pig 达梦数据库支持.mdx" "docs/integration/pig-dm-database.mdx"
  echo "Renamed: docs/integration/pig 达梦数据库支持.mdx -> docs/integration/pig-dm-database.mdx"
fi

if [ -f "docs/integration/pig整合shardingsphere5.4分库分表.mdx" ]; then
  mv "docs/integration/pig整合shardingsphere5.4分库分表.mdx" "docs/integration/pig-shardingsphere-integration.mdx"
  echo "Renamed: docs/integration/pig整合shardingsphere5.4分库分表.mdx -> docs/integration/pig-shardingsphere-integration.mdx"
fi

if [ -f "docs/integration/pig 整合 shardingsphere 5.4 分库分表.mdx" ]; then
  mv "docs/integration/pig 整合 shardingsphere 5.4 分库分表.mdx" "docs/integration/pig-shardingsphere-integration.mdx"
  echo "Renamed: docs/integration/pig 整合 shardingsphere 5.4 分库分表.mdx -> docs/integration/pig-shardingsphere-integration.mdx"
fi

echo "Integration files rename script created!"
