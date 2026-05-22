#!/bin/bash

echo "@TODO: проверить и допилить скрипт"
exit 1

for app in $(flatpak permissions | awk '{print $3}' | grep -v 'Приложение' | sort -u); do
    if ! flatpak list --ids | grep -q "$app"; then
        echo "Удаление разрешений для отсутствующего приложения: $app"
        flatpak permission-reset "$app"
    fi
done