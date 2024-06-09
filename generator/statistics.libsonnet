local c = import './common.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local destinationPath = 'targets/metrics/statistics.libsonnet';

local statistics = ['Sum', 'Average', 'Maximum', 'Minimum'];

local renderStatistic(s) = a.field_function.new(
  a.id.new('with' + s),
  a.functioncall.new(a.literal.new(c.cloudWatchMetricsIdentifier + '.withStatistic'))
  + a.functioncall.withArgs(a.string.new(s)),
);
local renderStatistics(s) = std.map(renderStatistic, s);

{
  path: destinationPath,
  render(): c.render(
    c.renderObjectToString(
      renderStatistics(statistics)
    ),
  ),
}
