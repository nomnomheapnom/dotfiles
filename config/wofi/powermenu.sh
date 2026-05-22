#!/usr/bin/env bash

uptime_val=$(uptime -p | sed 's/up //')
uptime_text="  System Uptime    $uptime_val"

shutdown="  Shutdown"
reboot="  Reboot"
logout="  Log Out"
suspend="  Suspend"
lock="  Lock"
hibernate="  Hibernate"

options="$uptime_text\n$shutdown\n$reboot\n$logout\n$suspend\n$lock\n$hibernate"

chosen="$(echo -e "$options" | wofi --dmenu \
    --conf=$HOME/.config/wofi/config_powermenu \
    --style=$HOME/.config/wofi/style.css \
    --cache-file /dev/null)"

case $chosen in
    "$lock")     hyprlock || swaylock ;;
    "$suspend")  systemctl suspend ;;
    "$logout")   hyprctl dispatch exit || killall -u $USER ;;
    "$hibernate") systemctl hibernate ;;
    "$reboot")   systemctl reboot ;;
    "$shutdown") systemctl poweroff ;;
    *)           exit 0 ;;
esac
