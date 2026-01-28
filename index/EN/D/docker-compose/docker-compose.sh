#!/usr/bin/env bash
#------------------------------------------------------------------------------
#переход в директорию текущего скрипта
cd $(dirname $(readlink -e $0)) 
#------------------------------------------------------------------------------
# Задача:
# Есть два "docker-compose.yaml", которые описывают две группы сервисов.
# Необходимо сделать так, чтобы все сервисы видели друг друга по сети
# Решение:
# Нужно в обоих файлах "docker-compose.yaml" использовать сеть с одинаковым именем
# Доступно в версии >= "3.5"
#-----

# web-services/docker-compose.yaml
version: '3.5'

networks:
  default:
    name: test-redis-network
    driver:  bridge

services:
  web-service1:
    ...
  web-service2
    ...

#------------------------------------------------------------------------------

# redis-services/docker-compose.yaml
version: '3.5'

networks:
  default:
    name: test-redis-network
    driver:  bridge

services:
  redis-node1:
    ...
  redis-node2:
    ...
    
#------------------------------------------------------------------------------
