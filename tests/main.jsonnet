local lambdaQ = import './queries/lambda.libsonnet';
local lambdaM = import './targets/metrics/lambda.libsonnet';
local contextT = import './targets/context.libsonnet';

{
  metrics: {
    lambda: lambdaM,
  },
  queries: {
    lambda: lambdaQ,
  },
  targets: {
    context: contextT,
  }
}
