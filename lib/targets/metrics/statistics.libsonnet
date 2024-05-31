local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

local statistics = ['Sum', 'Average', 'Maximum', 'Minimum'];

// This produces an object with a functions named `with<Statistic>` for each statistic
std.foldl(function(result, item) result
                                 {
            ['with' + item](): cloudwatchMetrics.withStatistic(item),
          },
          statistics,
          {})
