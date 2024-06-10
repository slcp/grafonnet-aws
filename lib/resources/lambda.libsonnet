local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local lambda = import '../targets/metrics/lambda.libsonnet';
local queries = import '../queries/metrics/queries.libsonnet';

{
  new(name):
    {
      name: name,
      raw_name: name,
    },
  buildQuery:
    {
      invocations:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.invocations.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.invocations.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.invocations.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      errors:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.errors.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.errors.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.errors.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      deadLetterErrors:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.deadLetterErrors.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.deadLetterErrors.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.deadLetterErrors.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      destinationDeliveryFailures:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.destinationDeliveryFailures.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.destinationDeliveryFailures.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.destinationDeliveryFailures.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      throttles:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.throttles.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.throttles.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.throttles.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      oversizedRecordCount:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.oversizedRecordCount.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.oversizedRecordCount.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.oversizedRecordCount.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      provisionedConcurrencyInvocations:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencyInvocations.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencyInvocations.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencyInvocations.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      provisionedConcurrencySpilloverInvocations:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencySpilloverInvocations.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencySpilloverInvocations.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencySpilloverInvocations.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      recursiveInvocationsDropped:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.recursiveInvocationsDropped.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.recursiveInvocationsDropped.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.recursiveInvocationsDropped.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      duration:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.duration.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.duration.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.duration.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      postRuntimeExtensionsDuration:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.postRuntimeExtensionsDuration.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.postRuntimeExtensionsDuration.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.postRuntimeExtensionsDuration.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      iteratorAge:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.iteratorAge.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.iteratorAge.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.iteratorAge.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      offsetLag:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.offsetLag.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.offsetLag.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.offsetLag.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      concurrentExecutions:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.concurrentExecutions.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.concurrentExecutions.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.concurrentExecutions.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      provisionedConcurrentExecutions:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrentExecutions.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrentExecutions.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrentExecutions.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      provisionedConcurrencyUtilization:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencyUtilization.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencyUtilization.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.provisionedConcurrencyUtilization.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      unreservedConcurrentExecutions:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.unreservedConcurrentExecutions.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.unreservedConcurrentExecutions.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.unreservedConcurrentExecutions.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      claimedAccountConcurrency:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.claimedAccountConcurrency.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.claimedAccountConcurrency.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.claimedAccountConcurrency.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      asyncEventsReceived:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventsReceived.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventsReceived.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventsReceived.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      asyncEventAge:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventAge.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventAge.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventAge.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
      asyncEventsDropped:
        {
          byFunctionName(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventsDropped.byFunctionName(value)),
              name: '$' + $.raw_name,
            },
          byResource(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventsDropped.byResource(value)),
              name: '$' + $.raw_name,
            },
          byExecutedVersion(value):
            {
              query: grafana.dashboard.variable.query.new('$' + $.raw_name, queries.asyncEventsDropped.byExecutedVersion(value)),
              name: '$' + $.raw_name,
            },
        },
    },
}
