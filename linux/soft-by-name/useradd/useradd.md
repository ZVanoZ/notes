

```shell
man useradd &> useradd-man.txt
```

Утилита системная. Поэтому находится в "/usr/sbin" и не видна для обычных пользователей.
```shell
ls -la /usr/sbin/useradd
export PATH="$PATH:/usr/sbin"
```

```shell
type useradd &> useradd-type.txt
```
```shell
ls -la /usr/sbin/useradd
```

```shell
/usr/sbin/useradd --help &> useradd-help.txt
```

```shell
#/usr/sbin/useradd --version &> useradd-version.txt
# /usr/sbin/useradd: нераспознанный параметр «--version»
```
