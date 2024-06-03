local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  withInvocations(metric, sourceLibrary): cloudwatchMetrics.withMetricName(metric) + sourceLibrary.withNamespace(),
  withErrors(metric, sourceLibrary): cloudwatchMetrics.withMetricName(metric) + sourceLibrary.withNamespace(),
  withDeadLetterErrors(metric, sourceLibrary): cloudwatchMetrics.withMetricName(metric) + sourceLibrary.withNamespace(),
  withThrottles(metric, sourceLibrary): cloudwatchMetrics.withMetricName(metric) + sourceLibrary.withNamespace(),
  withIteratorAge(metric, sourceLibrary): cloudwatchMetrics.withMetricName(metric) + sourceLibrary.withNamespace(),
  withConcurrentExecutions(metric, sourceLibrary): cloudwatchMetrics.withMetricName(metric) + sourceLibrary.withNamespace(),
}
