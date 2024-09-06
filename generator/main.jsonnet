local files = [
  import './targets/metrics/lambda.libsonnet',
  import './targets/metrics/kinesis.libsonnet',
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
