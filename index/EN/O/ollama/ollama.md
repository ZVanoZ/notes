# "ollama"

Программа, которая позволяет развернуть сервер AI у себя на компьютере.

По умолчанию открывает порт 11434.

## Ресурсы

* Репо с моделями
https://ollama.com/library


## Docker

* Запуск через Docker в режиме сервиса с перезагрузкой при сбоях
```shell
docker run -d \
  -v ollama:/root/.ollama \
  -p 11434:11434 \
  --name ollama \
  --restart always \
  ollama/ollama
```

* Запуск через Docker в режиме сервиса БЕЗ перезагрузки при сбое
```shell
docker run -d \
    -v ./ollama:/root/.ollama \
    -p 11434:11434 \
    --name ollama \
    ollama/ollama
```

## Консольные команды 

* Помощь по команде
```shell
ollama -h
```
```text
Large language model runner

Usage:
  ollama [flags]
  ollama [command]

Available Commands:
  serve       Start Ollama
  create      Create a model
  show        Show information for a model
  run         Run a model
  stop        Stop a running model
  pull        Pull a model from a registry
  push        Push a model to a registry
  signin      Sign in to ollama.com
  signout     Sign out from ollama.com
  list        List models
  ps          List running models
  cp          Copy a model
  rm          Remove a model
  launch      Launch the Ollama menu or an integration
  help        Help about any command

Flags:
  -h, --help         help for ollama
      --nowordwrap   Don't wrap words to the next line automatically
      --verbose      Show timings for response
  -v, --version      Show version information

Use "ollama [command] --help" for more information about a command.
```

* Стянуть модель с репозитария на свой компьютер
```shell
ollama pull qwen3:14b
```

* Вывести информацию о скачанной модели (для той, что в репе, не работает - нужно стянуть).
```shell
ollama show qwen3:14b
```