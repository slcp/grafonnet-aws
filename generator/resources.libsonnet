local c = import './common.libsonnet';
local l = import './lambda.libsonnet';
local mc = import './metrics-common.libsonnet';
local s = import './statistics.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local destinationPath = 'resources/lambda.libsonnet';
local metricsRelativePath = '../targets/metrics';
local queriesRelativePath = '../queries';

local renderStatistic(s, fn) = a.field_function.new(
  a.id.new('with' + s),
  fn
);

local renderStatistics(sts, fn) = std.map(function(s) renderStatistic(s, fn), sts);

local renderTargetFunc(m) =
  a.field.new(
    a.id.new(c.lowerCaseFirstChar(m)),
    a.object.new(
      renderStatistics(
        s.statistics,
        a.functioncall.new(a.literal.new('lambda.' + c.lowerCaseFirstChar(m) + '.withFunctionName'))
        // TODO: How to access the name property of the calling object?
        + a.functioncall.withArgs(a.literal.new('root.name'))
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

local buildVarName() = a.binary.new('+', a.string.new('$'), a.literal.new('identifier'));

local renderDimensionHelper(d, m) =
  a.field_function.new(
    a.id.new('by' + d),
    a.object.new([
      a.field.new(
        a.id.new('query'),
        a.functioncall.new(a.literal.new('grafana.dashboard.variable.query.new'))
        + a.functioncall.withArgs([
          buildVarName(),
          a.functioncall.new(
            a.literal.new('queries.' + c.lowerCaseFirstChar(m) + '.by' + d)
          )
          + a.functioncall.withArgs(
            [
              a.literal.new('value'),
            ]
          ),
        ]),
      ),
      a.field.new(
        a.id.new('identifier'),
        buildVarName()
      ),
    ])
  )
  + a.field_function.withParams(
    a.params.new(
      [
        a.param.new(
          a.id.new('value')
        ),
        a.param.new(
          a.id.new('identifier')
        ),
      ]
    )
  );

local renderMetricHelper(m, dimensions) = a.field.new(
  a.id.new(c.lowerCaseFirstChar(m)),
  a.object.new(
    [
      renderDimensionHelper(d, m)
      for d in dimensions
    ]
  )
);

// + lambda.withQuery()
local renderQueryHelper(metrics, dimensions) =
  a.field.new(
    a.id.new('withQuery'),
    a.object.new(
      [
        renderMetricHelper(m, dimensions)
        for m in metrics
      ]
    )
  );

{
  path: destinationPath,
  render(): c.render(
    c.renderImportToLocalToString('lambda', metricsRelativePath + '/lambda.libsonnet')
    + c.renderImportToLocalToString('queries', queriesRelativePath + '/lambda.libsonnet')
    + c.renderImportToLocalToString('statistics', metricsRelativePath + '/statistics.libsonnet')
    + '\n'
    + c.renderObjectToString(
      [
        renderNew(),
        renderQueryHelper(l.metrics, l.dimensions),
      ]
    ),
  ),
}
