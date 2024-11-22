sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/10.0.0.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
