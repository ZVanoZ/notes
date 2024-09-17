var _a, _b, _c, _d;
var nullValue = null, undefinedValue = undefined, objValue1 = {
    intValue: 123,
    stringValue: 'Hello, World!',
    nullValue: null,
    undefinedValue: undefined,
}, objValue2 = {
    intValue: 13,
    stringValue: 'Piter',
    nullValue: null,
    undefinedValue: undefined,
    innerObj: undefined
}, objValue3 = {
    intValue: 13,
    stringValue: 'Piter',
    nullValue: null,
    undefinedValue: undefined,
    innerObj: objValue1
};
console.log('objValue1', objValue1);
console.log('objValue2', objValue2);
console.log('objValue3', objValue3);
console.log('objValue1.objValue1?.intValueNullable', objValue1.intValueNullable); // undefined
//console.log('objValue1.objValue1?.intValueNullable * 2', objValue1.intValueNullable * 2); // error TS18048: 'objValue1.intValueNullable' is possibly 'undefined'.
console.log('objValue1.objValue1.intValueNullable!  * 2', objValue1.intValueNullable * 2); // NaN // TSC пропустил возможную ошибку не установленного значения
console.log('objValue1.objValue1?.intValueNullable!', objValue1 === null || objValue1 === void 0 ? void 0 : objValue1.intValueNullable); // undefined
console.log('objValue1.innerObj', objValue1.innerObj); // undefined
// console.log('objValue1.innerObj.intValue', objValue1.innerObj.intValue);                     // error TS18048: 'objValue1.innerObj' is possibly 'undefined'.
console.log('objValue3.innerObj?.intValue', (_a = objValue3.innerObj) === null || _a === void 0 ? void 0 : _a.intValue); // 123
console.log('objValue1.innerObj?.intValue', (_b = objValue1.innerObj) === null || _b === void 0 ? void 0 : _b.intValue); // undefined // TSC пропустил проверку innerObj на undefined
console.log('objValue1.innerObj?.innerObj?.intValue', (_d = (_c = objValue1.innerObj) === null || _c === void 0 ? void 0 : _c.innerObj) === null || _d === void 0 ? void 0 : _d.intValue); // undefined // Таким образом без ошибок можно создать цепочку операторов
