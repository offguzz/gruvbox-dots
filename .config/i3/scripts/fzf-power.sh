#!/bin/bash

# Obtém a porcentagem da bateria (ajuste para seu sistema se necessário)
BATTERY_LEVEL=$(upower -i $(upower -e | grep BAT) | awk '/percentage/ {print $2}')

# Usa o nível da bateria no header do fzf
CHOICE=$(echo -e "Poweroff\nReboot\nSuspend\nLog out\nPower Profile" | \
fzf --no-multi --no-preview --header "Power Management – Battery: $BATTERY_LEVEL")

case "$CHOICE" in
"Poweroff")
  systemctl poweroff
  ;;
"Reboot")
  systemctl reboot
  ;;
"Suspend")
  systemctl suspend
  ;;
"Log out")
  hyprctl dispatch exit
  ;;
"Logout")
  hyprctl dispatch exit
  ;;
"Power Profile")
  CHOICE2=$(echo -e "Power Saver\nBalenced\nPerformance" | fzf --no-multi --no-preview --header "Current Mode: $(powerprofilesctl get)")
  case "$CHOICE2" in
  "Power Saver")
    powerprofilesctl set power-saver
    ;;
  "Balanced")
    powerprofilesctl set balanced
    ;;
  "Performance")
    powerprofilesctl set performance
    ;;
  esac
  ;;
*)
  echo "Opção inválida"
  ;;
esac
