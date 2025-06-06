class Person {
	constructor(name, age) {
		this.name = name;
		this.age = age;
	}

	async greetAsync() {
		console.log(new Date().toISOString(), 'greetAsync/beg');
		const res = await this.getGreeting();
		console.log(new Date().toISOString(), `greetAsync/end/res=${res}`);
		return res;
	}

	async getGreeting() {
		// Симуляция асинхронной операции
		const res = await new Promise(resolve => {
			setTimeout(() => {
				resolve(`Привет, меня зовут ${this.name}!`);
			}, 1000);
		});
		return res;
	}

	static createPerson(name, age) {
		return new Person(name, age);
	}
}

const person = Person.createPerson('Иван', 30);

//--------
//-- На верхнем уровне скрипта запрещено вызывать функции через await
//-- Иначе это блокировало бы основной поток приложения
//-----
// console.log(new Date().toISOString(), 'person.greetAsync()/beg');
// await person.greetAsync(); // SyntaxError: await is only valid in async functions and the top level bodies of modules
// console.log(new Date().toISOString(), 'person.greetAsync()/end');


console.log(new Date().toISOString(), 'async-anonymous/beg', '<<<<<<<<< ROOT PLACE');
(
	async () => {
		console.log(new Date().toISOString(), 'person.greetAsync()/beg');
		const res = await person.greetAsync(); // Выводит "Привет, меня зовут Иван!" через 1 секунду
		console.log(new Date().toISOString(), `person.greetAsync()/end/res=${res}`);
	}
)();
console.log(new Date().toISOString(), 'async-anonymous/end', '<<<<<<<<< ROOT PLACE');
