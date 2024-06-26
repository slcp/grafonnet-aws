local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  new():
    {
      local root = self,
      wrap(targets):
        [
          target
          + grafana.query.cloudWatch.CloudWatchMetricsQuery.withRegion(root.region)
          + grafana.query.cloudWatch.CloudWatchMetricsQuery.withAccountId(root.accountId)
          + grafana.dashboard.variable.query.withDatasourceFromVariable(root.datasource)
          for target in targets
        ],
    },
  withAccountId(value): {
    accountId: value,
  },
  withRegion(value): {
    region: value,
  },
  withDatasourceFromVariable(value): {
    datasource: value,
  },
}
