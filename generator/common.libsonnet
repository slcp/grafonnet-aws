local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local lowerCaseFirstChar(s) = std.asciiLower(std.substr(s, 0, 1)) + std.substr(s, 1, 99/* Overflow to get the whole remainder */);

local sanitizeMetricName(m) = std.strReplace(m, '.', '');

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
  sanitizeMetricName: sanitizeMetricName,
  renderObjectToString: renderObjectToString,
  renderImportToLocalToString: renderImportToLocalToString,
  renderLocalBindToString: renderLocalBindToString,
  cloudWatchMetricsIdentifier: cloudWatchMetricsIdentifier,
  render(
    contents,
    defaultImports={
      renderCloudwatchMetrics: false,
      renderGrafana: false,
    }
  ): (if defaultImports.renderGrafana then renderImportToLocalToString('grafana', 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet') else '')
     + (if defaultImports.renderCloudwatchMetrics then renderLocalBindToString(cloudWatchMetricsIdentifier, a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery')) else '')
     + '\n'
     + contents,
}
