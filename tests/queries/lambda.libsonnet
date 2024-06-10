local generator = import '../../generator/lambda.libsonnet';
local l = import '../../lib/queries/lambda.libsonnet';
local c = import '../common.libsonnet';
local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

local base = g.dashboard.variable.query.new('base', { hello: 'world' });

local convenienceTests = std.foldl(
  function(acc, m)
    acc + std.foldl(
      function(acc, d)
        acc + test.case.new(
          name='Lambda convenience',
          test=test.expect.eq(
            actual=base + l[c.lowerCaseFirstChar(m)]['by' + d]('regex input'),
            expected=base { regex: 'regex input' } + { query+: {
              dimensionKey: d,
              metricName: m,
              namespace: 'AWS/Lambda',
            } }
          )
        ), generator.dimensions, {}
    ),
  generator.metrics,
  {}
);

test.new(std.thisFile)
+ convenienceTests
