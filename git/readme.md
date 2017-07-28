# Заметки по использованию git

## Залить локальный master в master на github.

Связываем локальный репозитарий с внешним.
$git remote add origin https://github.com/ZVanoZ/notes.git

Выгружаем локальные изменения на внешний репозитарий.
$git push -u origin master

## Свалка

Отображает изменения в локальной копии
$git status

Помечает на удаление директорию "sander"
$git rm -r sander

git add PHP/readme.md
git commit -m "Реорганизация песочницы"
$git checkout

## github

…or create a new repository on the command line

echo "# notes" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/ZVanoZ/notes.git
git push -u origin master

…or push an existing repository from the command line

git remote add origin https://github.com/ZVanoZ/notes.git
git push -u origin master

…or import code from another repository
You can initialize this repository with code from a Subversion, Mercurial, or TFS project.
@{link https://github.com/ZVanoZ/notes/import}
