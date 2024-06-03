local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local lowerCaseFirstChar(s) = std.asciiLower(std.substr(s, 0, 1)) + std.substr(s, 1, 999/* Overflow to get the whole remainder */);

// This produces an object with functions named `with<Metric>` for each metric
local buildMetricsFuncs(metricsNamesArray, sourceLibrary) = std.foldl(function(result, item) result
                                                                                             {
                                                                        ['with' + item](): sourceLibrary.withNamespace()
                                                                                           + cloudwatchMetrics.withMetricName(item),
                                                                      },
                                                                      metricsNamesArray,
                                                                      {});

// This produces an object keyed by metric name whose value is `with<Dimension>` method for each metric and dimension
local buildConvenienceFuncs(metricsNamesArray, dimesonsNamesArray, sourceLibrary) =
  std.foldl(function(result, metric) result
                                     { [lowerCaseFirstChar(metric)]: std.foldl(function(result, dimension)
                                                                                 result
                                                                                 {
                                                                                   [dimension](value): sourceLibrary.metrics['with' + metric]()
                                                                                                       + sourceLibrary.dimensions[dimension](value),
                                                                                 },
                                                                               std.objectFields(sourceLibrary.dimensions),
                                                                               {}) },
            metricsNamesArray,
            {});

{
  buildMetricsFuncs: buildMetricsFuncs,
  buildDimensionFuncs: buildDimensionFuncs,
  buildConvenienceFuncs: buildConvenienceFuncs,
}
