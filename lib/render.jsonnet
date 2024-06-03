local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local cloudWatchMetricsIdentifier = 'cloudwatchMetrics';

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

local renderObject(members) = a.object.new(members).toString();

local renderLocalBind(var, value) = a.local_bind.new(a.bind.new(
  a.id.new(var),
  value
), a.literal.new('')).toString();

local renderImportToLocal(var, path) = renderLocalBind(var, a.import_statement.new(path));

local renderNamespace(namespace) = a.field_function.new(
  a.id.new('withNamespace'),
  a.functioncall.new(a.literal.new(cloudWatchMetricsIdentifier + '.withNamespace'))
  + a.functioncall.withArgs(a.string.new(namespace)),
);

// This output needs to be the value of a file name
// Context should be 'file name/path', 'contents', anything else?
renderImportToLocal('grafana', 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet')
+ renderLocalBind(cloudWatchMetricsIdentifier, a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery'))
+ '\n'
+ renderObject(
  [renderNamespace('AWS/Lambda')]
  + [
    a.field.new(a.id.new('metrics'),
                a.object.new(renderMetricFuncs([
                  'Invocations',
                  'Errors',
                  'DeadLetterErrors',
                  'Throttles',
                  'IteratorAge',
                  'ConcurrentExecutions',
                ]))),
  ]
)
