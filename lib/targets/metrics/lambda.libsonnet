local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  withNamespace(): cloudwatchMetrics.withNamespace('AWS/Lambda'),
  metrics:
    {
      withInvocations(): cloudwatchMetrics.withMetricName('Invocations') + $.withNamespace(),
      withErrors(): cloudwatchMetrics.withMetricName('Errors') + $.withNamespace(),
      withDeadLetterErrors(): cloudwatchMetrics.withMetricName('DeadLetterErrors') + $.withNamespace(),
      withDestinationDeliveryFailures(): cloudwatchMetrics.withMetricName('DestinationDeliveryFailures') + $.withNamespace(),
      withThrottles(): cloudwatchMetrics.withMetricName('Throttles') + $.withNamespace(),
      withOversizedRecordCount(): cloudwatchMetrics.withMetricName('OversizedRecordCount') + $.withNamespace(),
      withProvisionedConcurrencyInvocations(): cloudwatchMetrics.withMetricName('ProvisionedConcurrencyInvocations') + $.withNamespace(),
      withProvisionedConcurrencySpilloverInvocations(): cloudwatchMetrics.withMetricName('ProvisionedConcurrencySpilloverInvocations') + $.withNamespace(),
      withRecursiveInvocationsDropped(): cloudwatchMetrics.withMetricName('RecursiveInvocationsDropped') + $.withNamespace(),
      withDuration(): cloudwatchMetrics.withMetricName('Duration') + $.withNamespace(),
      withPostRuntimeExtensionsDuration(): cloudwatchMetrics.withMetricName('PostRuntimeExtensionsDuration') + $.withNamespace(),
      withIteratorAge(): cloudwatchMetrics.withMetricName('IteratorAge') + $.withNamespace(),
      withOffsetLag(): cloudwatchMetrics.withMetricName('OffsetLag') + $.withNamespace(),
      withConcurrentExecutions(): cloudwatchMetrics.withMetricName('ConcurrentExecutions') + $.withNamespace(),
      withProvisionedConcurrentExecutions(): cloudwatchMetrics.withMetricName('ProvisionedConcurrentExecutions') + $.withNamespace(),
      withProvisionedConcurrencyUtilization(): cloudwatchMetrics.withMetricName('ProvisionedConcurrencyUtilization') + $.withNamespace(),
      withUnreservedConcurrentExecutions(): cloudwatchMetrics.withMetricName('UnreservedConcurrentExecutions') + $.withNamespace(),
      withClaimedAccountConcurrency(): cloudwatchMetrics.withMetricName('ClaimedAccountConcurrency') + $.withNamespace(),
      withAsyncEventsReceived(): cloudwatchMetrics.withMetricName('AsyncEventsReceived') + $.withNamespace(),
      withAsyncEventAge(): cloudwatchMetrics.withMetricName('AsyncEventAge') + $.withNamespace(),
      withAsyncEventsDropped(): cloudwatchMetrics.withMetricName('AsyncEventsDropped') + $.withNamespace(),
    },
  dimensions:
    {
      withFunctionName(value): cloudwatchMetrics.withDimensions({
        FunctionName: value,
      }),
      withResource(value): cloudwatchMetrics.withDimensions({
        Resource: value,
      }),
      withExecutedVersion(value): cloudwatchMetrics.withDimensions({
        ExecutedVersion: value,
      }),
    },
  invocations:
    {
      withFunctionName(value):
        $.metrics.withInvocations()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withInvocations()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withInvocations()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  errors:
    {
      withFunctionName(value):
        $.metrics.withErrors()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withErrors()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withErrors()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  deadLetterErrors:
    {
      withFunctionName(value):
        $.metrics.withDeadLetterErrors()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withDeadLetterErrors()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withDeadLetterErrors()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  destinationDeliveryFailures:
    {
      withFunctionName(value):
        $.metrics.withDestinationDeliveryFailures()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withDestinationDeliveryFailures()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withDestinationDeliveryFailures()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  throttles:
    {
      withFunctionName(value):
        $.metrics.withThrottles()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withThrottles()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withThrottles()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  oversizedRecordCount:
    {
      withFunctionName(value):
        $.metrics.withOversizedRecordCount()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withOversizedRecordCount()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withOversizedRecordCount()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  provisionedConcurrencyInvocations:
    {
      withFunctionName(value):
        $.metrics.withProvisionedConcurrencyInvocations()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withProvisionedConcurrencyInvocations()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withProvisionedConcurrencyInvocations()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  provisionedConcurrencySpilloverInvocations:
    {
      withFunctionName(value):
        $.metrics.withProvisionedConcurrencySpilloverInvocations()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withProvisionedConcurrencySpilloverInvocations()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withProvisionedConcurrencySpilloverInvocations()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  recursiveInvocationsDropped:
    {
      withFunctionName(value):
        $.metrics.withRecursiveInvocationsDropped()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withRecursiveInvocationsDropped()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withRecursiveInvocationsDropped()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  duration:
    {
      withFunctionName(value):
        $.metrics.withDuration()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withDuration()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withDuration()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  postRuntimeExtensionsDuration:
    {
      withFunctionName(value):
        $.metrics.withPostRuntimeExtensionsDuration()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withPostRuntimeExtensionsDuration()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withPostRuntimeExtensionsDuration()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  iteratorAge:
    {
      withFunctionName(value):
        $.metrics.withIteratorAge()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withIteratorAge()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withIteratorAge()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  offsetLag:
    {
      withFunctionName(value):
        $.metrics.withOffsetLag()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withOffsetLag()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withOffsetLag()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  concurrentExecutions:
    {
      withFunctionName(value):
        $.metrics.withConcurrentExecutions()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withConcurrentExecutions()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withConcurrentExecutions()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  provisionedConcurrentExecutions:
    {
      withFunctionName(value):
        $.metrics.withProvisionedConcurrentExecutions()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withProvisionedConcurrentExecutions()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withProvisionedConcurrentExecutions()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  provisionedConcurrencyUtilization:
    {
      withFunctionName(value):
        $.metrics.withProvisionedConcurrencyUtilization()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withProvisionedConcurrencyUtilization()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withProvisionedConcurrencyUtilization()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  unreservedConcurrentExecutions:
    {
      withFunctionName(value):
        $.metrics.withUnreservedConcurrentExecutions()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withUnreservedConcurrentExecutions()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withUnreservedConcurrentExecutions()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  claimedAccountConcurrency:
    {
      withFunctionName(value):
        $.metrics.withClaimedAccountConcurrency()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withClaimedAccountConcurrency()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withClaimedAccountConcurrency()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  asyncEventsReceived:
    {
      withFunctionName(value):
        $.metrics.withAsyncEventsReceived()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withAsyncEventsReceived()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withAsyncEventsReceived()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  asyncEventAge:
    {
      withFunctionName(value):
        $.metrics.withAsyncEventAge()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withAsyncEventAge()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withAsyncEventAge()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
  asyncEventsDropped:
    {
      withFunctionName(value):
        $.metrics.withAsyncEventsDropped()
        + $.dimensions.withFunctionName(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withResource(value):
        $.metrics.withAsyncEventsDropped()
        + $.dimensions.withResource(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
      withExecutedVersion(value):
        $.metrics.withAsyncEventsDropped()
        + $.dimensions.withExecutedVersion(value)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
        + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
    },
}
