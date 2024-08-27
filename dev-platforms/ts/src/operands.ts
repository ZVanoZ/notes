/**
 * variable!     - "!"  значение "variable" может отсутствовать
 * obj?.field    - "?." "field" может отсутствовать
 **/
var
    nullValue = null,
    undefinedValue = undefined
;

console.log('nullValue', nullValue);           // null
console.log('undefinedValue', undefinedValue); // undefined

//console.log('nullValue * 2', nullValue * 2);           // error TS18047: 'nullValue' is possibly 'null'.
console.log('nullValue! * 2', nullValue! * 2);           // 0
console.log('undefinedValue! * 2', undefinedValue! * 2); // NaN

interface objValueInterface {
    intValue: number;
    intValueNullable?: number;
    stringValue: string;
    stringValueNullable?: string;
    nullValue?: null;
    undefinedValue: undefined;
    innerObj?: objValueInterface;
}

var
    objValue1: objValueInterface = {
        intValue: 123,
        stringValue: 'Hello, World!',
        nullValue: null,
        undefinedValue: undefined,
    },
    objValue2: objValueInterface = {
        intValue: 13,
        stringValue: 'Piter',
        nullValue: null,
        undefinedValue: undefined,
        innerObj: undefined
    },
    objValue3: objValueInterface = {
        intValue: 13,
        stringValue: 'Piter',
        nullValue: null,
        undefinedValue: undefined,
        innerObj: objValue1
    }
;

console.log('objValue1', objValue1);
console.log('objValue2', objValue2);
console.log('objValue3', objValue3);

console.log('objValue1.objValue1?.intValueNullable', objValue1.intValueNullable);           // undefined
//console.log('objValue1.objValue1?.intValueNullable * 2', objValue1.intValueNullable * 2); // error TS18048: 'objValue1.intValueNullable' is possibly 'undefined'.
console.log('objValue1.objValue1.intValueNullable!  * 2', objValue1.intValueNullable! * 2); // NaN // TSC пропустил возможную ошибку не установленного значения
console.log('objValue1.objValue1?.intValueNullable!', objValue1?.intValueNullable!);        // undefined

console.log('objValue1.innerObj', objValue1.innerObj);                                          // undefined
// console.log('objValue1.innerObj.intValue', objValue1.innerObj.intValue);                     // error TS18048: 'objValue1.innerObj' is possibly 'undefined'.
console.log('objValue3.innerObj?.intValue', objValue3.innerObj?.intValue);                      // 123
console.log('objValue1.innerObj?.intValue', objValue1.innerObj?.intValue);                      // undefined // TSC пропустил проверку innerObj на undefined
console.log('objValue1.innerObj?.innerObj?.intValue', objValue1.innerObj?.innerObj?.intValue);  // undefined // Таким образом без ошибок можно создать цепочку операторов
