sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate

#git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
#git clone --depth=1 https://github.com/Siriling/5G-Modem-Support.git package/5g-modem

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git clone --depth=1 -b luci-21 https://github.com/jjm2473/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
git clone --depth=1 -b dev https://github.com/jjm2473/luci-app-argon-config.git feeds/luci/applications/luci-app-argon-config
git clone --depth=1 https://github.com/linkease/istore.git package/istore
git clone --depth=1 https://github.com/linkease/nas-packages.git package/nas-packages
git clone --depth=1 https://github.com/linkease/nas-packages-luci.git package/nas-luci
mv package/nas-packages/network/services/* package/nas-packages/
rm -rf package/nas-packages/network

