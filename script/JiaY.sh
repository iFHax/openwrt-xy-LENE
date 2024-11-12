sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")

git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth=1 https://github.com/sirpdboy/luci-app-eqosplus.git package/eqosplus
sed -i 's/Control/NetControl/g' package/eqosplus/luasrc/controller/eqosplus.lua
sed -i '$a msgid "NetControl"' package/eqosplus/po/zh_Hans/eqosplus.po
sed -i '$a msgstr "网络控制"' package/eqosplus/po/zh_Hans/eqosplus.po
sed -i '$a msgid "NetControl"' package/eqosplus/po/zh-cn/eqosplus.po
sed -i '$a msgid "网络控制"' package/eqosplus/po/zh-cn/eqosplus.po
