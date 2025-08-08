local metricTargets = import './targets/metrics/config.libsonnet';
local files = std.objectValues(metricTargets) + [
  import './statistics.libsonnet',
  import './queries/lambda.libsonnet',
  import './queries/kinesis.libsonnet',
  import './resources/lambda.libsonnet',
  import './resources/kinesis.libsonnet',
];

{
  [f.path]: f.render()
  for f in files
}
