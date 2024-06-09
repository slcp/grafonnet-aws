local lambdaQ = import './queries/lambda.libsonnet';
local lambdaM = import './targets/metrics/lambda.libsonnet';

{
  metrics: {
    lambda: lambdaM,
  },
  queries: {
    lambda: lambdaQ,
  },
}
