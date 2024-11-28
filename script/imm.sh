sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/ImmortalWrt/X86/g' package/base-files/files/bin/config_generate
sed -i 's#mirrors.vsean.net/openwrt#mirror.nju.edu.cn/immortalwrt#g' package/emortal/default-settings/files/99-default-settings-chinese
mv $GITHUB_WORKSPACE/patch/banner $OPENWRT_PATH/package/base-files/files/etc/banner

# sed -i 's/bootstrap/design/g' feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i "s/luci-theme-design/luci-theme-design/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")

#rm -rf feeds/luci/themes/luci-theme-argonv3
#rm -rf feeds/luci/themes/luci-theme-argonv2
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
#git clone --depth=1 https://github.com/kenzok8/openwrt-packages.git  package/openwrt-packages
#mv package/openwrt-packages/luci-theme-design package/luci-theme-design
#rm -rf package/openwrt-packages
