# Simple scripts for OpenWRT on Routerich AX3000 
[Русский тут](https://github.com/nihochuha/openwrt_scripts/new/main#%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B-%D0%B4%D0%BB%D1%8F-openwrt-%D0%BD%D0%B0-routerich-ax3000)

## Leds on/off using uci
1. Add config for leds not included in default configuration
   ```
   uci set system.@led[5]=led
   uci set system.@led[5].name='Power'
   uci set system.@led[5].sysfs='blue:power'
   uci set system.@led[5].trigger='heartbeat'
   uci set system.@led[6]=led
   uci set system.@led[6].name='Red_WiFi5'
   uci set system.@led[6].sysfs='red:wlan-50'
   uci set system.@led[6].trigger='netdev'
   uci set system.@led[6].dev='phy1-ap0'
   uci set system.@led[6].mode='tx'
   uci add_list system.@led[6].mode='rx'
   uci set system.@led[7]=led
   uci set system.@led[7].name='Blue_WiFi4'
   uci set system.@led[7].sysfs='blue:wlan-24'
   uci set system.@led[7].trigger='netdev'
   uci set system.@led[7].dev='phy0-ap0'
   uci set system.@led[7].mode='tx'
   uci add_list system.@led[7].mode='rx'
   uci set system.@led[8]=led
   uci set system.@led[8].name='Mesh_5.8'
   uci set system.@led[8].sysfs='blue:mesh'
   uci set system.@led[8].trigger='default-on'
   ```
3. Put [ledcontrol.sh](ledcontrol.sh) to /usr/bin/ folder of your router and make it executable
   - Download it directly from router CLI:
     ```
     wget https://github.com/nihochuha/openwrt_scripts/raw/main/routerich/ledcontrol.sh -O /usr/bin/ledcontrol.sh
     ```
   - or copy and paste its content at terminal
     ```
     nano /usr/bin/ledcontrol.sh
     ```
   
   and make it executable
   ```
   chmod +x /usr/bin/ledcontrol.sh
   ```
4. Add crontab job to turn off all leds from 11 p.m. to 8 a.m.:
   ```
   0 23 * * * /usr/bin/ledcontrol.sh off
   0 8 * * * /usr/bin/ledcontrol.sh on
   ```
   - using router cli:
     - enter command `crontab -e`
     - press "I" on keyboard
     - paste two strings quoted above at the end of file
     - press "Esc"
     - enter ":wq"
   - **or** using LuCi web interface
     - navigate to System - Sheduled Tasks
     - paste two strings quoted above to the end of text input
     - press "Save"
   

# Скрипты для OpenWRT на Routerich AX3000

## Вкл/выкл диодов через настройки uci
1. Добавьте диоды, не настроенные по умолчанию
   ```
   uci set system.@led[5]=led
   uci set system.@led[5].name='Power'
   uci set system.@led[5].sysfs='blue:power'
   uci set system.@led[5].trigger='heartbeat'
   uci set system.@led[6]=led
   uci set system.@led[6].name='Red_WiFi5'
   uci set system.@led[6].sysfs='red:wlan-50'
   uci set system.@led[6].trigger='netdev'
   uci set system.@led[6].dev='phy1-ap0'
   uci set system.@led[6].mode='tx'
   uci add_list system.@led[6].mode='rx'
   uci set system.@led[7]=led
   uci set system.@led[7].name='Blue_WiFi4'
   uci set system.@led[7].sysfs='blue:wlan-24'
   uci set system.@led[7].trigger='netdev'
   uci set system.@led[7].dev='phy0-ap0'
   uci set system.@led[7].mode='tx'
   uci add_list system.@led[7].mode='rx'
   uci set system.@led[8]=led
   uci set system.@led[8].name='Mesh_5.8'
   uci set system.@led[8].sysfs='blue:mesh'
   uci set system.@led[8].trigger='default-on'
   ```
3. Поместите [ledcontrol.sh](ledcontrol.sh) в папку /usr/bin/ вашего маршрутизатора
   - Скачайте напрямую из командной строки роутера
     ```
     wget https://github.com/nihochuha/openwrt_scripts/raw/main/routerich/ledcontrol.sh -O /usr/bin/ledcontrol.sh
     ```
   - или вставьте содержимое файла через терминал
     ```
     nano /usr/bin/ledcontrol.sh
     ```
   
   нужно сделать скрипт исполняемым
   ```
   chmod +x /usr/bin/ledcontrol.sh
   ```
4. Добавьте в планировщик задач команды для выключения диодов с 23:00 до 8 утра:
   ```
   0 23 * * * /usr/bin/ledcontrol.sh off
   0 8 * * * /usr/bin/ledcontrol.sh on
   ```

   - из командной строки роутера:
     - введите команду `crontab -e`
     - нажмите клавишу "I"
     - вставьте две строчки из цитаты выше в конец файла
     - нажмите "Esc"
     - введите ":wq" (без кавычек)
   - **или** через веб-интерфейс LuCi:
     - откройте вкладку Система - Планировщик
     - вставьте две строчки из цитаты выше в конец текстового поля
     - нажмите "Сохранить"
