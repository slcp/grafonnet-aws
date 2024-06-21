local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local lambda = import '../targets/metrics/lambda.libsonnet';

{
  invocations:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withInvocations()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withInvocations()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withInvocations()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  errors:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withErrors()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withErrors()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withErrors()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  deadLetterErrors:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withDeadLetterErrors()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withDeadLetterErrors()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withDeadLetterErrors()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  destinationDeliveryFailures:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withDestinationDeliveryFailures()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withDestinationDeliveryFailures()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withDestinationDeliveryFailures()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  throttles:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withThrottles()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withThrottles()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withThrottles()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  oversizedRecordCount:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withOversizedRecordCount()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withOversizedRecordCount()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withOversizedRecordCount()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  provisionedConcurrencyInvocations:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencyInvocations()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencyInvocations()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencyInvocations()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  provisionedConcurrencySpilloverInvocations:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencySpilloverInvocations()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencySpilloverInvocations()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencySpilloverInvocations()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  recursiveInvocationsDropped:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withRecursiveInvocationsDropped()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withRecursiveInvocationsDropped()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withRecursiveInvocationsDropped()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  duration:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withDuration()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withDuration()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withDuration()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  postRuntimeExtensionsDuration:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withPostRuntimeExtensionsDuration()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withPostRuntimeExtensionsDuration()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withPostRuntimeExtensionsDuration()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  iteratorAge:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withIteratorAge()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withIteratorAge()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withIteratorAge()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  offsetLag:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withOffsetLag()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withOffsetLag()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withOffsetLag()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  concurrentExecutions:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withConcurrentExecutions()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withConcurrentExecutions()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withConcurrentExecutions()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  provisionedConcurrentExecutions:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrentExecutions()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrentExecutions()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrentExecutions()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  provisionedConcurrencyUtilization:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencyUtilization()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencyUtilization()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withProvisionedConcurrencyUtilization()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  unreservedConcurrentExecutions:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withUnreservedConcurrentExecutions()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withUnreservedConcurrentExecutions()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withUnreservedConcurrentExecutions()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  claimedAccountConcurrency:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withClaimedAccountConcurrency()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withClaimedAccountConcurrency()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withClaimedAccountConcurrency()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  asyncEventsReceived:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withAsyncEventsReceived()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withAsyncEventsReceived()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withAsyncEventsReceived()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  asyncEventAge:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withAsyncEventAge()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withAsyncEventAge()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withAsyncEventAge()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  asyncEventsDropped:
    {
      byFunctionName(value):
        {
          query+:
            lambda.metrics.withAsyncEventsDropped()
            + {
              dimensionKey: 'FunctionName',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byResource(value):
        {
          query+:
            lambda.metrics.withAsyncEventsDropped()
            + {
              dimensionKey: 'Resource',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value):
        {
          query+:
            lambda.metrics.withAsyncEventsDropped()
            + {
              dimensionKey: 'ExecutedVersion',
            },
        }
        + {
          query+: {
            queryType: 'dimensionValues',
          },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
}
