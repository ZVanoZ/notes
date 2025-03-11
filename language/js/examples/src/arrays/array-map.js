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
];


console.log('test-1-phones', phones);
let res = phones.map(
    (
        phone,
        index
    ) => {
        //let res = phone; // Так нельзя, ибо phone ссылочного типа. Получим мутацию.
        //let res = Object.create({}, phone);

        let res1 = Object.assign({}, phone);
        res1.index = index;

        let res2 = {...phone};
        res2.index = index;
        return {
            'use Object.assign': res1,
            'use destructurization': res2,
            'ref origin-value': phone
        };
    }
);
console.log('test-1-res', res);
console.log('test-1-phones', phones);
