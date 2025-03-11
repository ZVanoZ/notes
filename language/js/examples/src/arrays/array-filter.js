const phones = [
    {
        company: "Nokia",
        manufactured: new Date("2022-09-01"),
    },
    {
        company: "Samsung",
        manufactured: new Date("2021-11-05"),
    },
    {
        company: "Apple",
        manufactured: new Date("2022-05-24T12:00:00"),
    },
    {
        company: "NoName",
        manufactured: new Date("2023-01-31T23:59:59"),
    },
];

/**
 * Оставляет только четные элементы
 *
 * Внимание! Метод filter для подвержен мутации данных.
 * Для ссылочных элементов он копирует в новый массив ссылку, а не копию.
 */
console.log('test-1-phones', phones);
let res = phones.filter(
    (
        phone,
        index
    ) => {
        const isAppend = index % 2 === 0;

        // phone.isAppend = isAppend; // Мутация! Так нельзя потому что phone меняется по ссылке.

        console.log('test-2-iteration', index, isAppend ? 'ADD :' : 'SKIP:', phone);
        return isAppend;
    }
);
console.log('test-1-res', res);
console.log('test-1-phones', phones);
