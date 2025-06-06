interface IUser {
    name: string;
    pass?: string;
    curator?: IUser;
}

function testFnItem(item: IUser): void {
    console.log('-- item:', item);
}

function testFnArray(
    data: IUser[]
): void//
{
    console.log('-- data:', data);
    data.forEach((item) => {
        testFnItem(item);
    })
}

const
    data = [{
        name: 'user1',
        pass: 'user1pass'
    }, {
        name: 'user2'
    }, {
        name: 'user3',
        curator : {
            name: 'user3curator'
        }
    }, {
        name: 'user4',
        curator : {
            name: 'user3curator',
            "unknown-key" : "unknown-key-val"
        },
        "unknown-key" : "unknown-key-val"
    }]
;

testFnArray(data);