
Утилита системная. Поэтому находится в "/usr/sbin" и не видна для обычных пользователей. 
```shell
ls -la /usr/sbin/usermod
export PATH="$PATH:/usr/sbin"
```

```shell
man usermod &> usermod-man.txt
```

```shell
/usr/sbin/usermod --help &> usermod-help.txt
```

```shell
# /usr/sbin/usermod --version &>usermod-version.txt
```