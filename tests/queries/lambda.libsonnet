local lambda = import '../../lib/queries/lambda.libsonnet';
local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

local base = g.dashboard.variable.query.new('base', { hello: 'world' });
local expected = {
  base: 'value',
  query: {
    dimensionKey: 'FunctionName',
    metricName: 'Invocations',
    namespace: 'AWS/Lambda',
  },
};

test.new(std.thisFile)
+ test.case.new(
  name='Lambda metrics namespace',
  test=test.expect.eq(
    actual=base + lambda.invocations.byFunctionName('regex input'),
    expected=base { regex: 'regex input' } + { query+: {
      dimensionKey: 'FunctionName',
      metricName: 'Invocations',
      namespace: 'AWS/Lambda',
    } }
  )
)
