# regexp.md

Заметки по регулярным выражениям

* [Шпаргалка по регулярным выражениям](https://coddy.tech/cheat-sheets/ru/regex)
* [Опережающие и ретроспективные проверки в регулярных выражениях](https://habr.com/ru/articles/159483/)

---

## Опережающие и ретроспективные проверки

```text
(?=abc)	Опережающая проверка: за ним следует abc
(?!abc)	Негативная опережающая: за ним не следует abc
(?<=abc)	Ретроспективная проверка: ему предшествует abc
(?<!abc)	Негативная ретроспективная: ему не предшествует abc
\d+(?= dollars)	Цифры, только если за ними следует dollars
(?<=\$)\d+	Цифры, только если им предшествует $
```

---

* **Негативная ретроспективная: тексту не предшествует "@"**

https://regex101.com/r/Ko2WQD/1


```regexp
(?<!@)editable
```

```text
-- text false:
@editable

-- text true:
@ editable
```

---

* **Негативная опережающая: за текстом не следует '[a-zA-Z0-9_]'**

```regexp
Db_Main_Pkg1_Api1(?![a-zA-Z0-9_])
```

```text
Db_Main_Pkg1_Api1
class Db_Main_Pkg1_Api1 extends
new Db_Main_Pkg1_Api1(
Db_Main_Pkg1_Api1::key1
```

## Разное

---

* Проверить соответствие URL "/journal*"

https://regex101.com/r/b8ELvT/1

```regexp
\/journal((\?{1}.*)|($))
```

```text
/journal
/journal?
/journal?aaa=bbb
```
