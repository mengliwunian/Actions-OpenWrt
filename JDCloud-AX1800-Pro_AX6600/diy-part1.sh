#!/bin/bash

# 定义文件路径
VERSION_FILE="include/version.mk"  # 脚本完整路径
WIRELESS_FILE="target/linux/qualcommax/base-files/etc/uci-defaults/990_set-wireless.sh"
MAC80211_FILE="package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc"  # 脚本完整路径
IMAGECONFIG_FILE="package/base-files/image-config.in"  # 脚本完整路径
CONFIGGENERATE_FILE="package/base-files/files/bin/config_generate"
BANNER_FILE="package/base-files/files/etc/banner"

# 使用 sed 命令替换文本
sed -i 's/LiBwrt/OpenWrt/g' "$VERSION_FILE"
sed -i 's/LiBwrt/OpenWrt/g' "$WIRELESS_FILE"
sed -i 's/LiBwrt/OpenWrt/g' "$MAC80211_FILE"
sed -i 's/LiBwrt/OpenWrt/g' "$IMAGECONFIG_FILE"
sed -i 's/LibWrt/OpenWrt/g' "$CONFIGGENERATE_FILE"

BANNER_CONTENT=' _______                     ________        __
|       |.-----.-----.-----.|  |  |  |.----.|  |_
|   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
|_______||   __|_____|__|__||________||__|  |____|
         |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 %D %V, %C
 -----------------------------------------------------'

# 写入新内容到/etc/banner
echo "$BANNER_CONTENT" > $BANNER_FILE

# 输出完成信息
echo "文件中所有的 'LIBwrt' 已经被替换为 'OpenWrt'"
