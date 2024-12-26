sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.10.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/luci2/bin/config_generate
#sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/EzOpWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/EzOpWrt/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/EzOpWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
mv $GITHUB_WORKSPACE/patch/banner package/base-files/files/etc/banner

mv $GITHUB_WORKSPACE/patch/lean/ezopwrt/clt/10_system.js feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
mv $GITHUB_WORKSPACE/patch/lean/ezopwrt/defset package/lean/default-settings/files/zzz-default-settings
mv $GITHUB_WORKSPACE/patch/lean/ezopwrt/99-msd_lite package/base-files/files/etc/99-msd_lite
mv $GITHUB_WORKSPACE/patch/lean/ezopwrt/99-udpxy package/base-files/files/etc/99-udpxy

git clone --depth 1 -b main https://github.com/linkease/istore.git package/istore
#git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld

rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
#git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git  package/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon


sed -i 's/上网时间控制/用户管控/g' feeds/luci/applications/luci-app-accesscontrol/po/zh_Hans/mia.po
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
git clone --depth 1 https://github.com/sirpdboy/luci-app-netwizard package/luci-app-netwizard
git clone --depth 1 https://github.com/sirpdboy/luci-app-parentcontrol package/luci-app-parentcontrol
git clone --depth 1 https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
git clone --depth 1 -b js https://github.com/sirpdboy/luci-theme-kucat.git package/luci-theme-kucat

rm -rf feeds/luci/applications/luci-app-socat
rm -rf feeds/luci/applications/luci-app-pptp-server
git clone --depth 1 https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package
mv package/sirpdboy-package/luci-app-pppoe-server package/luci-app-pppoe-server
mv package/sirpdboy-package/luci-app-socat package/luci-app-socat
mv package/sirpdboy-package/luci-app-pptpserver package/luci-app-pptpserver
rm -rf package/sirpdboy-package

rm -rf feeds/packages/utils/docker
rm -rf feeds/packages/utils/dockerd
rm -rf feeds/packages/utils/containerd
rm -rf feeds/packages/utils/runc
git clone --depth 1 -b openwrt-23.05 https://github.com/immortalwrt/packages package/imm23pkg
mv package/imm23pkg/utils/containerd feeds/packages/utils/containerd
mv package/imm23pkg/utils/docker feeds/packages/utils/docker
mv package/imm23pkg/utils/dockerd feeds/packages/utils/dockerd
mv package/imm23pkg/utils/runc feeds/packages/utils/runc
rm -rf package/imm23pkg

rm -rf feeds/packages/net/aria2
rm -rf feeds/luci/applications/luci-app-aria2
git clone --depth=1 https://github.com/kenzok8/small-package.git package/kz8-small
mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
mv package/kz8-small/luci-app-partexp package/luci-app-partexp
mv package/kz8-small/luci-app-wolplus package/luci-app-wolplus
mv package/kz8-small/aria2 package/aria2
mv package/kz8-small/luci-app-aria2 package/luci-app-aria2
mv package/kz8-small/luci-app-onliner package/luci-app-onliner
sed -i 's/联机用户/已连接用户/g' package/kz8-small/luci-app-onliner/po/zh-cn/onliner.po
rm -rf package/kz8-small
