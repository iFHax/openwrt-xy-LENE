sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/router/g' package/base-files/files/bin/config_generate

# sed -i 's/bootstrap/design/g' feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i "s/luci-theme-design/luci-theme-design/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
rm -rf feeds/luci/applications/luci-app-filetransfer
rm -rf package/emortal/luci-app-mwan3helper-chinaroute

rm -rf feeds/luci/themes/luci-theme-argonv3
rm -rf feeds/luci/themes/luci-theme-argonv2
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
