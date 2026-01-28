// @TODO: доделать пример разобравшись с использованием await в связке с exec

const util = require('node:util');
const exec = util.promisify(require('node:child_process').exec);

// const {exec} = require('node:child_process')

// console.log('process.env', process.env);

// async function lsExample() {
// 	const {stdout, stderr} = await exec('ls');
//
// 	console.log('stdout:', stdout);
// 	console.error('stderr:', stderr);
// // 	console.log({
// // 		// 'cmdText' : cmdText,
// // 		'stdout': stdout,
// // 		'stderr': stderr
// // 	});
// }
// lsExample();


async function awaitExec(cmdText) {
	// const promise = new Promise(
	// 	(resolve, reject)=>{
	//
	// 	}
	// );
	//await promise;
	await exec(
		cmdText,
		// (err, stdout, stderr) => {
		// 	// console.log(`-- RUN: ${cmdText}`);
		// 	console.log({
		// 		'cmdText' : cmdText,
		// 		'stdout': stdout,
		// 		'stderr' : stderr
		// 	})
		// 	if (err) {
		// 		console.log('Error!')
		// 		return;
		// 	}
		// }
	).then(
		(result) => {
			console.log('result', result);
		}
	).catch(
		(reason) => {

		}
	);
}

const commands = [
	'pwd',
	'ls -la',
	'node -v',
	'type ts-node',
];
commands.forEach(
	function (cmdText) {
		(
			async () => {
				console.log(`-- RUN: ${cmdText}`);
				await exec(
					cmdText,
					(err, stdout, stderr) => {
						// console.log(`-- RUN: ${cmdText}`);
						console.log({
							'cmdText': cmdText,
							'stdout': stdout,
							'stderr': stderr
						})
						if (err) {
							console.log('Error!')
							// return;
						}
					}
				);
			}
		)()

		//awaitExec(cmdText);
	}
);

