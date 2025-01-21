sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

mv $GITHUB_WORKSPACE/patch/banner package/base-files/files/etc/banner
mv $GITHUB_WORKSPACE/patch/lean/defset package/lean/default-settings/files/zzz-default-settings
mv $GITHUB_WORKSPACE/patch/lean/199-mydef.sh package/base-files/files/etc/uci-defaults/199-mydef.sh

rm -rf feeds/luci/applications/{luci-app-alist,luci-app-adguardhome,luci-app-smartdns,luci-app-softethervpn}
rm -rf feeds/packages/net/{alist,adguardhome,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld
git clone --depth 1 https://github.com/vernesong/OpenClash.git  package/openclash
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
git clone --depth 1 https://github.com/ophub/luci-app-amlogic package/luci-app-amlogic

git clone --depth=1 https://github.com/kenzok8/small-package.git package/kz8-small
mv package/kz8-small/adguardhome package/adguardhome
mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
mv package/kz8-small/alist package/alist
mv package/kz8-small/luci-app-chatgpt-web package/luci-app-chatgpt-web
mv package/kz8-small/luci-app-eqosplus package/luci-app-eqosplus
mv package/kz8-small/iptvhelper package/iptvhelper
mv package/kz8-small/luci-app-iptvhelper package/luci-app-iptvhelper
mv package/kz8-small/lucky package/lucky
mv package/kz8-small/luci-app-lucky package/luci-app-lucky
mv package/kz8-small/smartdns package/smartdns
mv package/kz8-small/luci-app-smartdns package/luci-app-smartdns
mv package/kz8-small/homebox package/homebox
mv package/kz8-small/luci-app-netspeedtest package/luci-app-netspeedtest
mv package/kz8-small/v2dat package/v2dat
rm -rf package/kz8-small

git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
#git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git  package/luci-app-argon-config
git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

rm -rf feeds/smpackage/luci-app-alist
git clone --depth 1 https://github.com/kenzok8/openwrt-packages package/oppkg
mv package/oppkg/luci-app-alist package/luci-app-alist
rm -rf package/oppkg
