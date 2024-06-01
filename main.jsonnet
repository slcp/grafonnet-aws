local awsTargets = import './lib/targets/metrics/main.libsonnet';

awsTargets.new()
+ awsTargets.lambda.invocations.withFunctionName('MyFunction')
// + awsTargets.lambda.metrics.withInvocations()
// + awsTargets.lambda.dimensions.withFunctionName('MyFunction')
+ awsTargets.statistics.withSum()
