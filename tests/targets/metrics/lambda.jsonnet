local awsTargets = import '../../../lib/targets/metrics/main.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

local actual = awsTargets.new()
               + awsTargets.lambda.invocations.withFunctionName('MyFunction')
               + awsTargets.statistics.withSum();

local expected = actual;

test.new(std.thisFile)
+ test.case.new(
  name='Lambda',
  test=test.expect.eq(
    actual=actual,
    expected=expected
  )
)
