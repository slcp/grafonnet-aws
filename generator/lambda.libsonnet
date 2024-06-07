local common = import './common.libsonnet';

local destinationPath = 'targets/metrics/lambda.libsonnet';
local namespace = 'AWS/Lambda';
local metrics = [
  'Invocations',
  'Errors',
  'DeadLetterErrors',
  'DestinationDeliveryFailures',
  'Throttles',
  'OversizedRecordCount',
  'ProvisionedConcurrencyInvocations',
  'ProvisionedConcurrencySpilloverInvocations',
  'RecursiveInvocationsDropped',
  'Duration',
  'PostRuntimeExtensionsDuration',
  'IteratorAge',
  'OffsetLag',
  'ConcurrentExecutions',
  'ProvisionedConcurrentExecutions',
  'ProvisionedConcurrencyUtilization',
  'UnreservedConcurrentExecutions',
  'ClaimedAccountConcurrency',
  'AsyncEventsReceived',
  'AsyncEventAge',
  'AsyncEventsDropped',
];
local dimensions = [
  'FunctionName',
  'Resource',
  'ExecutedVersion',
];

{
  path: destinationPath,
  render(): common.render(
    common.renderObjectToString(
      [common.renderNamespace(namespace)]
      + [
        common.renderMetrics(metrics),
        common.renderDimensions(dimensions),
      ] + common.renderHelpers(metrics, dimensions)
    ),
  ),
  metrics: metrics,
  dimensions: dimensions,
}
