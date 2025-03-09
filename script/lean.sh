sed -i 's/192.168.1.1/192.168.0.253/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.0.253/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/192.168.1.1/192.168.0.253/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
mv $GITHUB_WORKSPACE/patch/lean/199-diy package/base-files/files/etc/uci-defaults/zz-diy
mv $GITHUB_WORKSPACE/patch/banner package/base-files/files/etc/banner

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
#git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld
git clone --depth 1 https://github.com/vernesong/OpenClash.git  package/openclash
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2
git clone https://github.com/sbwml/luci-app-mosdns -b v5-lua package/mosdns

git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
git clone --depth 1 -b lua https://github.com/sbwml/luci-app-alist.git package/alist

# iStore
git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore
git clone --depth=1 -b master https://github.com/linkease/nas-packages.git package/nas-packages
git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci.git package/nas-luci
mv package/nas-packages/network/services/* package/nas-packages/
rm -rf package/nas-packages/network

#下载5g模块
#git clone --depth=1 https://github.com/Siriling/5G-Modem-Support.git package/5g-modem
#sed -i 's/移动通信模组/通信模组/g' package/5g-modem/luci-app-modem/po/zh-cn/modem.po
#sed -i 's/移动通信模组/通信模组/g' package/5g-modem/luci-app-modem/po/zh_Hans/modem.po

rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 --depth 1 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

rm -rf feeds/packages/net/adguardhome
git clone --depth 1 https://github.com/kenzok8/small-package.git package/kz8-small
mv package/kz8-small/adguardhome package/adguardhome
mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
rm -rf package/kz8-small
