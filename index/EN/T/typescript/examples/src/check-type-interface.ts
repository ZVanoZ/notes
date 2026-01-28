interface AnimalI {
    fieldOfAnimalI: string;
}

// console.log('AnimalI', AnimalI);               // error TS2693: 'AnimalI' only refers to a type, but is being used as a value here.
// console.log('typeof AnimalI', typeof AnimalI); // error TS2693: 'AnimalI' only refers to a type, but is being used as a value here.

class Animal
    implements AnimalI //
{
    fieldOfAnimalI: string = 'field-of-animal-interface';
}

console.log('Animal', Animal);               // Animal [class Animal]
console.log('typeof Animal', typeof Animal); // typeof Animal function


interface DogI //
    extends AnimalI //
{
    fieldOfDogI: string;
}

class Dog
    extends Animal //
    implements DogI //
{
    fieldOfDogI: string = 'field-of-dog-interface';
}

var
    isDog = Math.random() > 0.5,
    animal = (
        () => {
            let
                result: AnimalI
            ;
            if (isDog) {
                result = new Dog();
            } else {
                result = new Animal();
            }
            return result;
        }
    )()
;

console.log('isDog', isDog);
console.log('animal instanceof Animal', animal instanceof Animal);
console.log('animal instanceof Dog', animal instanceof Dog);


function isAnimalI(
    value: any
): value is AnimalI {
    const result: boolean = typeof value === 'object' && 'fieldOfAnimalI' in value;
    return result;
}

function isDogI(
    value: any
): value is DogI {
    const result: boolean = typeof value === 'object' && 'fieldOfDogI' in value;
    return result;
}

//console.log('animal instanceof AnimalI',  animal instanceof AnimalI); //  error TS2693: 'AnimalI' only refers to a type, but is being used as a value here.
console.log('isAnimalI(animal)', isAnimalI(animal));
if (isAnimalI(animal)) {
    console.log('isAnimalI(animal)', 'animal.fieldOfAnimalI', animal.fieldOfAnimalI);
}

console.log('isDogI(animal)', isDogI(animal));
if (isDogI(animal)) {
    console.log('isDogI(animal)', 'animal.fieldOfAnimalI', animal.fieldOfAnimalI);
    console.log('isDogI(animal)', 'animal.fieldOfDogI', animal.fieldOfDogI);
}