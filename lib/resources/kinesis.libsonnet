local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local kinesis = import '../targets/metrics/kinesis.libsonnet';
local statistics = import '../targets/metrics/statistics.libsonnet';

{
  new(name):
    {
      local root = self,
      name: name,
      targets:
        {
          getRecordsBytes:
            {
              withSum():
                kinesis.getRecordsBytes.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.getRecordsBytes.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.getRecordsBytes.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.getRecordsBytes.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          getRecordsIteratorAge:
            {
              withSum():
                kinesis.getRecordsIteratorAge.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.getRecordsIteratorAge.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.getRecordsIteratorAge.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.getRecordsIteratorAge.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          getRecordsIteratorAgeMilliseconds:
            {
              withSum():
                kinesis.getRecordsIteratorAgeMilliseconds.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.getRecordsIteratorAgeMilliseconds.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.getRecordsIteratorAgeMilliseconds.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.getRecordsIteratorAgeMilliseconds.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          getRecordsLatency:
            {
              withSum():
                kinesis.getRecordsLatency.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.getRecordsLatency.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.getRecordsLatency.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.getRecordsLatency.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          getRecordsRecords:
            {
              withSum():
                kinesis.getRecordsRecords.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.getRecordsRecords.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.getRecordsRecords.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.getRecordsRecords.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          getRecordsSuccess:
            {
              withSum():
                kinesis.getRecordsSuccess.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.getRecordsSuccess.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.getRecordsSuccess.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.getRecordsSuccess.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          incomingBytes:
            {
              withSum():
                kinesis.incomingBytes.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.incomingBytes.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.incomingBytes.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.incomingBytes.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          incomingRecords:
            {
              withSum():
                kinesis.incomingRecords.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.incomingRecords.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.incomingRecords.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.incomingRecords.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordBytes:
            {
              withSum():
                kinesis.putRecordBytes.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordBytes.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordBytes.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordBytes.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordLatency:
            {
              withSum():
                kinesis.putRecordLatency.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordLatency.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordLatency.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordLatency.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordSuccess:
            {
              withSum():
                kinesis.putRecordSuccess.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordSuccess.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordSuccess.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordSuccess.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordsBytes:
            {
              withSum():
                kinesis.putRecordsBytes.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordsBytes.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordsBytes.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordsBytes.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordsLatency:
            {
              withSum():
                kinesis.putRecordsLatency.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordsLatency.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordsLatency.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordsLatency.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordsSuccess:
            {
              withSum():
                kinesis.putRecordsSuccess.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordsSuccess.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordsSuccess.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordsSuccess.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordsTotalRecords:
            {
              withSum():
                kinesis.putRecordsTotalRecords.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordsTotalRecords.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordsTotalRecords.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordsTotalRecords.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordsSuccessfulRecords:
            {
              withSum():
                kinesis.putRecordsSuccessfulRecords.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordsSuccessfulRecords.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordsSuccessfulRecords.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordsSuccessfulRecords.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordsFailedRecords:
            {
              withSum():
                kinesis.putRecordsFailedRecords.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordsFailedRecords.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordsFailedRecords.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordsFailedRecords.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          putRecordsThrottledRecords:
            {
              withSum():
                kinesis.putRecordsThrottledRecords.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.putRecordsThrottledRecords.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.putRecordsThrottledRecords.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.putRecordsThrottledRecords.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          readProvisionedThroughputExceeded:
            {
              withSum():
                kinesis.readProvisionedThroughputExceeded.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.readProvisionedThroughputExceeded.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.readProvisionedThroughputExceeded.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.readProvisionedThroughputExceeded.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          subscribeToShardRateExceeded:
            {
              withSum():
                kinesis.subscribeToShardRateExceeded.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.subscribeToShardRateExceeded.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.subscribeToShardRateExceeded.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.subscribeToShardRateExceeded.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          subscribeToShardSuccess:
            {
              withSum():
                kinesis.subscribeToShardSuccess.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.subscribeToShardSuccess.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.subscribeToShardSuccess.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.subscribeToShardSuccess.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          subscribeToShardEventBytes:
            {
              withSum():
                kinesis.subscribeToShardEventBytes.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.subscribeToShardEventBytes.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.subscribeToShardEventBytes.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.subscribeToShardEventBytes.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          subscribeToShardEventMillisBehindLatest:
            {
              withSum():
                kinesis.subscribeToShardEventMillisBehindLatest.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.subscribeToShardEventMillisBehindLatest.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.subscribeToShardEventMillisBehindLatest.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.subscribeToShardEventMillisBehindLatest.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          subscribeToShardEventRecords:
            {
              withSum():
                kinesis.subscribeToShardEventRecords.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.subscribeToShardEventRecords.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.subscribeToShardEventRecords.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.subscribeToShardEventRecords.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          subscribeToShardEventSuccess:
            {
              withSum():
                kinesis.subscribeToShardEventSuccess.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.subscribeToShardEventSuccess.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.subscribeToShardEventSuccess.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.subscribeToShardEventSuccess.withStreamName(root.name)
                + statistics.withMinimum(),
            },
          writeProvisionedThroughputExceeded:
            {
              withSum():
                kinesis.writeProvisionedThroughputExceeded.withStreamName(root.name)
                + statistics.withSum(),
              withAverage():
                kinesis.writeProvisionedThroughputExceeded.withStreamName(root.name)
                + statistics.withAverage(),
              withMaximum():
                kinesis.writeProvisionedThroughputExceeded.withStreamName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                kinesis.writeProvisionedThroughputExceeded.withStreamName(root.name)
                + statistics.withMinimum(),
            },
        },
    },
}
