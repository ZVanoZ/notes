const helper = {
	digitalSign: {}
}
helper.digitalSign.init = async function () {
	console.log(new Date().toISOString(), 'helper.digitalSign.init')
	const initPromise = new Promise(
		(resolve, reject) => {
			console.log(new Date().toISOString(), 'helper.digitalSign.init/promise-start');
			setTimeout(() => {
				console.log(new Date().toISOString(), 'helper.digitalSign.init/promise-timeout-handle');
				return resolve('result-is-' + new Date().toISOString());
			}, 1000)
		}
	);
	const res = await initPromise;

	console.log(new Date().toISOString(), 'helper.digitalSign.init/return', res);
	return res;
}

//--------
//-- На верхнем уровне скрипта запрещено вызывать функции через await
//-- Иначе это блокировало бы основной поток приложения
//-----
// console.log(new Date().toISOString(), 'demo-invalid-run/beg');
// await helper.digitalSign.init(); // SyntaxError: await is only valid in async functions and the top level bodies of modules
// console.log(new Date().toISOString(), 'demo-invalid-run/end');

console.log(new Date().toISOString(), 'async-anonymous/beg', '<<<<<<<<< ROOT PLACE');
(
	async () => {
		console.log(new Date().toISOString(), 'await-run/beg');
		const res = await helper.digitalSign.init();
		console.log(new Date().toISOString(), 'await-run/end', res);
	}
)();
console.log(new Date().toISOString(), 'async-anonymous/end', '<<<<<<<<< ROOT PLACE');
