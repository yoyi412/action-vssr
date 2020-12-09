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
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
git clone -b master https://github.com/jerrykuku/lua-maxminddb package/leung/lua-maxminddb
git clone -b master https://github.com/jerrykuku/luci-app-vssr package/leung/luci-app-vssr
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/leung/luci-theme-argon-18.06
git clone -b master https://github.com/jerrykuku/luci-app-argon-config package/leung/luci-app-argon-config
git clone -b master https://github.com/jerrykuku/luci-app-jd-dailybonus package/leung/luci-app-jd-dailybonus
git clone https://github.com/jerrykuku/node-request.git package/leung/node-request  #京东签到依赖
git clone -b master https://github.com/vernesong/OpenClash.git package/leung/luci-app-openclash  #openclash出国软件
git clone https://github.com/frainzy1477/luci-app-clash.git package/leung/luci-app-clash  #clash出国软件
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/leung/luci-app-smartdns  #smartdns DNS加速
git clone https://github.com/garypang13/luci-app-eqos.git package/leung/luci-app-eqos  #内网IP限速工具
git clone https://github.com/xiaorouji/openwrt-passwall.git package/leung/openwrt-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/leung/luci-app-passwall  #passwall出国软件
svn co https://github.com/xiaorouji/openwrt-package/trunk/package package/leung/package  #passwall出国软件配套
#git clone -b master https://github.com/fw876/helloworld package/luci-app-ssr-plus

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='LEUNG'' package/lean/default-settings/files/zzz-default-settings

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改内核版本
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' target/linux/x86/Makefile
