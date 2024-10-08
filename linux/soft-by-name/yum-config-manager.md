# yum-config-manager 

yum-config-manager: Это утилита, которая используется для управления репозиториями программного 
обеспечения в системах на базе RPM, таких как CentOS, RHEL и Fedora. Она позволяет добавлять, 
удалять и включать/отключать различные репозитории.


## Help

````shell
yum-config-manager --help
````
````text
Loaded plugins: fastestmirror, ovl
Usage: yum-config-manager [options] [section ...]

Options:
  Plugin Options:

  Yum Base Options:
    -h, --help          show this help message and exit
    -t, --tolerant      be tolerant of errors
    -C, --cacheonly     run entirely from system cache, don't update cache
    -c [config file], --config=[config file]
                        config file location
    -R [minutes], --randomwait=[minutes]
                        maximum command wait time
    -d [debug level], --debuglevel=[debug level]
                        debugging output level
    --showduplicates    show duplicates, in repos, in list/search commands
    -e [error level], --errorlevel=[error level]
                        error output level
    --rpmverbosity=[debug level name]
                        debugging output level for rpm
    -q, --quiet         quiet operation
    -v, --verbose       verbose operation
    -y, --assumeyes     answer yes for all questions
    --assumeno          answer no for all questions
    --version           show Yum version and exit
    --installroot=[path]
                        set install root
    --enablerepo=[repo]
                        enable one or more repositories (wildcards allowed)
    --disablerepo=[repo]
                        disable one or more repositories (wildcards allowed)
    -x [package], --exclude=[package]
                        exclude package(s) by name or glob
    --disableexcludes=[repo]
                        disable exclude from main, for a repo or for
                        everything
    --disableincludes=[repo]
                        disable includepkgs for a repo or for everything
    --obsoletes         enable obsoletes processing during updates
    --noplugins         disable Yum plugins
    --nogpgcheck        disable gpg signature checking
    --disableplugin=[plugin]
                        disable plugins by name
    --enableplugin=[plugin]
                        enable plugins by name
    --skip-broken       skip packages with depsolving problems
    --color=COLOR       control whether color is used
    --releasever=RELEASEVER
                        set value of $releasever in yum config and repo files
    --downloadonly      don't update, just download
    --downloaddir=DLDIR
                        specifies an alternate directory to store packages
    --setopt=SETOPTS    set arbitrary config and repo options
    --bugfix            Include bugfix relevant packages, in updates
    --security          Include security relevant packages, in updates
    --advisory=ADVS, --advisories=ADVS
                        Include packages needed to fix the given advisory, in
                        updates
    --bzs=BZS           Include packages needed to fix the given BZ, in
                        updates
    --cves=CVES         Include packages needed to fix the given CVE, in
                        updates
    --sec-severity=SEVS, --secseverity=SEVS
                        Include security relevant packages matching the
                        severity, in updates

  yum-config-manager options:
    --save              save the current options (useful with --setopt)
    --enable            enable the specified repos (automatically saves)
    --disable           disable the specified repos (automatically saves)
    --add-repo=ADDREPO  add (and enable) the repo from the specified file or
                        url

````


* Включить репозиторий Remi для PHP 5.6:
````shell
yum-config-manager --enable remi-php56
````
После выполнения этой команды, система будет искать доступные обновления и пакеты из 
репозитория Remi, в частности, связанные с PHP версии 5.6.