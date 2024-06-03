local x = import './targets/metrics/main.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';
local l = x.lambda;

local renderMetricFunc(m) = (a.field_function.new(
                               a.id.new('with' + m),
                               a.binary.new(
                                 '+',
                                 a.functioncall.new(
                                   a.literal.new('cloudwatchMetrics.withMetricName')
                                 )
                                 + a.functioncall.withArgs(a.literal.new('metric')),
                                 a.functioncall.new(
                                   a.literal.new('sourceLibrary.withNamespace')
                                 )
                               )
                             )
                             + a.field_function.withParams(
                               a.params.new([
                                 a.param.new(
                                   a.id.new('metric')
                                 ),
                                 a.param.new(
                                   a.id.new('sourceLibrary')
                                 ),
                               ])
                             )).toString();

local renderMetricFuncs(metrics) =
  std.map(
    renderMetricFunc, metrics
  );

local renderMetrics(metrics) = '{\n' + std.join(
  ', \n',
  renderMetricFuncs(metrics)
) + '\n}';

local renderLocalBind(var, value) = a.local_bind.new(a.bind.new(
  a.id.new(var),
  value
), a.literal.new('')).toString();

local renderImportToLocal(var, path) = renderLocalBind(var, a.import_statement.new(path));

renderImportToLocal('grafana', 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet')
+ renderLocalBind('cloudwatchMetrics', a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery'))
+ '\n'
+ renderMetrics([
  'Invocations',
  'Errors',
  'DeadLetterErrors',
  'Throttles',
  'IteratorAge',
  'ConcurrentExecutions',
])
