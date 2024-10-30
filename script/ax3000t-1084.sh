sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/AX3000T1084/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/AX3000T1084/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 添加额外插件

git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
