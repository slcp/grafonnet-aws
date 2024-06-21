local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  new(accountId, region, datasource):
    {
      local root = self,
      withContext(targets):
        [
          target
          + root.region
          + root.accountId
          + grafana.dashboard.variable.query.withDatasourceFromVariable(root.datasource)
          for target in targets
        ],
      region: region,
      accountId: accountId,
      datasource: datasource,
    },
}
