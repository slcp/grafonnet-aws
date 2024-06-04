local files = [
  import './lambda.libsonnet',
  import './statistics.libsonnet',
];

{
  [f.path]: f.render()
  for f in files
}
