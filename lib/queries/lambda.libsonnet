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
              queryType: 'dimensionValues',
            },
        }
        + grafana.dashboard.variable.query.withRegex(value),
    },
  withAccountId(value): {
    query+: {
      query+: {
        accountId: value,
      },
    },
  },
}
