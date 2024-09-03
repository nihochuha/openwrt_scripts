# Simple scripts for OpenWRT on Routerich AX3000 [Русский](https://github.com/nihochuha/openwrt_scripts/new/main#%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B-%D0%B4%D0%BB%D1%8F-openwrt-%D0%BD%D0%B0-routerich-ax3000)

## Leds on/off using uci
1. Add leds not included in default configuration
   ```
   uci set system.@led[5]=led
   uci set system.@led[5].name='Power'
   uci set system.@led[5].sysfs='blue:power'
   uci set system.@led[5].trigger='heartbeat'
   uci set system.@led[6]=led
   uci set system.@led[6].name='Red_WiFi5'
   uci set system.@led[6].sysfs='red:wlan-50'
   uci set system.@led[6].trigger='netdev'
   uci set system.@led[6].dev='phy0-ap0'
   uci set system.@led[6].mode='tx' 'rx'
   uci set system.@led[7]=led
   uci set system.@led[7].name='Blue_WiFi4'
   uci set system.@led[7].sysfs='blue:wlan-24'
   uci set system.@led[7].trigger='netdev'
   uci set system.@led[7].dev='phy0-ap0'
   uci set system.@led[7].mode='tx' 'rx'
   uci set system.@led[8]=led
   uci set system.@led[8].name='Mesh_5.8'
   uci set system.@led[8].sysfs='blue:mesh'
   uci set system.@led[8].trigger='default-on'
   ```
3. Put ledcontrol.sh to /usr/bin/ folder of your router and make it executable
   - Download it directly
   - or copy and paste its content at terminal
   
   and make it executable
   ```
   chmod +x /usr/bin/ledcontrol.sh
   ```
4. Add crontab job
   ```
   0 23 * * * /usr/bin/ledcontrol.sh off
   0 8 * * * /usr/bin/ledcontrol.sh on
   ```
   it will turn off all leds from 11 p.m. to 8 a.m.

# Скрипты для OpenWRT на Routerich AX3000

## Вкл/выкл диодов через настройки uci
1. Добавьте диоды, не настроенные по умолчанию
   ```
   uci add system.@led[5]=led
   uci add system.@led[5].name='Power'
   uci add system.@led[5].sysfs='blue:power'
   uci add system.@led[5].trigger='heartbeat'
   uci add system.@led[6]=led
   uci add system.@led[6].name='Red_WiFi5'
   uci add system.@led[6].sysfs='red:wlan-50'
   uci add system.@led[6].trigger='none'
   uci add system.@led[6].default='0'
   uci add system.@led[7]=led
   uci add system.@led[7].name='Blue_WiFi4'
   uci add system.@led[7].sysfs='blue:wlan-24'
   uci add system.@led[7].trigger='netdev'
   uci add system.@led[7].dev='phy0-ap1'
   uci add system.@led[7].mode='tx'
   uci add system.@led[8]=led
   uci add system.@led[8].name='Mesh_5.8'
   uci add system.@led[8].sysfs='blue:mesh'
   uci add system.@led[8].trigger='default-on'
   ```
3. Поместите ledcontrol.sh в папку /usr/bin/ вашего маршрутизатора
   - Скачайте напрямую
   - или вставьте содержимое файла через терминал
   
   нужно сделать скрипт исполняемым
   ```
   chmod +x /usr/bin/ledcontrol.sh
   ```
4. Добавьте строчки в планировщик задач 
   ```
   0 23 * * * /usr/bin/ledcontrol.sh off
   0 8 * * * /usr/bin/ledcontrol.sh on
   ```
   теперь диоды будут выключаться в 23:00 и снова включаться в 8 утра
