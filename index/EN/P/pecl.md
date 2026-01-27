# О чем речь

pecl - утилита для сборки и установки расширений PHP.

## Help

```shell
pecl help
```

```text
Commands:
build                  Build an Extension From C Source
bundle                 Unpacks a Pecl Package
channel-add            Add a Channel
channel-alias          Specify an alias to a channel name
channel-delete         Remove a Channel From the List
channel-discover       Initialize a Channel from its server
channel-info           Retrieve Information on a Channel
channel-login          Connects and authenticates to remote channel server
channel-logout         Logs out from the remote channel server
channel-update         Update an Existing Channel
clear-cache            Clear Web Services Cache
config-create          Create a Default configuration file
config-get             Show One Setting
config-help            Show Information About Setting
config-set             Change Setting
config-show            Show All Settings
convert                Convert a package.xml 1.0 to package.xml 2.0 format
cvsdiff                Run a "cvs diff" for all files in a package
cvstag                 Set CVS Release Tag
download               Download Package
download-all           Downloads each available package from the default channel
info                   Display information about a package
install                Install Package
list                   List Installed Packages In The Default Channel
list-all               List All Packages
list-channels          List Available Channels
list-files             List Files In Installed Package
list-upgrades          List Available Upgrades
login                  Connects and authenticates to remote server [Deprecated in favor of channel-login]
logout                 Logs out from the remote server [Deprecated in favor of channel-logout]
makerpm                Builds an RPM spec file from a PEAR package
package                Build Package
package-dependencies   Show package dependencies
package-validate       Validate Package Consistency
pickle                 Build PECL Package
remote-info            Information About Remote Packages
remote-list            List Remote Packages
run-scripts            Run Post-Install Scripts bundled with a package
run-tests              Run Regression Tests
search                 Search remote package database
shell-test             Shell Script Test
sign                   Sign a package distribution file
svntag                 Set SVN Release Tag
uninstall              Un-install Package
update-channels        Update the Channel List
upgrade                Upgrade Package
upgrade-all            Upgrade All Packages [Deprecated in favor of calling upgrade with no parameters]
Usage: pecl [options] command [command-options] <parameters>
Type "pecl help options" to list all options.
Type "pecl help shortcuts" to list all command shortcuts.
Type "pecl help version" or "pecl version" to list version information.
Type "pecl help <command>" to get the help for the specified command.
```

## pecl install

```shell
pecl install https://pecl.php.net/get/dbx-1.1.2.tgz
```

## pecl list

```shell
pecl list
```
```text
Installed packages, channel pecl.php.net:
=========================================
Package Version State
dbx     1.1.2   stable
jsonc   1.3.10  stable
oci8    1.4.10  stable
zip     1.22.3  stable
```

## pecl list-all

```shell
pecl list-all                       
```
```text
WARNING: channel "pecl.php.net" has updated its protocols, use "pecl channel-update pecl.php.net" to update
All packages [Channel pecl.php.net]:
====================================
Package                   Latest     Local
pecl/ahocorasick          0.0.7             Effective Aho-Corasick string pattern matching algorithm
pecl/amfext               0.9.2             ActionScript Message Format extension
pecl/AOP                  0.2.2b1           Aspect Oriented Programming On PHP
pecl/ApacheAccessor       1.0.1             simple API to Apache runtime configuration
...
pecl/xdebug               3.3.2             Xdebug is a debugging and productivity extension for PHP
...
```

## pecl list-channels

```shell
pecl list-channels
````
```text
 Registered Channels:
====================
Channel      Alias   Summary
doc.php.net  phpdocs PHP Documentation Team
pear.php.net pear    PHP Extension and Application
                     Repository
pecl.php.net pecl    PHP Extension Community Library
__uri        __uri   Pseudo-channel for static packages
``` 

## pecl list-files

```shell
pecl list-files oci8 | grep "/.*\.so"
```
```text
ext  /usr/lib64/php/modules/oci8.so
```

## pecl remote-info

```shell
pecl remote-info pdo_oci
```
```text
WARNING: channel "pecl.php.net" has updated its protocols, use "pecl channel-update pecl.php.net" to update
Package details:
================
Latest      1.1.0
Installed   - no -
Package     PDO_OCI
License     PHP
Category    Database
Summary     Extension for Oracle Database
Description The PDO_OCI extension lets you access Oracle
            Database.
...
```


## pecl uninstall

```shell
pecl uninstall dbx
```
```text
Unable to remove "extension=dbx.so" from php.ini
uninstall ok: channel://pecl.php.net/dbx-1.1.2
```