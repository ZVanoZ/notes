(
	() => {

		new Promise(
			(resolve1, reject1) => {
				console.log('promise1-start');
				return new Promise(
					(resolve2, reject2) => {
						console.log('promise2-start');
						let a = invalidVariable
						return resolve2()
					}
				).then(
					() => {
						console.log('promise2-then');
						return resolve1()
					}
				).finally(
					() => {
						console.log('promise2-finally1');
					}
				).catch(
					(reason) => {
						console.log('promise2-catch', reason.message);
						return reject1(reason);
					}
				).finally(
					() => {
						console.log('promise2-finally2');
					}
				);
			}
		).then(
			() => {
				console.log('promise1-then');
			}
		).finally(
			() => {
				console.log('promise1-finally1');
			}
		).catch(
			(reason) => {
				console.log('promise1-catch', reason.message);
			}
		).finally(
			() => {
				console.log('promise1-finally2');
			}
		);
	}
)();