Запуск **Garage** в Docker — это самый быстрый способ развернуть хранилище, так как весь проект собран в один компактный образ.

Вот инструкция по запуску одного узла (ноды) для тестов или личного использования.

### 1. Подготовка папок

Создайте папки, где будут лежать настройки и сами данные, чтобы они не удалились после перезапуска контейнера:

```bash
mkdir -p garage/config garage/data garage/meta

```

---

### 2. Создание файла конфигурации (`garage.toml`)

Garage не запустится без файла настроек. Создайте его в папке `garage/config/garage.toml`:

```toml
# Порт для связи между серверами Garage (RPC)
rpc_bind_addr = "[::]:3901"
rpc_secret = "замените_на_любую_длинную_случайную_строку"

# Пути для данных
metadata_dir = "/meta"
data_dir = "/data"

# Настройки S3 API (куда будут подключаться ваши программы)
[s3_api]
api_bind_addr = "[::]:3900"
root_domain = ".s3.garage.localhost" # Или ваш домен

# Настройки веб-доступа (если нужен просмотр файлов через браузер)
[s3_web]
bind_addr = "[::]:3902"
root_domain = ".web.garage.localhost"

```

---

### 3. Запуск через Docker Compose (Рекомендуется)

Создайте файл `docker-compose.yml` в той же папке:

```yaml
version: '3.8'
services:
  garage:
    image: dxflrs/garage:v1.0.0 # Проверьте актуальную версию на сайте
    container_name: garage
    restart: unless-stopped
    ports:
      - "3900:3900" # S3 API
      - "3901:3901" # RPC (для связи нод)
      - "3902:3902" # Web (статические сайты)
    volumes:
      - ./garage/config:/etc/garage
      - ./garage/meta:/meta
      - ./garage/data:/data
    environment:
      - RUST_LOG=garage=info

```

**Запустите команду:**

```bash
docker-compose up -d

```

---

### 4. Инициализация ноды

После запуска контейнера Garage «спит». Его нужно активировать и назначить ему роль.

1. **Узнайте ID вашей ноды:**
```bash
docker exec garage garage status

```


2. **Настройте макет (layout):** (замените `<NODE_ID>` на ID из предыдущей команды)
```bash
docker exec garage garage layout assign <NODE_ID> --capacity 100G --zone dc1 --tag my-node

```


3. **Примените настройки:**
```bash
docker exec garage garage layout apply --version 1

```



---

### 5. Создание ключей доступа (Access Key)

Чтобы подключиться к хранилищу (например, через Cyberduck или rclone), создайте пользователя:

```bash
docker exec garage garage key create my-user

```

Вы получите `Access Key ID` и `Secret Access Key`. **Сохраните их!**

---

### Как проверить работу?

Самый простой способ — зайти в браузере по адресу `http://localhost:3900`.
Если вы видите ошибку в формате XML (например, `AccessDenied` или `MethodNotAllowed`), значит, сервер **работает** и готов принимать запросы по протоколу S3.

> **Важно:** Если вы увидите знакомую вам ошибку `Forbidden: Garage does not support anonymous access yet`, значит, вы пытаетесь зайти на веб-порт (3902) или API без авторизации. Это подтверждает, что Garage запущен!

**Хотите, я помогу составить команду для подключения к вашему новому Garage через консольный клиент `aws-cli` или `rclone`?**