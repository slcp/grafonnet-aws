local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  withNamespace(): cloudwatchMetrics.withNamespace('AWS/Lambda'),
  metrics:
    {
      withInvocations(): cloudwatchMetrics.withMetricName('Invocations') + $.withNamespace(),
      withErrors(): cloudwatchMetrics.withMetricName('Errors') + $.withNamespace(),
      withDeadLetterErrors(): cloudwatchMetrics.withMetricName('DeadLetterErrors') + $.withNamespace(),
      withThrottles(): cloudwatchMetrics.withMetricName('Throttles') + $.withNamespace(),
      withIteratorAge(): cloudwatchMetrics.withMetricName('IteratorAge') + $.withNamespace(),
      withConcurrentExecutions(): cloudwatchMetrics.withMetricName('ConcurrentExecutions') + $.withNamespace(),
    },
}
