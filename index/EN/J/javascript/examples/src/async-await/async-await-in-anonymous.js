const
	/**
	 *
	 * @type {Promise<String>}
	 */
	res = (
		async (arg) => {
			console.log(new Date().toISOString(), 'anonymous-function', arg)
			const res = await new Promise(
				(resolve, reject) => {
					console.log(new Date().toISOString(), 'promise', arg)
					setTimeout(() => {
						return resolve(`promise-end-for/arg=${arg}`)
					}, 1000);
				}
			);
			console.log(new Date().toISOString(), 'anonymous-function/after-promise', {
				arg: arg,
				res: res
			})
			return res;
		}
	)(999)
;
console.log(
	new Date().toISOString(),
	'ROOT-LEVEL-LOG',
	res
);

