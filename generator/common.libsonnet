// Imports
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

// Internal
local lowerCaseFirstChar(s) = std.asciiLower(std.substr(s, 0, 1)) + std.substr(s, 1, 99/* Overflow to get the whole remainder */);
local cloudWatchMetricsIdentifier = 'cloudwatchMetrics';

// Helpers
local renderMetricFunc(m) =
  (a.field_function.new(
     a.id.new('with' + m),
     a.binary.new(
       '+',
       a.functioncall.new(
         a.literal.new(cloudWatchMetricsIdentifier + '.withMetricName')
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

local renderMetrics(metrics) = a.field.new(a.id.new('metrics'),
                                           a.object.new(renderMetricFuncs(metrics)));

local renderObjectToString(members) = a.object.new(members).toString();

local renderLocalBindToString(var, value) = a.local_bind.new(a.bind.new(
  a.id.new(var),
  value
), a.literal.new('')).toString();

local renderImportToLocalToString(var, path) = renderLocalBindToString(var, a.import_statement.new(path));

local renderNamespace(namespace) = a.field_function.new(
  a.id.new('withNamespace'),
  a.functioncall.new(a.literal.new(cloudWatchMetricsIdentifier + '.withNamespace'))
  + a.functioncall.withArgs(a.string.new(namespace)),
);

local renderDimensionFunc(d) =
  a.field_function.new(
    a.id.new('with' + d),
    a.functioncall.new(
      a.literal.new(cloudWatchMetricsIdentifier + '.withDimensions')
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

local renderDimensions(dimensions) = a.field.new(a.id.new('dimensions'),
                                                 a.object.new(renderDimensionsFuncs(dimensions)));

local renderDimensionHelper(d, m) =
  a.field_function.new(
    a.id.new('with' + d),
    a.binary.new(
      '+',
      a.functioncall.new(
        a.literal.new('$' + '.metrics.with' + m)
      ),
      a.functioncall.new(
        a.literal.new('$' + '.dimensions.with' + d)
      )
      + a.functioncall.withArgs(a.literal.new('value'))
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
  a.id.new(lowerCaseFirstChar(m)),
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
  renderObjectToString: renderObjectToString,
  renderMetrics: renderMetrics,
  renderNamespace: renderNamespace,
  renderDimensions: renderDimensions,
  renderHelpers: renderHelpers,
  render(contents): renderImportToLocalToString('grafana', 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet')
                    + renderLocalBindToString(cloudWatchMetricsIdentifier, a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery'))
                    + '\n'
                    + contents,
}
