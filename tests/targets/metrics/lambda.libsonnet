local generator = import '../../../generator/lambda.libsonnet';
local lambda = import '../../../lib/targets/metrics/lambda.libsonnet';
local common = import '../../common.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

local namespace = { namespace: 'AWS/Lambda' };

local metricTests = std.foldl(
  function(acc, m)
    acc + test.case.new(
      name='Lambda metrics',
      test=test.expect.eq(
        actual=lambda.metrics['with' + m](),
        expected={ metricName: m } + namespace
      )
    ),
  generator.metrics,
  {}
);

local dimensionTests = std.foldl(
  function(acc, d)
    acc + test.case.new(
      name='Lambda dimensions',
      test=test.expect.eq(
        actual=lambda.dimensions['with' + d]('value'),
        expected={ dimensions: { [d]: 'value' } }
      )
    ),
  generator.dimensions,
  {}
);

local convenienceTests = std.foldl(
  function(acc, m)
    acc + std.foldl(
      function(acc, d)
        acc + test.case.new(
          name='Lambda convenience',
          test=test.expect.eq(
            actual=lambda[common.lowerCaseFirstChar(m)]['with' + d]('value'),
            expected={ metricName: m } + { dimensions: { [d]: 'value' } } +
                     { metricEditorMode: 0, metricName: m, metricQueryType: 0, queryMode: 'Metrics' }
                     + namespace
          )
        ), generator.dimensions, {}
    ),
  generator.metrics,
  {}
);

test.new(std.thisFile)
+ test.case.new(
  name='Lambda metrics namespace',
  test=test.expect.eq(
    actual=lambda.withNamespace(),
    expected=namespace
  )
)
+ metricTests
+ dimensionTests
+ convenienceTests
