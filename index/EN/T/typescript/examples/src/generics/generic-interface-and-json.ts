interface IUser {
    name: string;
}

function testFnItem<T extends IUser>(
    item: T
): void //
{
    console.log('-- item:', item);
}

function testFnArray<T>(
    data: T[]
): void //
{
    console.log(data);
    data.forEach(
        (item) => {

            testFnItem(item);
        }
    )
}

const
    data = [{
        name: 'user1'
    }, {
        name: 'user2'
    }]
;

testFnArray(data);