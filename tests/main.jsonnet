local lambdaQ = import './queries/lambda.libsonnet';
local baseQ = import './queries/base.libsonnet';
local contextQ = import './queries/context.libsonnet';
local lambdaM = import './targets/metrics/lambda.libsonnet';
local contextT = import './targets/context.libsonnet';

{
  metrics: {
    lambda: lambdaM,
  },
  queries: {
    lambda: lambdaQ,
    base: baseQ,
    contextQ: contextQ,
  },
  targets: {
    context: contextT,
  }
}
