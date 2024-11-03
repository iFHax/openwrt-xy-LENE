sed -i 's/192.168.1.1/192.168.7.1/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/ChangLingTong/g' package/base-files/files/bin/config_generate

sed -i 's/mirrors.vsean.net/mirror.nju.edu.cn/g' package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's/openwrt/immortalwrt/g' package/emortal/default-settings/files/99-default-settings-chinese

git clone --depth=1 -b master https://github.com/x-wrt/com.x-wrt.git package/com-x-wrt
mv package/com-x-wrt/luci-app-wizard package/luci-app-wizard
rm -rf package/com-x-wrt
