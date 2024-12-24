(
	() => {
		let
			context1 = {
				name: 'context1',
			},
			test = {
				name: 'test-promises-object',
				createPromise: function () {
					console.log('test.createPromise', {
						'context-this' : this
					});
					return new Promise(
						function (resolve, reject) {
							console.log('test.createPromise/start', {
								'context-this' : this
							});
							setTimeout(() => {
								console.log('test.createPromise/timeout', {
									'context-this' : this
								});
								//return reject('promise-terminated');
								return resolve('test.createPromise/timeout-success');
							}, 1100);
						}.bind(this)
					);
				},
				promiseCatchHandler: function (reason) {
					if (reason instanceof Error){
						reason = reason.message;
					}
					console.log('test.promiseCatchHandler', {
						'context-this' : this,
						reason: reason
					});
				}
			}
		;

		test.createPromise().then(
			function (res) {
				console.log('promise-then-1', {
					'context-this' : this,
					res : res
				});
				throw new Error('Error: искуственно созданное исключение');
			}.bind(context1)
		).then(
			function (res) {
				// Сюда никогда не попадем
				console.log('promise-then-2', {
					'context-this' : this
				});
			}.bind(context1)
		).finally(
			function () {
				console.log('promise-finally', {
					'context-this' : this
				});
			}.bind(context1)
		).catch(
			test.promiseCatchHandler.bind(context1)
		);
	}
)();