local c = import '../common.libsonnet';
local s = import '../statistics.libsonnet';
local mc = import '../targets/metrics/common.libsonnet';
local l = import '../targets/metrics/kinesis.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local destinationPath = 'resources/kinesis.libsonnet';
local metricsRelativePath = '../targets/metrics';

local renderStatistic(s, fn) = a.field_function.new(
  a.id.new('with' + s),
  a.binary_sum.new([
    fn,
    a.functioncall.new(a.literal.new('statistics.with' + s)),
  ])
);

local renderStatistics(sts, fn) = std.map(function(s) renderStatistic(s, fn), sts);

local renderTargetFunc(m) =
  a.field.new(
    a.id.new(c.sanitizeMetricName(c.lowerCaseFirstChar(m))),
    a.object.new(
      renderStatistics(
        s.statistics,
        // TODO: Dynamically build for all dimesnions with resources
        a.functioncall.new(a.literal.new('kinesis.' + c.sanitizeMetricName(c.lowerCaseFirstChar(m)) + '.withStreamName'))
        + a.functioncall.withArgs(a.literal.new('root.name')),
      )
    )
  );

local renderTargetFuncs(metrics) =
  std.map(
    renderTargetFunc, metrics
  );

local renderTargetHelpers(metrics) = a.field.new(
  a.id.new('targets'),
  a.object.new(renderTargetFuncs(metrics))
);

local renderNew() =
  a.field_function.new(
    a.id.new('new'),
    a.object.new([
      a.bind.new(
        a.id.new('local root'),
        a.literal.new('self')
      ),
      a.field.new(
        a.id.new('name'),
        a.literal.new('name')
      ),
      renderTargetHelpers(l.metrics),
    ]),
  )
  + a.field_function.withParams(
    a.params.new(
      [
        a.param.new(
          a.id.new('name')
        ),
      ]
    )
  );

{
  path: destinationPath,
  render(): c.render(
    c.renderImportToLocalToString('kinesis', metricsRelativePath + '/kinesis.libsonnet')
    + c.renderImportToLocalToString('statistics', metricsRelativePath + '/statistics.libsonnet')
    + '\n'
    + c.renderObjectToString([renderNew()]),
  ),
}