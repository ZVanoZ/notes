# "test"

[test-help.txt](test-help.txt)

## Системная информация 

* Информация о команде 
````shell
type test        &> test-type.txt
#test --help      &> test-help.txt
#test --version   &> test-version.txt
man test         &> test-man.txt
````

* Информация об установке
````shell
#sudo dpkg -i test     &> test-dpkg-i.txt
#dpkg --status test    &> test-dpkg-status.txt
#apt info test         &> test-apt-info.txt
````
