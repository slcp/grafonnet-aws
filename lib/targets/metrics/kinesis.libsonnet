local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  withNamespace(): cloudwatchMetrics.withNamespace('AWS/Kinesis'),
  metrics:
    {
      withGetRecordsBytes(): cloudwatchMetrics.withMetricName('GetRecords.Bytes') + $.withNamespace(),
      withGetRecordsIteratorAge(): cloudwatchMetrics.withMetricName('GetRecords.IteratorAge') + $.withNamespace(),
      withGetRecordsIteratorAgeMilliseconds(): cloudwatchMetrics.withMetricName('GetRecords.IteratorAgeMilliseconds') + $.withNamespace(),
      withGetRecordsLatency(): cloudwatchMetrics.withMetricName('GetRecords.Latency') + $.withNamespace(),
      withGetRecordsRecords(): cloudwatchMetrics.withMetricName('GetRecords.Records') + $.withNamespace(),
      withGetRecordsSuccess(): cloudwatchMetrics.withMetricName('GetRecords.Success') + $.withNamespace(),
      withIncomingBytes(): cloudwatchMetrics.withMetricName('IncomingBytes') + $.withNamespace(),
      withIncomingRecords(): cloudwatchMetrics.withMetricName('IncomingRecords') + $.withNamespace(),
      withPutRecordBytes(): cloudwatchMetrics.withMetricName('PutRecord.Bytes') + $.withNamespace(),
      withPutRecordLatency(): cloudwatchMetrics.withMetricName('PutRecord.Latency') + $.withNamespace(),
      withPutRecordSuccess(): cloudwatchMetrics.withMetricName('PutRecord.Success') + $.withNamespace(),
      withPutRecordsBytes(): cloudwatchMetrics.withMetricName('PutRecords.Bytes') + $.withNamespace(),
      withPutRecordsLatency(): cloudwatchMetrics.withMetricName('PutRecords.Latency') + $.withNamespace(),
      withPutRecordsSuccess(): cloudwatchMetrics.withMetricName('PutRecords.Success') + $.withNamespace(),
      withPutRecordsTotalRecords(): cloudwatchMetrics.withMetricName('PutRecords.TotalRecords') + $.withNamespace(),
      withPutRecordsSuccessfulRecords(): cloudwatchMetrics.withMetricName('PutRecords.SuccessfulRecords') + $.withNamespace(),
      withPutRecordsFailedRecords(): cloudwatchMetrics.withMetricName('PutRecords.FailedRecords') + $.withNamespace(),
      withPutRecordsThrottledRecords(): cloudwatchMetrics.withMetricName('PutRecords.ThrottledRecords') + $.withNamespace(),
      withReadProvisionedThroughputExceeded(): cloudwatchMetrics.withMetricName('ReadProvisionedThroughputExceeded') + $.withNamespace(),
      withSubscribeToShardRateExceeded(): cloudwatchMetrics.withMetricName('SubscribeToShard.RateExceeded') + $.withNamespace(),
      withSubscribeToShardSuccess(): cloudwatchMetrics.withMetricName('SubscribeToShard.Success') + $.withNamespace(),
      withSubscribeToShardEventBytes(): cloudwatchMetrics.withMetricName('SubscribeToShardEvent.Bytes') + $.withNamespace(),
      withSubscribeToShardEventMillisBehindLatest(): cloudwatchMetrics.withMetricName('SubscribeToShardEvent.MillisBehindLatest') + $.withNamespace(),
      withSubscribeToShardEventRecords(): cloudwatchMetrics.withMetricName('SubscribeToShardEvent.Records') + $.withNamespace(),
      withSubscribeToShardEventSuccess(): cloudwatchMetrics.withMetricName('SubscribeToShardEvent.Success') + $.withNamespace(),
      withWriteProvisionedThroughputExceeded(): cloudwatchMetrics.withMetricName('WriteProvisionedThroughputExceeded') + $.withNamespace(),
    },
  dimensions: {
    withStreamName(value): cloudwatchMetrics.withDimensions({
      StreamName: value,
    }),
  },
  getRecordsBytes: {
    withStreamName(value):
      $.metrics.withGetRecordsBytes()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  getRecordsIteratorAge: {
    withStreamName(value):
      $.metrics.withGetRecordsIteratorAge()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  getRecordsIteratorAgeMilliseconds: {
    withStreamName(value):
      $.metrics.withGetRecordsIteratorAgeMilliseconds()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  getRecordsLatency: {
    withStreamName(value):
      $.metrics.withGetRecordsLatency()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  getRecordsRecords: {
    withStreamName(value):
      $.metrics.withGetRecordsRecords()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  getRecordsSuccess: {
    withStreamName(value):
      $.metrics.withGetRecordsSuccess()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  incomingBytes: {
    withStreamName(value):
      $.metrics.withIncomingBytes()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  incomingRecords: {
    withStreamName(value):
      $.metrics.withIncomingRecords()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordBytes: {
    withStreamName(value):
      $.metrics.withPutRecordBytes()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordLatency: {
    withStreamName(value):
      $.metrics.withPutRecordLatency()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordSuccess: {
    withStreamName(value):
      $.metrics.withPutRecordSuccess()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordsBytes: {
    withStreamName(value):
      $.metrics.withPutRecordsBytes()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordsLatency: {
    withStreamName(value):
      $.metrics.withPutRecordsLatency()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordsSuccess: {
    withStreamName(value):
      $.metrics.withPutRecordsSuccess()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordsTotalRecords: {
    withStreamName(value):
      $.metrics.withPutRecordsTotalRecords()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordsSuccessfulRecords: {
    withStreamName(value):
      $.metrics.withPutRecordsSuccessfulRecords()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordsFailedRecords: {
    withStreamName(value):
      $.metrics.withPutRecordsFailedRecords()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  putRecordsThrottledRecords: {
    withStreamName(value):
      $.metrics.withPutRecordsThrottledRecords()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  readProvisionedThroughputExceeded: {
    withStreamName(value):
      $.metrics.withReadProvisionedThroughputExceeded()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  subscribeToShardRateExceeded: {
    withStreamName(value):
      $.metrics.withSubscribeToShardRateExceeded()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  subscribeToShardSuccess: {
    withStreamName(value):
      $.metrics.withSubscribeToShardSuccess()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  subscribeToShardEventBytes: {
    withStreamName(value):
      $.metrics.withSubscribeToShardEventBytes()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  subscribeToShardEventMillisBehindLatest: {
    withStreamName(value):
      $.metrics.withSubscribeToShardEventMillisBehindLatest()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  subscribeToShardEventRecords: {
    withStreamName(value):
      $.metrics.withSubscribeToShardEventRecords()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  subscribeToShardEventSuccess: {
    withStreamName(value):
      $.metrics.withSubscribeToShardEventSuccess()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
  writeProvisionedThroughputExceeded: {
    withStreamName(value):
      $.metrics.withWriteProvisionedThroughputExceeded()
      + $.dimensions.withStreamName(value)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
      + grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
  },
}
