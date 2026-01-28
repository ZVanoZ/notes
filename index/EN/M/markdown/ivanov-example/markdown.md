# GitHub-Flavored Markdown #
## Короткий посібник з GFM (GitHub-Flavored Markdown) ##

Абзаци створюються за допомогою порожнього рядка. Якщо навколо тексту зверху і знизу є порожні рядки, то текст перетворюється на абзац.  

Щоб зробити перенесення рядка замість абзацу,
потрібно поставити два пробіли в кінці попереднього рядка.

Заголовки позначаються знаком решітки # на початку рядка, від одного до шести. Наприклад:

# Заголовок першого рівня - h1 #
## Заголовок h2
### Заголовок h3
#### Заголовок h4
##### Заголовок h5
###### Заголовок h6

З декоративною метою заголовки можна «закривати» з тильної сторони.

### Списки

Для розмітки неупорядкованих списків можна використовувати або `*`, або `-`, або `+`:
- елемент 1
- елемент 2
- елемент ...

Вкладені пункти створюються за допомогою чотирьох пробілів перед маркером пункту:

- елемент 1
    - елемент 1.1
    - елемент 1.2
        - елемент 1.2.1
        - елемент 1.2.2
        - елемент 1.2.3
- елемент 2
- елемент ...

Упорядкований список
1. Елемент 1
2. Елемент 2
    1. Вкладений 2.1
    2. Вкладений 2.2
        1. Вкладений 2.2.1
3. Елемент 3
4. Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse id sem consectetuer libero luctus adipiscing.

Насправді неважливо, як пронумеровані пункти в коді, головне, щоб перед елементом списку стояла цифра (будь-яка) з крапкою. Можна зробити і так:
1. Елемент 1
1. Елемент 2
1. Елемент 3
1. Елемент 4

Список с абзацами:

* Раз абзац. Lorem ipsum dolor sit amet, consectetur adipisicing elit.

* Два абзац. Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse id sem consectetuer libero luctus adipiscing.

* Три абзац. Ea, quis, alias nobis porro quos laborum minus sed fuga odio dolore natus quas cum enim necessitatibus magni provident non saepe sequi?


    Чотири абзаци (Чотири пробіли на початку або один tab).

### Цитати
Цитати оформлюються як у електронних листах, за допомогою символу '>'.
> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
>
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.

Або більш лінивим способом, коли знак '>' ставиться перед кожним елементом цитати, будь то абзац, заголовок чи порожній рядок:

> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
>
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
id sem consectetuer libero luctus adipiscing.

В цитати можна поміщати все, що завгодно, включаючи вкладені цитати:

> ## This is a header.
>
> 1.   This is the first list item.
> 2.   This is the second list item.
>
> > Вкладена цитата.
>
> Here's some example code:
>
>     return shell_exec("echo $input | $markdown_script");

### Вихідний код
У чистому Markdown блоки коду відокремлюються 4 пробілами на початку кожного рядка.

Але в GitHub-Flavored Markdown (скорочено GFM) є більш зручний спосіб: ставимо три апострофи (на букві Ї) до і після коду. 
Також можна вказати мову вихідного коду.

```html
<nav class="nav nav-primary">
  <ul>
    <li class="tab-conversation active">
      <a href="#" data-role="post-count" class="publisher-nav-color" data-nav="conversation">
        <span class="comment-count">0 коментарів</span>
        <span class="comment-count-placeholder">Коментарі</span>
      </a>
    </li>
    <li class="dropdown user-menu" data-role="logout">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <span class="dropdown-toggle-wrapper">
          <span>
            Зайти
          </span>
        </span>
        <span class="caret"></span>
      </a>
    </li>
  </ul>
</nav>
```

Найприємніше те, що в коді не потрібно замінювати кутові дужки `< >` і амперсанд `&` на їх HTML-сутності.

### Вбудований код
Для вставки коду всередині речень потрібно поміщати цей код в апострофи (на букві Ї). Приклад: `<html class="ie no-js">.`

