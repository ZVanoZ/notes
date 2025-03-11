const phones = [
    {
        company: "Nokia",
        manufactured: new Date("2022-09-01"),
    },
    {
        company: "Samsung",
        manufactured: new Date("2021-11-05"),
    },
    {
        company: "Apple",
        manufactured: new Date("2022-05-24T12:00:00"),
    },
    {
        company: "NoName",
        manufactured: new Date("2023-01-31T23:59:59"),
    },
];

const tests = {
    t1: false,
    t2: true,
}

if (tests.t1) {
    console.log('test-1-BEG');
    let res = phones.reduce(
        (
            acc,
            phone,
            index
        ) => {
            console.log(
                'test-1-iteration', index,
                JSON.stringify({
                    phone: phone,
                    acc: acc
                }, null, 2)
            );
            let res = index === 1 ? [acc] : acc;
            res.push(phone);
            return res;
        }
    );
    console.log("test-1-res", JSON.stringify(res, null, 2));
    console.log('test-1-END');
}
if (tests.t2) {
    console.log('test-2-BEG');
    let res = phones.reduce(
        (
            acc,
            phone,
            step
        ) => {
            console.log(
                'test-2-iteration', step,
                JSON.stringify({
                    phone: phone,
                    acc: acc
                }, null, 2)
            );
            const appendGreater = new Date("2022-06-01");
            let res = step === 1 ? (isAppend(acc) ? [acc] : []) : acc;
            if (isAppend(phone)) {
                res.push(phone);
            }

            function isAppend(phoneItem) {
                if (phoneItem.manufactured > appendGreater) {
                    console.log('test-2-iteration', step, 'ADD :', phoneItem)
                    return true;
                }
                console.log('test-2-iteration', step, 'SKIP:', phoneItem)
                return false;
            }

            return res;
        }
    );
    console.log("test-2-res", JSON.stringify(res, null, 2));
    console.log('test-2-END');
}

