local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local kinesis = import '../targets/metrics/kinesis.libsonnet';

{
  getRecordsBytes: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withGetRecordsBytes()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  getRecordsIteratorAge: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withGetRecordsIteratorAge()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  getRecordsIteratorAgeMilliseconds: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withGetRecordsIteratorAgeMilliseconds()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  getRecordsLatency: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withGetRecordsLatency()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  getRecordsRecords: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withGetRecordsRecords()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  getRecordsSuccess: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withGetRecordsSuccess()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  incomingBytes: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withIncomingBytes()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  incomingRecords: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withIncomingRecords()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordBytes: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordBytes()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordLatency: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordLatency()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordSuccess: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordSuccess()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordsBytes: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordsBytes()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordsLatency: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordsLatency()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordsSuccess: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordsSuccess()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordsTotalRecords: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordsTotalRecords()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordsSuccessfulRecords: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordsSuccessfulRecords()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordsFailedRecords: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordsFailedRecords()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  putRecordsThrottledRecords: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withPutRecordsThrottledRecords()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  readProvisionedThroughputExceeded: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withReadProvisionedThroughputExceeded()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  subscribeToShardRateExceeded: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withSubscribeToShardRateExceeded()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  subscribeToShardSuccess: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withSubscribeToShardSuccess()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  subscribeToShardEventBytes: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withSubscribeToShardEventBytes()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  subscribeToShardEventMillisBehindLatest: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withSubscribeToShardEventMillisBehindLatest()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  subscribeToShardEventRecords: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withSubscribeToShardEventRecords()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  subscribeToShardEventSuccess: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withSubscribeToShardEventSuccess()
          + {
            dimensionKey: 'StreamName',
            queryType: 'dimensionValues',
          },
      }
      + grafana.dashboard.variable.query.withRegex(value),
  },
  writeProvisionedThroughputExceeded: {
    byStreamName(value):
      {
        query+:
          kinesis.metrics.withWriteProvisionedThroughputExceeded()
          + {
            dimensionKey: 'StreamName',
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
