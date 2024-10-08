local context = import '../../lib/queries/context.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

local mockDatasourceVariable = { type: 'datasource', query: 'query', name: 'name' };
local fullContext = context.new()
                    + context.withAccountId('value')
                    + context.withDatasourceFromVariable(mockDatasourceVariable)
                    + context.withRegion('value');
local partialContext = context.new()
                       + context.withAccountId('value')
                       + context.withRegion('value');

test.new(std.thisFile)
+ test.case.new(
  name='New context',
  test=test.expect.eq(
    actual=context.new(),
    expected={}
  )
)
+ test.case.new(
  name='withAccountId',
  test=test.expect.eq(
    actual=context.new() + context.withAccountId('value'),
    expected={ accountId: 'value' }
  )
)
+ test.case.new(
  name='withDatasourceFromVariable',
  test=test.expect.eq(
    actual=context.new() + context.withDatasourceFromVariable('value'),
    expected={ datasource: 'value' }
  )
)
+ test.case.new(
  name='withRegion',
  test=test.expect.eq(
    actual=context.new() + context.withRegion('value'),
    expected={ region: 'value' }
  )
)
+ test.case.new(
  name='wrap with full context',
  test=test.expect.eq(
    actual=fullContext.wrap([{}, {}, {}]),
    expected=[
      { datasource: { type: 'query', uid: '${name}' }, query: { accountId: 'value', region: 'value' } },
      { datasource: { type: 'query', uid: '${name}' }, query: { accountId: 'value', region: 'value' } },
      { datasource: { type: 'query', uid: '${name}' }, query: { accountId: 'value', region: 'value' } },
    ]
  )
)
+ test.case.new(
  name='wrap with partial context',
  test=test.expect.eq(
    actual=partialContext.wrap([{}, {}, {}]),
    expected=[
      { query: { accountId: 'value', region: 'value' } },
      { query: { accountId: 'value', region: 'value' } },
      { query: { accountId: 'value', region: 'value' } },
    ]
  )
)
