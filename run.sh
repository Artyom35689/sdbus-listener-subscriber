#!/bin/bash

# Генерируем machine-id для D-Bus
dbus-uuidgen > /var/lib/dbus/machine-id

# Запускаем сессионный bus D-Bus в фоне
dbus-daemon --session --fork --print-address > /tmp/dbus-address

# Экспортируем переменную окружения для D-Bus
export DBUS_SESSION_BUS_ADDRESS=$(cat /tmp/dbus-address)
echo "D-Bus session address: $DBUS_SESSION_BUS_ADDRESS"

