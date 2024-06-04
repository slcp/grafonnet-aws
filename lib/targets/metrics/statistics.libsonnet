local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  withSum(): cloudwatchMetrics.withStatistic('Sum'),
  withAverage(): cloudwatchMetrics.withStatistic('Average'),
  withMaximum(): cloudwatchMetrics.withStatistic('Maximum'),
  withMinimum(): cloudwatchMetrics.withStatistic('Minimum'),
}
