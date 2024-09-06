local c = import '../../common.libsonnet';
local mc = import './common.libsonnet';

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
  render(): c.render(
    c.renderObjectToString(
      [mc.renderNamespace(namespace)]
      + [
        mc.renderMetrics(metrics),
        mc.renderDimensions(dimensions),
      ] + mc.renderHelpers(metrics, dimensions)
    ),
  ),
  metrics: metrics,
  dimensions: dimensions,
}
