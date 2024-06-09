local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local lowerCaseFirstChar(s) = std.asciiLower(std.substr(s, 0, 1)) + std.substr(s, 1, 99/* Overflow to get the whole remainder */);

local renderObjectToString(members) = a.object.new(members).toString();

local renderLocalBindToString(var, value) = a.local_bind.new(a.bind.new(
  a.id.new(var),
  value
), a.literal.new('')).toString();

local renderImportToLocalToString(var, path) = renderLocalBindToString(var, a.import_statement.new(path));

local cloudWatchMetricsIdentifier = 'cloudwatchMetrics';

// Output
{
  lowerCaseFirstChar: lowerCaseFirstChar,
  renderObjectToString: renderObjectToString,
  cloudWatchMetricsIdentifier: cloudWatchMetricsIdentifier,
  render(contents): renderImportToLocalToString('grafana', 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet')
                    + renderLocalBindToString(cloudWatchMetricsIdentifier, a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery'))
                    + '\n'
                    + contents,
}
