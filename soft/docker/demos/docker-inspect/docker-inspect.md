# @see

* https://docs.docker.com/engine/cli/formatting/

---

```shell
docker inspect local.service-test-oracle-db
```
```shell
docker inspect local.service-test-oracle-db -f '{{.Id}}'
docker inspect local.service-test-oracle-db -f '{{.State.Status}}'
docker inspect local.service-test-oracle-db -f '{{.Mounts}}' 
```

---

* "Config.Labels" = {key1:'ke1val', key2:'ke2val', ...}
```shell
docker inspect local.service-test-oracle-db -f '{{json .Config.Labels}}'
```
```text
"Labels": {
    "com.docker.compose.config-hash": "94c96ffe440f64627a08f7c4606f82b87df0701abce59113822bfff9dc873c20",
    "com.docker.compose.container-number": "1",
    "com.docker.compose.depends_on": "",
    "com.docker.compose.image": "sha256:df6621d4edd4c69b01a4ed563728b92e53894383019295fc04254eac6e27480d",
    "com.docker.compose.oneoff": "False",
    "com.docker.compose.project": "tests-ora",
    "com.docker.compose.service": "service-test-oracle-db",
    "com.docker.compose.version": "2.32.4",
    "io.buildah.version": "1.35.2",
    "org.opencontainers.image.source": "https://github.com/gvenzl/oci-oracle-xe"
}
```
```shell
docker inspect local.service-test-oracle-db -f '{{index .Config.Labels "com.docker.compose.config-hash"}}'
docker inspect local.service-test-oracle-db -f '{{index .Config.Labels "org.opencontainers.image.source"}}'
```

---
 
## Получение свойства по индексу


```shell
docker inspect local.service-test-oracle-db -f '{{json .HostConfig.MaskedPaths }}'
```
```text
[
    "/proc/asound",
    "/proc/acpi",
    "/proc/kcore",
    "/proc/keys",
    "/proc/latency_stats",
    "/proc/timer_list",
    "/proc/timer_stats",
    "/proc/sched_debug",
    "/proc/scsi",
    "/sys/firmware",
    "/sys/devices/virtual/powercap"
]
```

* Ошибка 
```shell
docker inspect local.service-test-oracle-db -f '{{.HostConfig.MaskedPaths[0]}}' 
docker inspect local.service-test-oracle-db -f ' {{.HostConfig.MaskedPaths[0]}} '
```
template parsing error: template: :1: bad character U+005B '['

* @TODO: Исправляем

Работает
```shell
docker inspect local.service-test-oracle-db -f '{{json .}}'  | jq '.HostConfig.MaskedPaths[0]'
```
"/proc/asound"

Работает
```shell
docker inspect local.service-test-oracle-db -f '{{ $foundItem := index .HostConfig.MaskedPaths 0 }}{{ $foundItem}}'
```
/proc/asound

Работает 
```shell
docker inspect local.service-test-oracle-db -f '{{index .HostConfig.MaskedPaths 0}}'
```
/proc/asound

---

## Получение IP адреса для сервиса "service-test-oracle-db", который имеет ожидаемое имя контейнера "local.service-test-oracle-db"

Особенность данного запроса в экранировании недопустимого символа "-" в пути поиска

* Посмотрим что в блоке "Networks"
```shell
docker inspect local.service-test-oracle-db |grep  "\"Networks\":" -A 30
```
```text
"Networks": {
    "tests-ora_default": {
        "IPAMConfig": null,
        "Links": null,
        "Aliases": [
            "local.service-test-oracle-db",
            "service-test-oracle-db"
        ],
        "MacAddress": "02:42:ac:1a:00:02",
        "DriverOpts": null,
        "NetworkID": "72583069622d9460cda2bd6e2aed9f336b1c8e63a1e059f32a13bd02387b76a7",
        "EndpointID": "615510be4b73eb62eef3a364083365ba9a9f1d796f0923c4fa474e2d32b37f02",
        "Gateway": "172.26.0.1",
        "IPAddress": "172.26.0.2",
        "IPPrefixLen": 16,
        "IPv6Gateway": "",
        "GlobalIPv6Address": "",
        "GlobalIPv6PrefixLen": 0,
        "DNSNames": [
            "local.service-test-oracle-db",
            "service-test-oracle-db",
            "03460c6aa025"
        ]
    }
}
```
* Выкусим "IPAddress"
```shell
docker inspect local.service-test-oracle-db |grep  "\"Networks\":" -A 30 | grep "IPAddress"
````
```text
"IPAddress": "172.26.0.2",
```
* Рабочая команда поиска
```shell
docker inspect local.service-test-oracle-db -f '{{ $foundItem := index .NetworkSettings.Networks "tests-ora_default" }}{{ $foundItem.IPAddress}}'  
```

```shell
docker inspect local.service-test-oracle-db -f '{{index .HostConfig.MaskedPaths "tests-ora_default" }}'
```