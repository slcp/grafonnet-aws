local c = import '../../common.libsonnet';
local mc = import './common.libsonnet';

local destinationPath = 'targets/metrics/kinesis.libsonnet';
local namespace = 'AWS/Kinesis';
// TODO: Shard level metrics with ShardId dimension
local metrics = [
  'GetRecords.Bytes',
  'GetRecords.IteratorAge',
  'GetRecords.IteratorAgeMilliseconds',
  'GetRecords.Latency',
  'GetRecords.Records',
  'GetRecords.Success',
  'IncomingBytes',
  'IncomingRecords',
  'PutRecord.Bytes',
  'PutRecord.Latency',
  'PutRecord.Success',
  'PutRecords.Bytes',
  'PutRecords.Latency',
  'PutRecords.Success',
  'PutRecords.TotalRecords',
  'PutRecords.SuccessfulRecords',
  'PutRecords.FailedRecords',
  'PutRecords.ThrottledRecords',
  'ReadProvisionedThroughputExceeded',
  'SubscribeToShard.RateExceeded',
  'SubscribeToShard.Success',
  'SubscribeToShardEvent.Bytes',
  'SubscribeToShardEvent.MillisBehindLatest',
  'SubscribeToShardEvent.Records',
  'SubscribeToShardEvent.Success',
  'WriteProvisionedThroughputExceeded',
];
local dimensions = [
  'StreamName',
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
