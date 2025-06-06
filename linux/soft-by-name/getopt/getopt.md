# getopt

getopt - команда для разбора опций (GNU getopt)

Имеется две схожие программы – getopt и getopts.

У getopt есть несколько недостатков, основная – getopts внесена в стандарт POSIX для sh, тогда как getopt может быть вообще не установлена в системе.

getopt имеет встроенный механизм обработки --longoption, вместо коротких опций типа -a. Однако – к использованию рекомендуется именно getopts

# links

* https://pubs.opengroup.org/onlinepubs/9699919799/POSIX  
  "getopt, optarg, opterr, optind, optopt - command option parsing"


# cmd

```shell
man getopt &>getopt-man.txt
```

```shell
getopt --help &>getopt-help.txt
```

```shell
getopt --version  &>getopt-version.txt
```

-- Встроенные примеры linux

```shell
ls -la /usr/share/doc/util-linux/examples/
```

```shell
cat /usr/share/doc/util-linux/examples/getopt-example.bash
```

-- Адаптация встроенного примера linux

```shell
cp /usr/share/doc/util-linux/examples/getopt-example.bash ./demos/
```
```shell
bash ./demos/getopt-example.bash -a par1 'another arg' --c-long 'wow!*\?' -cmore -b " very long "
```

-- Собственный пример
@TODO: закончить

```shell
bash ./demos/getopt-1.bash --my-long-arg1 my-long-arg1-val
```