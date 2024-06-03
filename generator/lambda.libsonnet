local common = import './common.libsonnet';

local destinationPath = 'targets/metrics/lambda.libsonnet';
local namespace = 'AWS/Lambda';
local metrics = [
  'Invocations',
  'Errors',
  'DeadLetterErrors',
  'Throttles',
  'IteratorAge',
  'ConcurrentExecutions',
];

{
  path: destinationPath,
  render(): common.render(
    common.renderObjectToString(
      [common.renderNamespace(namespace)]
      + [
        common.renderMetrics(metrics),
      ]
    ),
  ),
}
