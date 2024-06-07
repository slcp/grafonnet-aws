local files = [
  import './lambda.libsonnet',
  import './statistics.libsonnet',
  import './dependencies.libsonnet',
];

{
  [f.path]: f.render()
  for f in files
}
