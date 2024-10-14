enum AnimalEnum {
    CAT = 'cat',
    DOG = 'dog',
    BIRD = 'bird'
}

console.log('AnimalEnum', AnimalEnum);
console.log('typeof AnimalEnum', typeof AnimalEnum);
console.log('Object.keys(AnimalEnum)', Object.keys(AnimalEnum));
console.log('Object.values(AnimalEnum)', Object.values(AnimalEnum));
console.log('Object.values(AnimalEnum).indexOf(AnimalEnum.BIRD)', Object.values(AnimalEnum).indexOf(AnimalEnum.BIRD));
console.log('Object.values(AnimalEnum).includes(AnimalEnum.BIRD)', Object.values(AnimalEnum).includes(AnimalEnum.BIRD));


function isAnimalEnum(
    value: any
): value is AnimalEnum {
    let
        result: boolean = false,
        allowValues: string[] = Object.values(AnimalEnum)
    ;
    if (typeof value === 'string') {
        if (allowValues.includes(value)) {
            result = true;
        }
    }
    return result;
}


console.log('isAnimalEnum("cat")', isAnimalEnum("cat"));
console.log('isAnimalEnum(AnimalEnum.CAT)', isAnimalEnum(AnimalEnum.CAT));
console.log('isAnimalEnum("house")', isAnimalEnum("house"));

var
    randomAnimal =  Math.random() > 0.5 ? AnimalEnum.DOG : 'some-invalid-value'
;
console.log('isAnimalEnum(randomAnimal)', isAnimalEnum(randomAnimal),  randomAnimal);
