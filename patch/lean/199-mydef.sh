#!/bin/sh

uci set network.lan.ipaddr=192.168.2.2
uci set network.lan.gateway=192.168.2.1
uci set network.lan.dns=210.21.196.6
uci set dhcp.lan.ignore=1
#uci set network.lan.proto='dhcp'
#uci set luci.main.mediaurlbase='/luci-static/design'


# 设置所有网口可访问网页终端
uci delete ttyd.@ttyd[0].interface

# 设置所有网口可连接 SSH
uci set dropbear.@dropbear[0].Interface=''

uci commit

exit 0
