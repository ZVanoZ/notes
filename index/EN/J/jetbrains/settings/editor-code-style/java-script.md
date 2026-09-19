# Настройка форматирования JavaScript в [PhpStorm; WebStorm]

## Как игнорировать форматирование для всего вайла или его фрагмента?

Использовать вставку `// @formatter:off` и `// @formatter:on` 

```js
// @formatter:off
// С этой строки форматирование отключено
const
	config = {
		items: [
			{
				//...
			},
			{
				//...
			},
		],
	}
;
// @formatter:on
// С этой строки форматирование включено
// testing...
const config = {
		items: [ {
//..
		}, {
//...
		} ]
	}
;
```