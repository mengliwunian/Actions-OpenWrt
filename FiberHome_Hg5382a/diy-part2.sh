#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

#git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
#git clone https://github.com/sundaqiang/openwrt-packages /tmp/openwrt-packages
#mv /tmp/openwrt-packages/luci-app-wolplus/ package/
#rm -rf /tmp/openwrt-packages
##-----------------Del duplicate packages------------------
rm -rf feeds/packages/net/open-app-filter
rm -rf package/luci-app-wolplus
sleep 2
git clone https://github.com/mengliwunian/luci-app-wolplus package/luci-app-wolplus

# 验证目录是否存在
if [ ! -d "package/luci-app-wolplus" ]; then
    echo "错误：package/luci-app-wolplus 目录不存在，克隆失败"
    exit 1
fi

# 验证 Makefile 是否存在
if [ ! -f "package/luci-app-wolplus/Makefile" ]; then
    echo "错误：package/luci-app-wolplus/Makefile 不存在，仓库可能不完整"
    exit 1
fi

# 验证包名是否和 .config 里写的一致
if ! grep -q "PKG_NAME:=luci-app-wolplus" package/luci-app-wolplus/Makefile; then
    echo "错误：Makefile 中的 PKG_NAME 不是 luci-app-wolplus，请检查仓库"
    exit 1
fi
