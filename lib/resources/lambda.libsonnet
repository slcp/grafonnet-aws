local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local lambda = import '../targets/metrics/lambda.libsonnet';
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
}
