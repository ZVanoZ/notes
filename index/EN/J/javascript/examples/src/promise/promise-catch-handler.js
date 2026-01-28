const algo = {
	isHandlerCatchDoReject: true,
	steps: [
		{
			isStepError: false
		},
		{
			isStepError: true
		},
		{
			isStepError: false
		}
	]
};

function handlerCatch(reason) {
	const tag = 'handlerCatch';
	console.log(tag, 'reason: ' + reason);
	return new Promise(
		(resolve, reject) => {
			console.log(tag, 'promise-start');
			if (algo.isHandlerCatchDoReject) {
				console.log(tag, 'promise-reject');
				return reject(tag + '-do-reject' + ' << ' + reason);
			}
			console.log(tag, 'promise-resolve');
			return resolve(reason);
		}
	)
}

let step = -1;

function createStepThen() {
	return (res) => {
		// const isStepError = algo.steps[step].isStepError;
		++step;
		const stepAlgo = algo.steps[step];
		let tag = 'step-' + step;
		console.log(tag, 'res: ' + res);
		return new Promise(
			(resolve, reject) => {
				tag = tag + '-promise';
				console.log(tag);
				if (stepAlgo.isStepError) {
					console.log(tag, 'reject');
					return reject(tag + '-rejected');
				}
				console.log(tag, 'resolve');
				return resolve(tag + '-resolved');
			}
		)
	}
}

function createPromise() {
	tag = 'createPromise';
	console.log(tag);
	return new Promise(
		(resolve, reject) => {
			const isStepError = algo.isStep1Error;
			tag = 'step1'
			console.log(tag);
			if (isStepError) {
				console.log(tag, 'reject');
				return reject('do-' + tag + '-reject');
			}
			console.log(tag, 'resolve');
			return resolve('do-' + tag + '-resolve');
		}
	).then(
		createStepThen()
	).catch(
		handlerCatch
	);
}

createPromise().then(
	createStepThen()
).catch(
	handlerCatch
).catch(
	(reason) => {
		console.log(
			'final-catch',
			{
				'reason': reason,
				'@note': 'Если хотим продолжить цепочку catch, то должны вернуть new Promise и выполнить reject'
			}
		);
	}
);