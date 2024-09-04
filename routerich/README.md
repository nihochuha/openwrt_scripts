# Simple scripts for OpenWRT on Routerich AX3000 
[Русский тут](https://github.com/nihochuha/openwrt_scripts/tree/main/routerich#%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B-%D0%B4%D0%BB%D1%8F-openwrt-%D0%BD%D0%B0-routerich-ax3000)

## Leds on/off using uci
1. Check your router's /etc/config/system configuration file (`nano /etc/config/system`).
   If you're using default configuration some `config led` sections are missed, so add missing saving order by `option sysfs` key from sample below. It's safe to change name depending on your needs.
   ```
   config led 'led_lan_1'
	   option name 'lan-1'
	   option sysfs 'blue:lan-1'
	   option trigger 'none'
	   option dev 'lan1'
	   list mode 'link'
	   list mode 'tx'
	   list mode 'rx'
   
   config led 'led_lan_2'
	   option name 'lan-2'
	   option sysfs 'blue:lan-2'
	   option trigger 'none'
	   option dev 'lan2'
	   list mode 'link'
	   list mode 'tx'
	   list mode 'rx'
   
   config led 'led_lan_3'
	   option name 'lan-3'
	   option sysfs 'blue:lan-3'
	   option trigger 'none'
	   option dev 'lan3'
	   list mode 'link'
	   list mode 'tx'
	   list mode 'rx'
   
   config led 'led_wan'
	   option name 'wan'
	   option sysfs 'blue:wan'
	   option trigger 'none'
	   option dev 'wan'
	   list mode 'link'

   config led 'led_wan_off'
	   option name 'wan-off'
	   option sysfs 'red:wan'
	   option trigger 'netdev'
	   option mode 'link'
	   option dev 'wan'
   
   config led
	   option name 'Power'
	   option sysfs 'blue:power'
	   option trigger 'none'
   
   config led
	   option name 'Red_WiFi5'
	   option sysfs 'red:wlan-50'
	   option trigger 'none'
	   option dev 'phy1-ap0'
	   list mode 'tx'
	   list mode 'rx'
   
   config led
	   option name 'Blue_WiFi4'
	   option sysfs 'blue:wlan-24'
	   option trigger 'none'
	   option dev 'phy0-ap0'
	   list mode 'tx'
	   list mode 'rx'
   
   config led
	   option name 'Mesh_5.8'
	   option sysfs 'blue:mesh'
	   option trigger 'default-on'
   ```
   after saving the file run `reload_config` command in CLI.
   
2. Put [ledcontrol.sh](ledcontrol.sh) to /usr/bin/ folder of your router and make it executable
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
1. Отредактируйте файл конфигурации /etc/config/system (`nano /etc/config/system`).
   Если вы используете конфигурацию по умолчанию, набор секций `config led` у вас будет другой, добавьте недостающие скопировав их из листинга ниже. Можно менять имена, но порядок секций (по значению `option sysfs`) лучше сохранить, так как скрипт использует в работе порядковые номера.
   ```
   config led 'led_lan_1'
	   option name 'lan-1'
	   option sysfs 'blue:lan-1'
	   option trigger 'none'
	   option dev 'lan1'
	   list mode 'link'
	   list mode 'tx'
	   list mode 'rx'
   
   config led 'led_lan_2'
	   option name 'lan-2'
	   option sysfs 'blue:lan-2'
	   option trigger 'none'
	   option dev 'lan2'
	   list mode 'link'
	   list mode 'tx'
	   list mode 'rx'
   
   config led 'led_lan_3'
	   option name 'lan-3'
	   option sysfs 'blue:lan-3'
	   option trigger 'none'
	   option dev 'lan3'
	   list mode 'link'
	   list mode 'tx'
	   list mode 'rx'
   
   config led 'led_wan'
	   option name 'wan'
	   option sysfs 'blue:wan'
	   option trigger 'none'
	   option dev 'wan'
	   list mode 'link'

   config led 'led_wan_off'
	   option name 'wan-off'
	   option sysfs 'red:wan'
	   option trigger 'netdev'
	   option mode 'link'
	   option dev 'wan'
   
   config led
	   option name 'Power'
	   option sysfs 'blue:power'
	   option trigger 'none'
   
   config led
	   option name 'Red_WiFi5'
	   option sysfs 'red:wlan-50'
	   option trigger 'none'
	   option dev 'phy1-ap0'
	   list mode 'tx'
	   list mode 'rx'
   
   config led
	   option name 'Blue_WiFi4'
	   option sysfs 'blue:wlan-24'
	   option trigger 'none'
	   option dev 'phy0-ap0'
	   list mode 'tx'
	   list mode 'rx'
   
   config led
	   option name 'Mesh_5.8'
	   option sysfs 'blue:mesh'
	   option trigger 'default-on'
   ```
   после сохранения файла выполните в терминале роутера команду `reload_config`.
2. Поместите [ledcontrol.sh](ledcontrol.sh) в папку /usr/bin/ вашего маршрутизатора
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
3. Добавьте в планировщик задач команды для выключения диодов с 23:00 до 8 утра:
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
