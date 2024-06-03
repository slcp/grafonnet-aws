local lambda = import '../../../lib/targets/metrics/lambda.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

local actual = lambda.withNamespace();

local expected = { namespace: 'AWS/Lambda' };

test.new(std.thisFile)
+ test.case.new(
  name='Lambda metrics namespace',
  test=test.expect.eq(
    actual=actual,
    expected=expected
  )
)
