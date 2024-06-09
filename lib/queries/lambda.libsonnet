local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local lambda = import '../targets/metrics/lambda.libsonnet';

{
  invocations:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withInvocations() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withInvocations() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withInvocations() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  errors:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withErrors() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withErrors() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withErrors() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  deadLetterErrors:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withDeadLetterErrors() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withDeadLetterErrors() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withDeadLetterErrors() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  destinationDeliveryFailures:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withDestinationDeliveryFailures() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withDestinationDeliveryFailures() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withDestinationDeliveryFailures() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  throttles:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withThrottles() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withThrottles() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withThrottles() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  oversizedRecordCount:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withOversizedRecordCount() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withOversizedRecordCount() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withOversizedRecordCount() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  provisionedConcurrencyInvocations:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withProvisionedConcurrencyInvocations() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withProvisionedConcurrencyInvocations() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withProvisionedConcurrencyInvocations() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  provisionedConcurrencySpilloverInvocations:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withProvisionedConcurrencySpilloverInvocations() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withProvisionedConcurrencySpilloverInvocations() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withProvisionedConcurrencySpilloverInvocations() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  recursiveInvocationsDropped:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withRecursiveInvocationsDropped() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withRecursiveInvocationsDropped() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withRecursiveInvocationsDropped() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  duration:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withDuration() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withDuration() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withDuration() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  postRuntimeExtensionsDuration:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withPostRuntimeExtensionsDuration() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withPostRuntimeExtensionsDuration() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withPostRuntimeExtensionsDuration() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  iteratorAge:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withIteratorAge() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withIteratorAge() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withIteratorAge() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  offsetLag:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withOffsetLag() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withOffsetLag() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withOffsetLag() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  concurrentExecutions:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withConcurrentExecutions() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withConcurrentExecutions() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withConcurrentExecutions() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  provisionedConcurrentExecutions:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withProvisionedConcurrentExecutions() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withProvisionedConcurrentExecutions() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withProvisionedConcurrentExecutions() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  provisionedConcurrencyUtilization:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withProvisionedConcurrencyUtilization() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withProvisionedConcurrencyUtilization() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withProvisionedConcurrencyUtilization() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  unreservedConcurrentExecutions:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withUnreservedConcurrentExecutions() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withUnreservedConcurrentExecutions() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withUnreservedConcurrentExecutions() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  claimedAccountConcurrency:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withClaimedAccountConcurrency() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withClaimedAccountConcurrency() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withClaimedAccountConcurrency() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  asyncEventsReceived:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withAsyncEventsReceived() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withAsyncEventsReceived() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withAsyncEventsReceived() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  asyncEventAge:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withAsyncEventAge() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withAsyncEventAge() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withAsyncEventAge() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
  asyncEventsDropped:
    {
      byFunctionName(value): {
        query+: lambda.metrics.withAsyncEventsDropped() + {
          dimensionKey: 'FunctionName',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byResource(value): {
        query+: lambda.metrics.withAsyncEventsDropped() + {
          dimensionKey: 'Resource',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
      byExecutedVersion(value): {
        query+: lambda.metrics.withAsyncEventsDropped() + {
          dimensionKey: 'ExecutedVersion',
        },
      } + grafana.dashboard.variable.query.withRegex(value),
    },
}
