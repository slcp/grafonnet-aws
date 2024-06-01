local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local metrics = ['Invocations'];
local dimensions = ['FunctionName'];

local lowerCaseFirstChar(s) = std.asciiLower(std.substr(s, 0, 1)) + std.substr(s, 1, 99/* Overflow to get the whole remainder */);
local withNamespace = cloudwatchMetrics.withNamespace('AWS/Lambda');

{
  withNamespace(): withNamespace,
  // This produces an object with functions named `with<Metric>` for each metric
  metrics: std.foldl(function(result, item) result
                                            {
                       ['with' + item](): $.withNamespace()
                                          + cloudwatchMetrics.withMetricName(item),
                     },
                     metrics,
                     {}),
  // This produces an object with functions named `with<Dimension>` for each dimension
  dimensions: std.foldl(function(result, item) result
                                               {
                          ['with' + item](value): cloudwatchMetrics.withDimensions({
                            [item]: value,
                          }),
                        },
                        dimensions,
                        {}),
} +
// This produces an object keyed by metic name whose value is `with<Dimension>` method for each metric and dimension
std.foldl(function(result, metric) result
                                   { [lowerCaseFirstChar(metric)]: std.foldl(function(result, dimension)
                                                                               result
                                                                               {
                                                                                 [dimension](value): $.metrics['with' + metric]()
                                                                                                     + $.dimensions[dimension](value),
                                                                               },
                                                                             std.objectFields($.dimensions),
                                                                             {}) },
          metrics,
          {})
