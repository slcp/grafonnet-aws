local c = import './common.libsonnet';

local files = [
  import './targets/metrics/lambda.libsonnet',
  import './targets/metrics/kinesis.libsonnet',
  import './statistics.libsonnet',
  import './queries/lambda.libsonnet',
  import './queries/kinesis.libsonnet',
  import './resources/lambda.libsonnet',
  import './resources/kinesis.libsonnet',
];

local main = {
  path: 'main.libsonnet',
  render(): 
    // local imports = std.set([std.split(f.path, "/")[0] for f in files]);
    // TODO: Split f.path and create TitleCase vars from all part of path
    // TODO: Create nested object to rexport, nested using parts of f.path
    // Deepest nest is where TitleCase var is reexported 
    std.join("", [c.renderImportToLocalToString("x", "./" + f.path) for f in files])
};

{
  [f.path]: f.render()
  for f in files + [main]
}
