// Imports
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

// Internal
local cloudWatchMetricsIdentifier = 'cloudwatchMetrics';

// Helpers
local renderMetricFunc(m) =
  (a.field_function.new(
     a.id.new('with' + m),
     a.binary.new(
       '+',
       a.functioncall.new(
         a.literal.new(cloudWatchMetricsIdentifier + '.withMetricName')
       )
       + a.functioncall.withArgs(a.string.new(m)),
       a.functioncall.new(
         a.literal.new('$' + '.withNamespace')
       )
     )
   ));

local renderMetricFuncs(metrics) =
  std.map(
    renderMetricFunc, metrics
  );

local renderMetrics(metrics) = a.field.new(a.id.new('metrics'),
                                           a.object.new(renderMetricFuncs(metrics)));

local renderObjectToString(members) = a.object.new(members).toString();

local renderLocalBindToString(var, value) = a.local_bind.new(a.bind.new(
  a.id.new(var),
  value
), a.literal.new('')).toString();

local renderImportToLocalToString(var, path) = renderLocalBindToString(var, a.import_statement.new(path));

local renderNamespace(namespace) = a.field_function.new(
  a.id.new('withNamespace'),
  a.functioncall.new(a.literal.new(cloudWatchMetricsIdentifier + '.withNamespace'))
  + a.functioncall.withArgs(a.string.new(namespace)),
);

// Output
{
  renderObjectToString: renderObjectToString,
  renderMetrics: renderMetrics,
  renderNamespace: renderNamespace,
  render(contents): renderImportToLocalToString('grafana', 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet')
                          + renderLocalBindToString(cloudWatchMetricsIdentifier, a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery'))
                          + '\n'
                          + contents,
}
