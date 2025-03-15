sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.100.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/luci2/bin/config_generate
#sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

mv $GITHUB_WORKSPACE/patch/banner package/base-files/files/etc/banner
mv $GITHUB_WORKSPACE/patch/lean/ezopwrt/soc-status feeds/luci/modules/luci-base/root/sbin/soc-status
chmod a+rwx feeds/luci/modules/luci-base/root/sbin/soc-status
mv $GITHUB_WORKSPACE/patch/lean/ezopwrt/luci feeds/luci/modules/luci-base/root/usr/share/rpcd/ucode/luci
mv $GITHUB_WORKSPACE/patch/lean/ezopwrt/luci-mod-status.json feeds/luci/modules/luci-mod-status/root/usr/share/rpcd/acl.d/luci-mod-status.json
mv $GITHUB_WORKSPACE/patch/lean/defset package/lean/default-settings/files/zzz-default-settings
mv $GITHUB_WORKSPACE/patch/lean/10_system.js feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js

# iStore
git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore
git clone --depth=1 -b master https://github.com/linkease/nas-packages.git package/nas-packages
git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci.git package/nas-luci
mv package/nas-packages/network/services/* package/nas-packages/
rm -rf package/nas-packages/network

git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld
git clone --depth 1 https://github.com/vernesong/OpenClash.git  package/openclash
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2
git clone --depth 1 https://github.com/destan19/OpenAppFilter.git package/openwrt-oaf
git clone https://github.com/sbwml/luci-app-filemanager.git package/luci-app-filemanager

rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
#git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git  package/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon


git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
git clone --depth 1 https://github.com/sirpdboy/luci-app-netwizard package/luci-app-netwizard
git clone --depth 1 https://github.com/sirpdboy/luci-app-parentcontrol package/luci-app-parentcontrol
git clone --depth 1 https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
git clone --depth 1 -b js https://github.com/sirpdboy/luci-theme-kucat.git package/luci-theme-kucat
mv $GITHUB_WORKSPACE/patch/lean/ezopwrt/netwizard.lua package/luci-app-netwizard/luasrc/controller/netwizard.lua

rm -rf feeds/luci/applications/luci-app-socat
git clone --depth 1 https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package
mv package/sirpdboy-package/luci-app-pppoe-server package/luci-app-pppoe-server
mv package/sirpdboy-package/luci-app-socat package/luci-app-socat
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
git clone --depth 1 -b openwrt-23.05 https://github.com/immortalwrt/luci.git package/imm23luci
mv package/imm23luci/applications/luci-app-softethervpn package/luci-app-softethervpn
sed -i 's#../../luci.mk#$(TOPDIR)/feeds/luci/luci.mk#g' package/luci-app-softethervpn/Makefile
rm -rf package/imm23luci

rm -rf feeds/packages/net/adguardhome
rm -rf feeds/packages/net/alist
rm -rf feeds/luci/applications/luci-app-alist
#rm -rf feeds/packages/net/aria2
#rm -rf feeds/packages/net/ariang
#rm -rf feeds/luci/applications/luci-app-aria2
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/packages/net/lucky
rm -rf feeds/luci/applications/luci-app-lucky
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall2
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-softether
git clone --depth=1 https://github.com/kenzok8/small-package.git package/kz8-small
mv package/kz8-small/adguardhome package/adguardhome
mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
mv package/kz8-small/alist package/alist
mv package/kz8-small/luci-app-alist package/luci-app-alist
#mv package/kz8-small/aria2 package/aria2
#mv package/kz8-small/ariang package/ariang
#mv package/kz8-small/luci-app-aria2 package/luci-app-aria2
mv package/kz8-small/luci-app-bypass package/luci-app-bypass
mv package/kz8-small/luci-app-control-timewol package/luci-app-control-timewol
mv package/kz8-small/luci-app-control-webrestriction package/luci-app-control-webrestriction
mv package/kz8-small/luci-app-control-weburl package/luci-app-control-weburl
mv package/kz8-small/luci-app-chatgpt-web package/luci-app-chatgpt-web
mv package/kz8-small/luci-app-dockerman package/luci-app-dockerman
mv package/kz8-small/luci-app-easymesh package/luci-app-easymesh
mv package/kz8-small/luci-app-eqosplus package/luci-app-eqosplus
mv package/kz8-small/luci-app-guest-wifi package/luci-app-guest-wifi
mv package/kz8-small/luci-app-ipsec-server package/luci-app-ipsec-server
mv package/kz8-small/iptvhelper package/iptvhelper
mv package/kz8-small/luci-app-iptvhelper package/luci-app-iptvhelper
mv package/kz8-small/lucky package/lucky
mv package/kz8-small/luci-app-lucky package/luci-app-lucky
mv package/kz8-small/mosdns package/mosdns
mv package/kz8-small/luci-app-mosdns package/luci-app-mosdns
#mv package/kz8-small/luci-app-openvpn-client package/luci-app-openvpn-client
mv package/kz8-small/luci-app-onliner package/luci-app-onliner
mv package/kz8-small/luci-app-partexp package/luci-app-partexp
mv package/kz8-small/luci-app-pushbot package/luci-app-pushbot
mv package/kz8-small/luci-app-poweroffdevice package/luci-app-poweroffdevice
mv package/kz8-small/luci-app-pptp-server package/luci-app-pptp-server
mv package/kz8-small/smartdns package/smartdns
mv package/kz8-small/luci-app-smartdns package/luci-app-smartdns
#mv package/kz8-small/luci-app-softethervpn package/luci-app-softethervpn
mv package/kz8-small/luci-app-wolplus package/luci-app-wolplus
mv package/kz8-small/wrtbwmon package/wrtbwmon
mv package/kz8-small/luci-app-wrtbwmon package/luci-app-wrtbwmon
rm -rf package/kz8-small

git clone --depth 1 https://github.com/kiddin9/kwrt-packages.git package/kwrt-packages
mv package/kwrt-packages/adbyby package/adbyby
mv package/kwrt-packages/luci-app-adbyby-plus package/luci-app-adbyby-plus
mv package/kwrt-packages/apfree-wifidog package/apfree-wifidog
mv package/kwrt-packages/luci-app-apfree-wifidog package/luci-app-apfree-wifidog
mv package/kwrt-packages/luci-app-broadbandacc package/luci-app-broadbandacc
mv package/kwrt-packages/clouddrive2 package/clouddrive2
mv package/kwrt-packages/luci-app-clouddrive2 package/luci-app-clouddrive2
mv package/kwrt-packages/cloudreve package/cloudreve
mv package/kwrt-packages/luci-app-cloudreve package/luci-app-cloudreve
mv package/kwrt-packages/dufs package/dufs
mv package/kwrt-packages/luci-app-dufs package/luci-app-dufs
mv package/kwrt-packages/luci-app-homeassistant package/luci-app-homeassistant
mv package/kwrt-packages/my-dnshelper package/my-dnshelper
mv package/kwrt-packages/luci-app-my-dnshelper package/luci-app-my-dnshelper
mv package/kwrt-packages/luci-app-timedreboot package/luci-app-timedreboot
rm -rf package/kwrt-packages
