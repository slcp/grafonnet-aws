local files = [
  import './target-helpers.libsonnet',
];

{
  [f.path]: f.content
  for f in files
}
