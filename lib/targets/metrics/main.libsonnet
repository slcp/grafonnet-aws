local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local new() = cloudwatchMetrics.withMetricQueryType(0)
              + cloudwatchMetrics.withMetricEditorMode(0)
              + cloudwatchMetrics.withQueryMode('Metrics');

{
  new: new,
  statistics: import './statistics.libsonnet',
  lambda: import './lambda.libsonnet',
}
