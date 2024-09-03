#!/bin/sh
# Script turns on and off leds on Routerich AX3000 router running OpenWRT
# https://openwrt.org/toh/routerich/ax3000
# Published at https://github.com/nihochuha/openwrt_scripts/routerich
# version v0.1 Sep 3, 2024

case "$1" in
        on)
            uci set system.led_lan_1.trigger='netdev'
            uci set system.led_lan_1.mode='link'
            uci add_list system.led_lan_1.mode='tx'
            uci add_list system.led_lan_1.mode='rx'
            uci set system.led_lan_2.trigger='netdev'
            uci set system.led_lan_2.mode='link'
            uci add_list system.led_lan_2.mode='tx'
            uci add_list system.led_lan_2.mode='rx'
            uci set system.led_lan_3.trigger='netdev'
            uci set system.led_lan_3.mode='link'
            uci add_list system.led_lan_3.mode='tx'
            uci add_list system.led_lan_3.mode='rx'
            uci set system.led_wan.trigger='netdev'
            uci set system.@led[5].trigger='heartbeat'
            uci set system.@led[6].trigger='netdev'
            uci set system.@led[6].mode='tx'
            uci add_list system.@led[6].mode='rx'
            uci set system.@led[7].trigger='netdev'
            uci set system.@led[7].mode='tx'
            uci add_list system.@led[7].mode='rx'
            uci set system.@led[8].trigger='default-on'
            uci commit && service led reload
            ;;

        off)
            uci set system.led_lan_1.trigger='none'
            uci set system.led_lan_2.trigger='none'
            uci set system.led_lan_3.trigger='none'
            uci set system.led_wan.trigger='none'
            uci set system.@led[5].trigger='none'
            uci set system.@led[6].trigger='none'
            uci set system.@led[7].trigger='none'
            uci set system.@led[8].trigger='none'
            uci commit && service led reload
            ;;

        *)
            echo "Usage: $0 {on|off}"

            exit 1

esac
