type AnimalUnion = 'cat' | 'dog' | 'bird';

// console.log('AnimalUnion', AnimalUnion);               // error TS2693: 'AnimalUnion' only refers to a type, but is being used as a value here.
// console.log('typeof AnimalUnion', typeof AnimalUnion); // error TS2693: 'AnimalUnion' only refers to a type, but is being used as a value here.

function isAnimalUnion(
    value: any
): value is AnimalUnion {
    const result: boolean = typeof value === 'string' //
        && ['cat', 'dog', 'bird'].indexOf(value) >= 0
    ;
    return result;
}

console.log('isAnimalUnion("cat")', isAnimalUnion("cat"));
console.log('isAnimalUnion("house")', isAnimalUnion("house"));
console.log('isAnimalUnion(true)', isAnimalUnion(true));

var
    isUnion = Math.random() > 0.5,
    randomAnimal = isUnion ? 'cat' : 'house'
;
console.log('isAnimalUnion(randomAnimal)', isAnimalUnion(randomAnimal),  randomAnimal);
