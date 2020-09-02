#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.5/g' package/base-files/files/bin/config_generate
git clone -b master https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
git clone -b master https://github.com/sayhello023/luci-app-vssr package/luci-app-vssr
rm -rf luci-theme-argon
git clone -b master https://github.com/jerrykuku/luci-theme-argon
