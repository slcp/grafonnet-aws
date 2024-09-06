local files = [
  import './targets/metrics/lambda.libsonnet',
  import './statistics.libsonnet',
  import './queries/lambda.libsonnet',
  import './resources/lambda.libsonnet',
];

{
  [f.path]: f.render()
  for f in files
}
