uci set dhcp.lan.ignore='1'
#uci set network.lan.gateway='192.168.100.1'
#uci set network.lan.ipaddr='192.168.100.2'
#uci add_list network.lan.dns='192.168.100.1'
uci set network.lan.proto='dhcp'

#uci set luci.main.mediaurlbase='/luci-static/design'

uci commit

# 设置所有网口可访问网页终端
uci delete ttyd.@ttyd[0].interface

# 设置所有网口可连接 SSH
uci set dropbear.@dropbear[0].Interface=''
