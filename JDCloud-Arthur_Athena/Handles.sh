#!/bin/bash

WRT_DATE="$(TZ='Asia/Shanghai' date +'%y.%m.%d-%H.%M')"
#添加编译日期标识
find ./feeds/luci/modules/luci-mod-status/ -type f -name "10_system.js" -exec sed -i "s/(\(luciversion || ''\))/(\1) + (' \/ $WRT_DATE')/g" {} +
