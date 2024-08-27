console.log("\n" + 'Date()' + "\n", Date()); // Fri Aug 23 2024 10:08:25 GMT+0300 (Восточная Европа, летнее время)
console.log("\n" + 'Date() instanceof Date' + "\n", Date() instanceof Date); // false
console.log("\n" + 'typeof Date()' + "\n", typeof Date()); // string

console.log("\n" + 'new Date()' + "\n", new Date());
console.log("\n" + 'new Date() instanceof Date' + "\n", new Date() instanceof Date);
console.log("\n" + 'typeof new Date()' + "\n", typeof new Date());

console.log("\n" + 'Date.now()' + "\n", Date.now());
console.log("\n" + 'new Date().toUTCString()' + "\n", new Date().toUTCString());
console.log("\n" + 'new Date().toISOString()' + "\n", new Date().toISOString());

console.log("\n" + 'Date().toLocaleString("UTC")' + "\n", Date().toLocaleString("UTC"));

// Fri Aug 23 2024 10:09:33 GMT+0300 (Восточная Европа, летнее время)
console.log(
	"\n" + '!!! new Date().toString() не поддерживает параметры формата !!!' +
	"\n" + 'new Date().toString("Y-m-d H:i:s")' + "\n",
	new Date().toString("Y-m-d H:i:s")
);


(
	// Выведет дату в формате, соответствующем российским локалям
	() => {
		const options = {
			year: 'numeric',
			month: '2-digit',
			day: '2-digit',
			hour: '2-digit',
			minute: '2-digit',
			second: '2-digit'
		};
		const formattedDate = new
		Date().toLocaleDateString('ru-RU', options);
		console.log("\n" + 'Date().toLocaleDateString ... options' + "\n", formattedDate);
	}
)()