Якщо всередині коду є апостроф, то код потрібно обрамити подвійними апострофами: ``There is a literal backtick (`) here.``

### Горизонтальна лінія

`hr` створюється трьома зірочками або трьома дефісами.
***

---

### Посилання

Це вбудоване [посилання з елементом title](http://example.com/link "Я посилання"). 

Це — [без title](http://example.com/link).

Ось [приклад][1] [кількох][2] [посилань][id] з розміткою, як у виносок. 
Зійде і [короткий запис][] без зазначення id.

[1]: http://example.com/ "Optional Title Here"
[2]: http://example.com/some
[id]: http://example.com/links (Optional Title Here)
[короткий запис]: http://example.com/short

Винесення довгих URL-адрес із речення сприяє збереженню читабельності вихідного коду. Примітки можна розташовувати в будь-якому місці документа.

### Виділення

Виділяти слова можна за допомогою `*` та `_`. Один символ для курсивного тексту, два символи для жирного тексту, три — для одночасного курсивного і жирного тексту.

Наприклад, це _italic_ і це теж *italic*. А ось так вже __strong__, і так теж **strong**. А так ***жирний і курсивний*** одночасно.

### Зачеркування
У GFM додано зачеркування тексту: дві тильди `~` до і після тексту.

~~Зачеркнуто~~

### Картинки

Картинка без `alt` текста

![](placehold.it/150x100.png)

Картинка з `alt` текстом та тайтлом:

![Alt text](placehold.it/150x100.png "Можно задать title")

Запам'ятати просто: синтаксис як у посилань, тільки перед відкриваючою квадратною дужкою ставиться знак оклику.

Картинки «сноски»:

![Картинка][image1]
![Картинка][image2]
![Картинка][image3]

[image1]: placehold.it/250x100.png
[image2]: placehold.it/200x100.png
[image3]: placehold.it/150x100.png

Картинки-посилання:

[![Alt text](placehold.it/150x100.png)](http://example.com/)

### Використання HTML всередині Markdown
Можна змішувати Markdown і HTML. Якщо для якихось елементів потрібно додати класи або атрибути, сміливо використовуємо HTML:

>Виділяти слова можна за допомогою * і _ . Наприклад, це <em class="a1">italic</em> > і це також <i class="a1">italic</i>. А ось так вже <b>strong</b>, і так також <strong>strong</strong>.

Можна і навпаки, всередині HTML-тегів використовувати Markdown.

<section class="someclass">

### Приклад Markdown всередині HTML

Виділяти слова можна за допомогою `*` и `_` . Наприклад, це _italic_ і це теж 
*italic*. А ось так вже __strong__, і так теж **strong**.

</section>

### Таблиці
В чистому Markdown немає синтаксису для таблиць, а в GFM (GitHub Flavored Markdown) єсть.

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell

Для краси можна і по боках лінії намалювати:

| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

Можна керувати вирівнюванням стовпців за допомогою двокрапки.

| Left-Aligned  | Center Aligned  | Right Aligned |
|:------------- |:---------------:| -------------:|
| col 3 is      | some wordy text |     **$1600** |
| col 2 is      | centered        |         $12   |
| zebra stripes | are neat        |        ~~$1~~ |

Всередині таблиць можна використовувати посилання, курсивний, жирний або закреслений текст.

### Чек-листи
- [x] Задача 1
- [ ] Задача 2
- [ ] Задача 3

### HTML.

Markdown підтримує використання прямого HTML всередині документа, тому ви можете використовувати будь-які HTML-теги для більш складного оформлення:

<kbd>CTRL</kbd> + <kbd>P</kbd>

### HTML-коди

Ви можете використовувати HTML-код `&macr;` для додавання риски над буквою.

A&macr;

### Коментарі

Ви можете вставити коментарі у свій markdown-файл, які не будуть відображатися у кінцевому відформатованому вигляді:

[//]: # (Це коментар, він не буде відображатися.)

### Емодзі
Ви можете використовувати емодзі у своїх Markdown-файлах. Існує багато емодзі, 
які ви можете використовувати, ось деякі з них:https://gist.github.com/rxaviers/7360908

:smile:
:laughing:
:boom:

### Зворотні косі риски (backslash)
Markdown надає можливість використовувати зворотні косі риски (backslash) для екранування наступних символів:

\  backslash(зворотний слеш)

`   backtick(зворотна коса риска)

*   asterisk(зірочка)

_   underscore(підкреслення)

{}  curly braces(фігурні дужки)

[]  square brackets(квадратні дужки)

()  parentheses(круглі дужки)

#   hash mark(решітка)

+   plus sign(знак плюс)

-   minus sign (hyphen)/знак мінус (дефіс)

.   dot(крапка)

!   exclamation mark(знак оклику)

