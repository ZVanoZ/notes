## Простые типы данных



## Generics (Обобщения)

RU [Обобщения в TypeScript](https://scriptdev.ru/guide/032/#typescript)  
EN [Generic Functions](https://www.typescriptlang.org/docs/handbook/2/functions.html#generic-functions)

При описании функций, методов классов, методов интерфейсов вместо типов можно указать подстановочное значение.
Таким образом при использовании этих сущностей будут действовать ограничения по типу данных. 

* Обобщения с функциями  
Объявление
````typescript
function getErrorMessage<T>(
    err: T
): string {
    // ...
    return 'some-string';
}
````
Использование
````typescript
console.log(getErrorMessage(123));                           // Вместо "T" компилятор подставит Nu
console.log(getErrorMessage(new Error('test error class'))); // 
````

* Обобщения с интерфейсами
````typescript
interface ILog {
    getErrorMessage<T>(err: T): string;
}
````
Классическое объявление метода с указанием типов
````typescript
const
    log: ILog = {
        getErrorMessage: function <T>(
            err: T
        ): string {
            //return 1;// Так нельзя - TSC error
            return 'some-string';
        },
    }
````
Сокращенное объявление. Типы в угловых скобках не указываем, но прри этом ограничения интерфейса работают.
````typescript
const
    log: ILog = {
        getErrorMessage: function(
            err
        ) {
            //return 1;// Так нельзя - TSC error
            return 'some-string';
        }

    }
````