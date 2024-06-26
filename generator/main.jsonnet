local files = [
  import './lambda.libsonnet',
  import './statistics.libsonnet',
  import './queries.libsonnet',
  import './resources.libsonnet',
];

{
  [f.path]: f.render()
  for f in files
}
