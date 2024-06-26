local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  new():
    {
      local root = self,
      wrap(targets)::
        [
          local region = if root.region != null then
            grafana.query.cloudWatch.CloudWatchMetricsQuery.withRegion(root.region)
          else {};
          local datasource = if root.datasource != null then
            grafana.query.cloudWatch.CloudWatchMetricsQuery.withAccountId(root.accountId)
          else {};
          local accountId = if root.accountId != null then
            grafana.dashboard.variable.query.withDatasourceFromVariable(root.datasource)
          else {};

          target
          + region
          + datasource
          + accountId
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
