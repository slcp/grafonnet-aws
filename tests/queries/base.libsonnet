local q = import '../../lib/queries/base.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

local query = q.new('My Query');

test.new(std.thisFile)
+ test.case.new(
  name='New query should create a base query with a provided label, hashed name and  query property as a object',
  test=test.expect.eq(
    actual=query,
    expected={
      label: 'My Query',
      name: '65edc9c4ac9a4f3c5ff9a50fe91a3da5',
      query: {},
      type: 'query',
    }
  )
)
+ test.case.new(
  name='Composing the result of bind() from a query construct should set the variable identifier on the given property',
  test=test.expect.eq(
    actual={ hello: 'world' }
           + query.bind('x'),
    expected={
      hello: 'world',
      x: '$65edc9c4ac9a4f3c5ff9a50fe91a3da5',
    }
  )
)
