sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
#sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's#mirrors.vsean.net/openwrt#mirror.nju.edu.cn/immortalwrt#g' package/emortal/default-settings/files/99-default-settings-chinese
mv $GITHUB_WORKSPACE/patch/banner $OPENWRT_PATH/package/base-files/files/etc/banner
mv $GITHUB_WORKSPACE/patch/imm23.05/mac80211.sh $OPENWRT_PATH/package/kernel/mac80211/files/lib/wifi/mac80211.sh
mv $GITHUB_WORKSPACE/patch/imm23.05/defset $OPENWRT_PATH/package/emortal/default-settings/files/99-default-settings

# iStore
git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore
git clone --depth=1 -b master https://github.com/linkease/nas-packages.git package/nas-packages
git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci.git package/nas-luci
mv package/nas-packages/network/services/* package/nas-packages/
rm -rf package/nas-packages/network

rm -rf feeds/packages/lang/golang
git clone --depth=1 https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
rm -rf feeds/packages/devel/gn
rm -rf feeds/luci/applications/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall-packages
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/passwall
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
