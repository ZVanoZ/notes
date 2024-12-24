function printMessage(msg) {
	console.log(new Date().toISOString(), msg);
}

async function f() {
	printMessage('f()');
	let promise = new Promise(
		(resolve, reject) => {
			printMessage('Promise/setTimeout...');
			let
				cnr = 0
			;
			const
				interval = setInterval(
					() => {
						++cnr;
						printMessage('interval/cnr: ' + cnr);
						if (cnr > 3) {
							clearInterval(interval);
							resolve("Done!");
						}
					}
					, 1000);
		}
	).then(
		(result) => {
			printMessage('Promise/result');
			return result
		}
	);

	printMessage('await promise/before');
	let result = await promise; // будет ждать, пока промис не выполнится
	printMessage('await promise/after <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');

	printMessage('result: ' + result); // result: Done!
	return result;
}

printMessage('f()/before');
f().then(
	()=>{
		printMessage('f()/then');
	}
);
printMessage('f()/after ?????????????????????');
