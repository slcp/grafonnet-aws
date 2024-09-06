// Imports
local c = import '../../common.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

// Helpers
local renderMetricFunc(m) =
  (a.field_function.new(
     a.id.new('with' + c.sanitizeMetricName(m)),
     a.binary.new(
       '+',
       a.functioncall.new(
         a.literal.new(c.cloudWatchMetricsIdentifier + '.withMetricName')
       )
       + a.functioncall.withArgs(a.string.new(m)),
       a.functioncall.new(
         a.literal.new('$' + '.withNamespace')
       )
     )
   ));

local renderMetricFuncs(metrics) =
  std.map(
    renderMetricFunc, metrics
  );

local renderMetrics(metrics) = a.field.new(
  a.id.new('metrics'),
  a.object.new(renderMetricFuncs(metrics))
);

local renderNamespace(namespace) = a.field_function.new(
  a.id.new('withNamespace'),
  a.functioncall.new(a.literal.new(c.cloudWatchMetricsIdentifier + '.withNamespace'))
  + a.functioncall.withArgs(a.string.new(namespace)),
);

local renderDimensionFunc(d) =
  a.field_function.new(
    a.id.new('with' + d),
    a.functioncall.new(
      a.literal.new(c.cloudWatchMetricsIdentifier + '.withDimensions')
    )
    + a.functioncall.withArgs(
      a.object.new([
        a.field.new(
          a.id.new(d),
          a.literal.new('value')
        ),
      ])
    )
  )
  + a.field_function.withParams(
    a.params.new([
      a.param.new(
        a.id.new('value')
      ),
    ])
  );

local renderDimensionsFuncs(dimensions) =
  std.map(
    renderDimensionFunc, dimensions
  );

local renderDimensions(dimensions) = a.field.new(
  a.id.new('dimensions'),
  a.object.new(renderDimensionsFuncs(dimensions))
);

local renderDimensionHelper(d, m) =
  a.field_function.new(
    a.id.new('with' + d),
    a.binary_sum.new([
      a.functioncall.new(
        a.literal.new('$' + '.metrics.with' + c.sanitizeMetricName(m))
      ),
      a.functioncall.new(
        a.literal.new('$' + '.dimensions.with' + d)
      )
      + a.functioncall.withArgs(a.literal.new('value')),
      a.functioncall.new(a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType'))
      + a.functioncall.withArgs(a.literal.new(0)),
      a.functioncall.new(a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode'))
      + a.functioncall.withArgs(a.literal.new(0)),
      a.functioncall.new(a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode'))
      + a.functioncall.withArgs(a.string.new('Metrics')),
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
  a.id.new(c.sanitizeMetricName(c.lowerCaseFirstChar(m))),
  a.object.new(
    [
      renderDimensionHelper(d, m)
      for d in dimensions
    ]
  )
);

// root.[metric].with[dimension](value)
local renderHelpers(metrics, dimensions) = [
  renderMetricHelper(m, dimensions)
  for m in metrics
];

// Output
{
  renderMetrics: renderMetrics,
  renderNamespace: renderNamespace,
  renderDimensions: renderDimensions,
  renderHelpers: renderHelpers,
}
