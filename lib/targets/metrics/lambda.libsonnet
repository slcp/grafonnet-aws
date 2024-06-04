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
      withFunctionName(value): $.metrics.withInvocations() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withInvocations() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withInvocations() + $.dimensions.withExecutedVersion(value),
    },
  errors:
    {
      withFunctionName(value): $.metrics.withErrors() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withErrors() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withErrors() + $.dimensions.withExecutedVersion(value),
    },
  deadLetterErrors:
    {
      withFunctionName(value): $.metrics.withDeadLetterErrors() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withDeadLetterErrors() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withDeadLetterErrors() + $.dimensions.withExecutedVersion(value),
    },
  destinationDeliveryFailures:
    {
      withFunctionName(value): $.metrics.withDestinationDeliveryFailures() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withDestinationDeliveryFailures() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withDestinationDeliveryFailures() + $.dimensions.withExecutedVersion(value),
    },
  throttles:
    {
      withFunctionName(value): $.metrics.withThrottles() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withThrottles() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withThrottles() + $.dimensions.withExecutedVersion(value),
    },
  oversizedRecordCount:
    {
      withFunctionName(value): $.metrics.withOversizedRecordCount() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withOversizedRecordCount() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withOversizedRecordCount() + $.dimensions.withExecutedVersion(value),
    },
  provisionedConcurrencyInvocations:
    {
      withFunctionName(value): $.metrics.withProvisionedConcurrencyInvocations() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withProvisionedConcurrencyInvocations() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withProvisionedConcurrencyInvocations() + $.dimensions.withExecutedVersion(value),
    },
  provisionedConcurrencySpilloverInvocations:
    {
      withFunctionName(value): $.metrics.withProvisionedConcurrencySpilloverInvocations() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withProvisionedConcurrencySpilloverInvocations() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withProvisionedConcurrencySpilloverInvocations() + $.dimensions.withExecutedVersion(value),
    },
  recursiveInvocationsDropped:
    {
      withFunctionName(value): $.metrics.withRecursiveInvocationsDropped() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withRecursiveInvocationsDropped() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withRecursiveInvocationsDropped() + $.dimensions.withExecutedVersion(value),
    },
  duration:
    {
      withFunctionName(value): $.metrics.withDuration() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withDuration() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withDuration() + $.dimensions.withExecutedVersion(value),
    },
  postRuntimeExtensionsDuration:
    {
      withFunctionName(value): $.metrics.withPostRuntimeExtensionsDuration() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withPostRuntimeExtensionsDuration() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withPostRuntimeExtensionsDuration() + $.dimensions.withExecutedVersion(value),
    },
  iteratorAge:
    {
      withFunctionName(value): $.metrics.withIteratorAge() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withIteratorAge() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withIteratorAge() + $.dimensions.withExecutedVersion(value),
    },
  offsetLag:
    {
      withFunctionName(value): $.metrics.withOffsetLag() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withOffsetLag() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withOffsetLag() + $.dimensions.withExecutedVersion(value),
    },
  concurrentExecutions:
    {
      withFunctionName(value): $.metrics.withConcurrentExecutions() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withConcurrentExecutions() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withConcurrentExecutions() + $.dimensions.withExecutedVersion(value),
    },
  provisionedConcurrentExecutions:
    {
      withFunctionName(value): $.metrics.withProvisionedConcurrentExecutions() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withProvisionedConcurrentExecutions() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withProvisionedConcurrentExecutions() + $.dimensions.withExecutedVersion(value),
    },
  provisionedConcurrencyUtilization:
    {
      withFunctionName(value): $.metrics.withProvisionedConcurrencyUtilization() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withProvisionedConcurrencyUtilization() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withProvisionedConcurrencyUtilization() + $.dimensions.withExecutedVersion(value),
    },
  unreservedConcurrentExecutions:
    {
      withFunctionName(value): $.metrics.withUnreservedConcurrentExecutions() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withUnreservedConcurrentExecutions() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withUnreservedConcurrentExecutions() + $.dimensions.withExecutedVersion(value),
    },
  claimedAccountConcurrency:
    {
      withFunctionName(value): $.metrics.withClaimedAccountConcurrency() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withClaimedAccountConcurrency() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withClaimedAccountConcurrency() + $.dimensions.withExecutedVersion(value),
    },
  asyncEventsReceived:
    {
      withFunctionName(value): $.metrics.withAsyncEventsReceived() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withAsyncEventsReceived() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withAsyncEventsReceived() + $.dimensions.withExecutedVersion(value),
    },
  asyncEventAge:
    {
      withFunctionName(value): $.metrics.withAsyncEventAge() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withAsyncEventAge() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withAsyncEventAge() + $.dimensions.withExecutedVersion(value),
    },
  asyncEventsDropped:
    {
      withFunctionName(value): $.metrics.withAsyncEventsDropped() + $.dimensions.withFunctionName(value),
      withResource(value): $.metrics.withAsyncEventsDropped() + $.dimensions.withResource(value),
      withExecutedVersion(value): $.metrics.withAsyncEventsDropped() + $.dimensions.withExecutedVersion(value),
    },
}
