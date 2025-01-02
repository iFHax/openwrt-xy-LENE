sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i "s/luci-theme-bootstrap/luci-theme-design/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
mv $GITHUB_WORKSPACE/patch/banner $OPENWRT_PATH/package/base-files/files/etc/banner
mv $GITHUB_WORKSPACE/patch/lean/defset $OPENWRT_PATH/package/lean/default-settings/files/zzz-default-settings

rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb,luci-theme-argon}
rm -rf feeds/luci/applications/{luci-app-alist,luci-app-adguardhome,luci-app-mosdns,luci-app-smartdns,luci-app-softethervpn}
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git  package/luci-app-argon-config
git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

rm -rf feeds/smpackage/luci-app-alist
git clone --depth 1 https://github.com/kenzok8/openwrt-packages package/oppkg
mv package/oppkg/luci-app-alist package/luci-app-alist
rm -rf package/oppkg
