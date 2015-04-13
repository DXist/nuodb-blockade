#!/bin/bash
set -x
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag

# for port in 48004 48005 48006 48007 48008 48009 8888 ; do
# 	iptables -D INPUT -p tcp --dport $port -j ACCEPT || true
# 	iptables -I INPUT -p tcp --dport $port -j ACCEPT
# done

# for port in 5353 ; do
# 	iptables -D INPUT -p udp --dport $port -j ACCEPT || true
# 	iptables -I INPUT -p udp --dport $port -j ACCEPT
# done
