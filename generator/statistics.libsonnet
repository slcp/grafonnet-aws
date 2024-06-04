local common = import './common.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local destinationPath = 'targets/metrics/statistics.libsonnet';

local statistics = ['Sum', 'Average', 'Maximum', 'Minimum'];

local cloudWatchMetricsIdentifier = 'cloudwatchMetrics';

local renderStatistic(s) = a.field_function.new(
  a.id.new('with' + s),
  a.functioncall.new(a.literal.new(cloudWatchMetricsIdentifier + '.withStatistic'))
  + a.functioncall.withArgs(a.string.new(s)),
);
local renderStatistics(s) = std.map(renderStatistic, s);

{
  path: destinationPath,
  render(): common.render(
    common.renderObjectToString(
      renderStatistics(statistics)
    ),
  ),
}
