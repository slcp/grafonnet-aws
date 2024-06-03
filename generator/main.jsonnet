local files = [
  import './lambda.libsonnet',
];

{
  [f.path]: f.render()
  for f in files
}
