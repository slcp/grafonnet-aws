local c = import './common.libsonnet';
local l = import './lambda.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local destinationPath = 'resources/lambda.libsonnet';
local metricsRelativePath = '../targets/metrics';
local queriesRelativePath = '../queries/metrics';

local renderNew() =
  a.field_function.new(
    a.id.new('new'),
    a.object.new([
      a.field.new(
        a.id.new('name'),
        a.literal.new('name')
      ),
      a.field.new(
        a.id.new('raw_name'),
        a.literal.new('name')
      ),
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

local buildVarName(m, d) = a.binary.new('+', a.string.new('$'), a.literal.new('$.raw_name'));

local renderDimensionHelper(d, m) =
  a.field_function.new(
    a.id.new('by' + d),
    a.object.new([
      a.field.new(
        a.id.new('query'),
        a.functioncall.new(a.literal.new('grafana.dashboard.variable.query.new'))
        + a.functioncall.withArgs([
          buildVarName(m, d),
          a.functioncall.new(
            a.literal.new('queries.' + c.lowerCaseFirstChar(m) + '.by' + d)
          )
          + a.functioncall.withArgs(a.literal.new('value')),
        ]),
      ),
      a.field.new(
        a.id.new('name'),
        buildVarName(m, d)
      ),
    ])
  )
  + a.field_function.withParams(
    a.params.new(
      [
        a.param.new(
          a.id.new('value')
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

// root.[metric].by[dimension](regex)
local renderHelpers(metrics, dimensions) =
  a.field.new(
    a.id.new('buildQuery'),
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
    + c.renderImportToLocalToString('queries', queriesRelativePath + '/queries.libsonnet')
    + '\n'
    + c.renderObjectToString(
      [
        renderNew(),
        renderHelpers(l.metrics, l.dimensions),
      ]
    ),
  ),
}
