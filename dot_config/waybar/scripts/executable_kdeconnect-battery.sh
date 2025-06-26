#!/bin/bash

# Find a connected device (replace with your desired device name or a more robust selection)
# This is a basic example; you might need to parse `busctl` output more carefully
# or prompt the user for which device if multiple are connected.
DEVICE_PATH=$(busctl --user call org.kde.kdeconnect /modules/kdeconnect org.kde.kdeconnect.daemon.devices | grep "your_device_name" | awk -F\" '{print $2}')

if [ -n "$DEVICE_PATH" ]; then
  # Extract the device ID from the path (e.g., /modules/kdeconnect/devices/123abc456def -> 123abc456def)
  DEVICE_ID=$(basename "$DEVICE_PATH")

  BATTERY_CHARGE=$(busctl --user call org.kde.kdeconnect "/modules/kdeconnect/devices/$DEVICE_ID/battery" org.kde.kdeconnect.device.battery.charge | awk '{print $2}')

  BATTERY_ICON="󰁹" # Example icon (Nerd Fonts)
  echo "$BATTERY_ICON $BATTERY_CHARGE%"
else
  echo "Phone disconnected"
fi
