local c = import '../common.libsonnet';
local l = import '../targets/metrics/lambda.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local destinationPath = 'queries/lambda.libsonnet';
local metricsRelativePath = '../targets/metrics';

// Intened to be used with var.query.new() + lambda.invocations.byFunction.withFunctionName('functionName')
local renderDimensionHelper(d, m) =
  a.field_function.new(
    a.id.new('by' + d),
    a.binary_sum.new(
      [
        a.object.new([
          a.field.new(
            a.id.new('query'),
            a.binary_sum.new([
              a.functioncall.new(
                a.literal.new('lambda.metrics.with' + m)
              ),
              a.object.new(
                [
                  a.field.new(
                    a.id.new('dimensionKey'),
                    a.string.new(d)
                  ),
                  a.field.new(
                    a.id.new('queryType'),
                    a.string.new('dimensionValues')
                  ),
                ]
              ),
            ])
          )
          + a.field.withAdditive(true),
        ]),
        a.functioncall.new(a.literal.new('grafana.dashboard.variable.query.withRegex'))
        + a.functioncall.withArgs(a.literal.new('value')),
      ]
    )
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
local renderHelpers(metrics, dimensions) = [
  renderMetricHelper(m, dimensions)
  for m in metrics
];

local renderWithAccountId() =
  a.field_function.new(
    a.id.new('withAccountId'),
    a.object.new([
      a.field.new(
        a.id.new('query'),
        a.object.new([
          a.field.new(
            a.id.new('query'),
            a.object.new([
              a.field.new(
                a.id.new('accountId'),
                a.literal.new('value')
              ),
            ])
          )
          + a.field.withAdditive(true),
        ]),
      )
      + a.field.withAdditive(true),
    ]),
  )
  + a.field_function.withParams(
    a.params.new([
      a.param.new(a.id.new('value')),
    ]),
  );

{
  path: destinationPath,
  render(): c.render(
    c.renderImportToLocalToString('lambda', metricsRelativePath + '/lambda.libsonnet')
    + '\n'
    + c.renderObjectToString(
      renderHelpers(
        l.metrics,
        l.dimensions
      ) + [
        // TODO: Build an accountId construct and treat it as a first class citizen
        renderWithAccountId(),
      ]
    ), { renderCloudwatchMetrics: false, renderGrafana: true }
  ),
}
