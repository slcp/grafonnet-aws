local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local lambda = import '../targets/metrics/lambda.libsonnet';
local queries = import '../queries/lambda.libsonnet';
local statistics = import '../targets/metrics/statistics.libsonnet';

{
  new(name):
    {
      local root = self,
      name: name,
      targets:
        {
          invocations:
            {
              withSum(): lambda.invocations.withFunctionName(root.name),
              withAverage(): lambda.invocations.withFunctionName(root.name),
              withMaximum(): lambda.invocations.withFunctionName(root.name),
              withMinimum(): lambda.invocations.withFunctionName(root.name),
            },
          errors:
            {
              withSum(): lambda.errors.withFunctionName(root.name),
              withAverage(): lambda.errors.withFunctionName(root.name),
              withMaximum(): lambda.errors.withFunctionName(root.name),
              withMinimum(): lambda.errors.withFunctionName(root.name),
            },
          deadLetterErrors:
            {
              withSum(): lambda.deadLetterErrors.withFunctionName(root.name),
              withAverage(): lambda.deadLetterErrors.withFunctionName(root.name),
              withMaximum(): lambda.deadLetterErrors.withFunctionName(root.name),
              withMinimum(): lambda.deadLetterErrors.withFunctionName(root.name),
            },
          destinationDeliveryFailures:
            {
              withSum(): lambda.destinationDeliveryFailures.withFunctionName(root.name),
              withAverage(): lambda.destinationDeliveryFailures.withFunctionName(root.name),
              withMaximum(): lambda.destinationDeliveryFailures.withFunctionName(root.name),
              withMinimum(): lambda.destinationDeliveryFailures.withFunctionName(root.name),
            },
          throttles:
            {
              withSum(): lambda.throttles.withFunctionName(root.name),
              withAverage(): lambda.throttles.withFunctionName(root.name),
              withMaximum(): lambda.throttles.withFunctionName(root.name),
              withMinimum(): lambda.throttles.withFunctionName(root.name),
            },
          oversizedRecordCount:
            {
              withSum(): lambda.oversizedRecordCount.withFunctionName(root.name),
              withAverage(): lambda.oversizedRecordCount.withFunctionName(root.name),
              withMaximum(): lambda.oversizedRecordCount.withFunctionName(root.name),
              withMinimum(): lambda.oversizedRecordCount.withFunctionName(root.name),
            },
          provisionedConcurrencyInvocations:
            {
              withSum(): lambda.provisionedConcurrencyInvocations.withFunctionName(root.name),
              withAverage(): lambda.provisionedConcurrencyInvocations.withFunctionName(root.name),
              withMaximum(): lambda.provisionedConcurrencyInvocations.withFunctionName(root.name),
              withMinimum(): lambda.provisionedConcurrencyInvocations.withFunctionName(root.name),
            },
          provisionedConcurrencySpilloverInvocations:
            {
              withSum(): lambda.provisionedConcurrencySpilloverInvocations.withFunctionName(root.name),
              withAverage(): lambda.provisionedConcurrencySpilloverInvocations.withFunctionName(root.name),
              withMaximum(): lambda.provisionedConcurrencySpilloverInvocations.withFunctionName(root.name),
              withMinimum(): lambda.provisionedConcurrencySpilloverInvocations.withFunctionName(root.name),
            },
          recursiveInvocationsDropped:
            {
              withSum(): lambda.recursiveInvocationsDropped.withFunctionName(root.name),
              withAverage(): lambda.recursiveInvocationsDropped.withFunctionName(root.name),
              withMaximum(): lambda.recursiveInvocationsDropped.withFunctionName(root.name),
              withMinimum(): lambda.recursiveInvocationsDropped.withFunctionName(root.name),
            },
          duration:
            {
              withSum(): lambda.duration.withFunctionName(root.name),
              withAverage(): lambda.duration.withFunctionName(root.name),
              withMaximum(): lambda.duration.withFunctionName(root.name),
              withMinimum(): lambda.duration.withFunctionName(root.name),
            },
          postRuntimeExtensionsDuration:
            {
              withSum(): lambda.postRuntimeExtensionsDuration.withFunctionName(root.name),
              withAverage(): lambda.postRuntimeExtensionsDuration.withFunctionName(root.name),
              withMaximum(): lambda.postRuntimeExtensionsDuration.withFunctionName(root.name),
              withMinimum(): lambda.postRuntimeExtensionsDuration.withFunctionName(root.name),
            },
          iteratorAge:
            {
              withSum(): lambda.iteratorAge.withFunctionName(root.name),
              withAverage(): lambda.iteratorAge.withFunctionName(root.name),
              withMaximum(): lambda.iteratorAge.withFunctionName(root.name),
              withMinimum(): lambda.iteratorAge.withFunctionName(root.name),
            },
          offsetLag:
            {
              withSum(): lambda.offsetLag.withFunctionName(root.name),
              withAverage(): lambda.offsetLag.withFunctionName(root.name),
              withMaximum(): lambda.offsetLag.withFunctionName(root.name),
              withMinimum(): lambda.offsetLag.withFunctionName(root.name),
            },
          concurrentExecutions:
            {
              withSum(): lambda.concurrentExecutions.withFunctionName(root.name),
              withAverage(): lambda.concurrentExecutions.withFunctionName(root.name),
              withMaximum(): lambda.concurrentExecutions.withFunctionName(root.name),
              withMinimum(): lambda.concurrentExecutions.withFunctionName(root.name),
            },
          provisionedConcurrentExecutions:
            {
              withSum(): lambda.provisionedConcurrentExecutions.withFunctionName(root.name),
              withAverage(): lambda.provisionedConcurrentExecutions.withFunctionName(root.name),
              withMaximum(): lambda.provisionedConcurrentExecutions.withFunctionName(root.name),
              withMinimum(): lambda.provisionedConcurrentExecutions.withFunctionName(root.name),
            },
          provisionedConcurrencyUtilization:
            {
              withSum(): lambda.provisionedConcurrencyUtilization.withFunctionName(root.name),
              withAverage(): lambda.provisionedConcurrencyUtilization.withFunctionName(root.name),
              withMaximum(): lambda.provisionedConcurrencyUtilization.withFunctionName(root.name),
              withMinimum(): lambda.provisionedConcurrencyUtilization.withFunctionName(root.name),
            },
          unreservedConcurrentExecutions:
            {
              withSum(): lambda.unreservedConcurrentExecutions.withFunctionName(root.name),
              withAverage(): lambda.unreservedConcurrentExecutions.withFunctionName(root.name),
              withMaximum(): lambda.unreservedConcurrentExecutions.withFunctionName(root.name),
              withMinimum(): lambda.unreservedConcurrentExecutions.withFunctionName(root.name),
            },
          claimedAccountConcurrency:
            {
              withSum(): lambda.claimedAccountConcurrency.withFunctionName(root.name),
              withAverage(): lambda.claimedAccountConcurrency.withFunctionName(root.name),
              withMaximum(): lambda.claimedAccountConcurrency.withFunctionName(root.name),
              withMinimum(): lambda.claimedAccountConcurrency.withFunctionName(root.name),
            },
          asyncEventsReceived:
            {
              withSum(): lambda.asyncEventsReceived.withFunctionName(root.name),
              withAverage(): lambda.asyncEventsReceived.withFunctionName(root.name),
              withMaximum(): lambda.asyncEventsReceived.withFunctionName(root.name),
              withMinimum(): lambda.asyncEventsReceived.withFunctionName(root.name),
            },
          asyncEventAge:
            {
              withSum(): lambda.asyncEventAge.withFunctionName(root.name),
              withAverage(): lambda.asyncEventAge.withFunctionName(root.name),
              withMaximum(): lambda.asyncEventAge.withFunctionName(root.name),
              withMinimum(): lambda.asyncEventAge.withFunctionName(root.name),
            },
          asyncEventsDropped:
            {
              withSum(): lambda.asyncEventsDropped.withFunctionName(root.name),
              withAverage(): lambda.asyncEventsDropped.withFunctionName(root.name),
              withMaximum(): lambda.asyncEventsDropped.withFunctionName(root.name),
              withMinimum(): lambda.asyncEventsDropped.withFunctionName(root.name),
            },
        },
    },
  withQuery:
    {
      invocations:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.invocations.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.invocations.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.invocations.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      errors:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.errors.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.errors.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.errors.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      deadLetterErrors:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.deadLetterErrors.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.deadLetterErrors.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.deadLetterErrors.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      destinationDeliveryFailures:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.destinationDeliveryFailures.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.destinationDeliveryFailures.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.destinationDeliveryFailures.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      throttles:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.throttles.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.throttles.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.throttles.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      oversizedRecordCount:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.oversizedRecordCount.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.oversizedRecordCount.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.oversizedRecordCount.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      provisionedConcurrencyInvocations:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencyInvocations.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencyInvocations.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencyInvocations.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      provisionedConcurrencySpilloverInvocations:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencySpilloverInvocations.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencySpilloverInvocations.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencySpilloverInvocations.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      recursiveInvocationsDropped:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.recursiveInvocationsDropped.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.recursiveInvocationsDropped.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.recursiveInvocationsDropped.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      duration:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.duration.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.duration.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.duration.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      postRuntimeExtensionsDuration:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.postRuntimeExtensionsDuration.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.postRuntimeExtensionsDuration.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.postRuntimeExtensionsDuration.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      iteratorAge:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.iteratorAge.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.iteratorAge.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.iteratorAge.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      offsetLag:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.offsetLag.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.offsetLag.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.offsetLag.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      concurrentExecutions:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.concurrentExecutions.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.concurrentExecutions.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.concurrentExecutions.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      provisionedConcurrentExecutions:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrentExecutions.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrentExecutions.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrentExecutions.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      provisionedConcurrencyUtilization:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencyUtilization.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencyUtilization.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.provisionedConcurrencyUtilization.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      unreservedConcurrentExecutions:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.unreservedConcurrentExecutions.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.unreservedConcurrentExecutions.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.unreservedConcurrentExecutions.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      claimedAccountConcurrency:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.claimedAccountConcurrency.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.claimedAccountConcurrency.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.claimedAccountConcurrency.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      asyncEventsReceived:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventsReceived.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventsReceived.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventsReceived.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      asyncEventAge:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventAge.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventAge.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventAge.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
      asyncEventsDropped:
        {
          byFunctionName(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventsDropped.byFunctionName(value)),
              identifier: '$' + identifier,
            },
          byResource(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventsDropped.byResource(value)),
              identifier: '$' + identifier,
            },
          byExecutedVersion(value, identifier):
            {
              query: grafana.dashboard.variable.query.new('$' + identifier, queries.asyncEventsDropped.byExecutedVersion(value)),
              identifier: '$' + identifier,
            },
        },
    },
}
