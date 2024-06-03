local common = import './common.libsonnet';
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local metrics = [
  'Invocations',
  'Errors',
  'DeadLetterErrors',
  'Duration',
  'Throttles',
  'IteratorAge',
  'ConcurrentExecutions',
  'UnreservedConcurrentExecutions',
  'ProvisionedConcurrentExecutions',
  'ProvisionedConcurrencyUtilization',
  'ProvisionedConcurrencyInvocations',
  'ProvisionedConcurrencySpilloverInvocations',
];
local dimensions = [
  'FunctionName',
  'Resource',
  'ExecutedVersion',
];

local withNamespace = cloudwatchMetrics.withNamespace('AWS/Lambda');

local lib = {
  withNamespace(): withNamespace,
  metrics: common.buildMetricsFuncs(metrics, self),
  dimensions: common.buildDimensionFuncs(dimensions),
};

lib + common.buildConvenienceFuncs(metrics, dimensions, lib)
