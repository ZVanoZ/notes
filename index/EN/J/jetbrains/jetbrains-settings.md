# Общие настройки IDE от JetBtains

## Формат даты в логах GIT

https://www.jetbrains.com/help/phpstorm/date-formats-settings.html

Идем в настройки; выставляем формат; отключаем "Use pretty formatting"

* Settings/Appearance & Behavior -> System Settings -> Date Formats.
    * Date format:
        * "yyyy-MM-dd"          - работает криво. Результат "2026-09-21 16:33".
        * "yyyy-MM-dd HH:mm:ss" - работает криво. Розультат "2026-09-21 16:33:23 16:33"
    * [ ] Use pretty formatting