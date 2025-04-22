#!/bin/bash

# Get current connection
current=$(nmcli -t -f NAME connection show --active)

# Menu options
options="Connect to WiFi\nDisconnect\nNetwork Status"

# Show menu
chosen=$(echo -e "$options" | rofi -dmenu -p "Network" -theme-str 'window {width: 20%;}')

case $chosen in
    "Connect to WiFi")
        wifi_list=$(nmcli -t -f SSID dev wifi list | sort -u)
        chosen_wifi=$(echo -e "$wifi_list" | rofi -dmenu -p "Select WiFi")
        if [ -n "$chosen_wifi" ]; then
            nmcli dev wifi connect "$chosen_wifi"
        fi
        ;;
    "Disconnect")
        if [ -n "$current" ]; then
            nmcli connection down "$current"
        fi
        ;;
    "Network Status")
        nmcli connection show
        ;;
esac