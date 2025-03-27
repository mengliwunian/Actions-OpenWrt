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

git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone https://github.com/sundaqiang/openwrt-packages /tmp/openwrt-packages
mv /tmp/openwrt-packages/luci-app-wolplus/ package/
rm -rf /tmp/openwrt-packages
##-----------------Del duplicate packages------------------
rm -rf feeds/packages/net/open-app-filter

