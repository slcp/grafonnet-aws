local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local lambda = import '../targets/metrics/lambda.libsonnet';
local queries = import '../queries/lambda.libsonnet';
local statistics = import '../targets/metrics/statistics.libsonnet';

{
  new(name):
    {
      local root = self,
      name: name,
      targets:
        {
          invocations:
            {
              withSum():
                lambda.invocations.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.invocations.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.invocations.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.invocations.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          errors:
            {
              withSum():
                lambda.errors.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.errors.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.errors.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.errors.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          deadLetterErrors:
            {
              withSum():
                lambda.deadLetterErrors.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.deadLetterErrors.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.deadLetterErrors.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.deadLetterErrors.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          destinationDeliveryFailures:
            {
              withSum():
                lambda.destinationDeliveryFailures.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.destinationDeliveryFailures.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.destinationDeliveryFailures.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.destinationDeliveryFailures.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          throttles:
            {
              withSum():
                lambda.throttles.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.throttles.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.throttles.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.throttles.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          oversizedRecordCount:
            {
              withSum():
                lambda.oversizedRecordCount.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.oversizedRecordCount.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.oversizedRecordCount.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.oversizedRecordCount.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          provisionedConcurrencyInvocations:
            {
              withSum():
                lambda.provisionedConcurrencyInvocations.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.provisionedConcurrencyInvocations.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.provisionedConcurrencyInvocations.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.provisionedConcurrencyInvocations.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          provisionedConcurrencySpilloverInvocations:
            {
              withSum():
                lambda.provisionedConcurrencySpilloverInvocations.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.provisionedConcurrencySpilloverInvocations.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.provisionedConcurrencySpilloverInvocations.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.provisionedConcurrencySpilloverInvocations.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          recursiveInvocationsDropped:
            {
              withSum():
                lambda.recursiveInvocationsDropped.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.recursiveInvocationsDropped.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.recursiveInvocationsDropped.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.recursiveInvocationsDropped.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          duration:
            {
              withSum():
                lambda.duration.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.duration.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.duration.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.duration.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          postRuntimeExtensionsDuration:
            {
              withSum():
                lambda.postRuntimeExtensionsDuration.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.postRuntimeExtensionsDuration.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.postRuntimeExtensionsDuration.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.postRuntimeExtensionsDuration.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          iteratorAge:
            {
              withSum():
                lambda.iteratorAge.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.iteratorAge.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.iteratorAge.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.iteratorAge.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          offsetLag:
            {
              withSum():
                lambda.offsetLag.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.offsetLag.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.offsetLag.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.offsetLag.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          concurrentExecutions:
            {
              withSum():
                lambda.concurrentExecutions.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.concurrentExecutions.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.concurrentExecutions.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.concurrentExecutions.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          provisionedConcurrentExecutions:
            {
              withSum():
                lambda.provisionedConcurrentExecutions.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.provisionedConcurrentExecutions.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.provisionedConcurrentExecutions.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.provisionedConcurrentExecutions.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          provisionedConcurrencyUtilization:
            {
              withSum():
                lambda.provisionedConcurrencyUtilization.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.provisionedConcurrencyUtilization.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.provisionedConcurrencyUtilization.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.provisionedConcurrencyUtilization.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          unreservedConcurrentExecutions:
            {
              withSum():
                lambda.unreservedConcurrentExecutions.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.unreservedConcurrentExecutions.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.unreservedConcurrentExecutions.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.unreservedConcurrentExecutions.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          claimedAccountConcurrency:
            {
              withSum():
                lambda.claimedAccountConcurrency.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.claimedAccountConcurrency.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.claimedAccountConcurrency.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.claimedAccountConcurrency.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          asyncEventsReceived:
            {
              withSum():
                lambda.asyncEventsReceived.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.asyncEventsReceived.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.asyncEventsReceived.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.asyncEventsReceived.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          asyncEventAge:
            {
              withSum():
                lambda.asyncEventAge.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.asyncEventAge.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.asyncEventAge.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.asyncEventAge.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
          asyncEventsDropped:
            {
              withSum():
                lambda.asyncEventsDropped.withFunctionName(root.name)
                + statistics.withSum(),
              withAverage():
                lambda.asyncEventsDropped.withFunctionName(root.name)
                + statistics.withAverage(),
              withMaximum():
                lambda.asyncEventsDropped.withFunctionName(root.name)
                + statistics.withMaximum(),
              withMinimum():
                lambda.asyncEventsDropped.withFunctionName(root.name)
                + statistics.withMinimum(),
            },
        },
    },
  withQuery:
    {
      invocations:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.invocations.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.invocations.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.invocations.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      errors:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.errors.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.errors.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.errors.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      deadLetterErrors:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.deadLetterErrors.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.deadLetterErrors.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.deadLetterErrors.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      destinationDeliveryFailures:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.destinationDeliveryFailures.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.destinationDeliveryFailures.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.destinationDeliveryFailures.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      throttles:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.throttles.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.throttles.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.throttles.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      oversizedRecordCount:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.oversizedRecordCount.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.oversizedRecordCount.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.oversizedRecordCount.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      provisionedConcurrencyInvocations:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.provisionedConcurrencyInvocations.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.provisionedConcurrencyInvocations.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.provisionedConcurrencyInvocations.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      provisionedConcurrencySpilloverInvocations:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.provisionedConcurrencySpilloverInvocations.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.provisionedConcurrencySpilloverInvocations.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.provisionedConcurrencySpilloverInvocations.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      recursiveInvocationsDropped:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.recursiveInvocationsDropped.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.recursiveInvocationsDropped.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.recursiveInvocationsDropped.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      duration:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.duration.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.duration.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.duration.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      postRuntimeExtensionsDuration:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.postRuntimeExtensionsDuration.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.postRuntimeExtensionsDuration.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.postRuntimeExtensionsDuration.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      iteratorAge:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.iteratorAge.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.iteratorAge.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.iteratorAge.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      offsetLag:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.offsetLag.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.offsetLag.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.offsetLag.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      concurrentExecutions:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.concurrentExecutions.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.concurrentExecutions.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.concurrentExecutions.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      provisionedConcurrentExecutions:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.provisionedConcurrentExecutions.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.provisionedConcurrentExecutions.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.provisionedConcurrentExecutions.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      provisionedConcurrencyUtilization:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.provisionedConcurrencyUtilization.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.provisionedConcurrencyUtilization.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.provisionedConcurrencyUtilization.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      unreservedConcurrentExecutions:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.unreservedConcurrentExecutions.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.unreservedConcurrentExecutions.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.unreservedConcurrentExecutions.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      claimedAccountConcurrency:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.claimedAccountConcurrency.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.claimedAccountConcurrency.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.claimedAccountConcurrency.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      asyncEventsReceived:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.asyncEventsReceived.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.asyncEventsReceived.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.asyncEventsReceived.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      asyncEventAge:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.asyncEventAge.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.asyncEventAge.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.asyncEventAge.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
      asyncEventsDropped:
        {
          byFunctionName(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byFunctionName'), {

                })
                + queries.asyncEventsDropped.byFunctionName(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byFunctionName'),
            },
          byResource(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byResource'), {

                })
                + queries.asyncEventsDropped.byResource(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byResource'),
            },
          byExecutedVersion(value):
            {
              query:
                grafana.dashboard.variable.query.new(std.md5(super.name
                                                             + 'byExecutedVersion'), {

                })
                + queries.asyncEventsDropped.byExecutedVersion(value),
              name:
                '$'
                + std.md5(super.name
                          + 'byExecutedVersion'),
            },
        },
    },
}
