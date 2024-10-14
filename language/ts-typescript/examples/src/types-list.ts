//-----------------------------------------------------------------------------
// Вспомогательный код, который понадобится для демонстрации
//-----
function actionNever(): never {
    //return never;
    throw new Error();
}
function actionVoid(): void {
}
function actionT<T>(data:T):T {
    return data;
}
function actionT2<T>() {
}

class TypeSystem {
    static any: any = actionT(1); // Ok
    static number: number = actionT(1); // Ok
    static string: string = actionT('1'); // Ok
    static boolean: boolean = actionT(true); // Ok
    static null: null = actionT(null); // Ok
    static undefined: undefined = actionT(undefined); // Ok
    static void: void = actionVoid(); // Ok
    static never: never; // Ok
}

console.log('TypeSystem', TypeSystem);

//-----------------------------------------------------------------------------
// Базовые примитивные типы данных
//-----
let
    valBool: boolean = true,              // Boolean примитивный логический тип
    valStr: string = '',                  // String примитивный строковый тип
    valNum1: number = 123,                // Number примитивный числовой тип. Для целых и дробных чисел.
    valNum2: number = 123.45,
    valNum3: Number = Number(123),
    valBigInt1: bigint,                   // BigInt примитивный числовой тип
    valBigInt2: bigint = BigInt(Number.MAX_VALUE) + BigInt(Number.MAX_VALUE),
    valSymbol1: symbol,                   // Symbol примитивный символьный тип
    valSymbol2: Symbol = Symbol(`ABC`)
;

//-----------------------------------------------------------------------------
// Специальные примитивные типы данных
//-----
let
    valAny: any,
    valNull: null,
    valUndefined: undefined,
    valVoid: void,             // Void отсутствие конкретного типа
    valNever: never,           // Примитивный типа данных Never служит для указания того, что
                               // какие-либо операции никогда не будут выполнены.
    valUnknown: unknown
;

valAny = true;
valAny = 'Hello';
valAny = 123;

valNull = null;

valUndefined = undefined;
// valUndefined = null; // Нельзя

// valVoid = void;              // Error. Переменным типа void нельзя присвоить значение void.
valVoid = TypeSystem.void;      // Ok.
valVoid = TypeSystem.any;       // Ok.
//valVoid = TypeSystem.null;    // Error
valVoid = undefined;            // Ok.
valVoid = TypeSystem.undefined; // Ok.

valNever = TypeSystem.never;

//-----------------------------------------------------------------------------
// Структуры
//-----


