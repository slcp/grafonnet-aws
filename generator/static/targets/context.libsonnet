local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

{
  new():
    {
      local root = self,
      wrap(targets)::
        [
          local region = if std.objectHas(root, 'region') then
            grafana.query.cloudWatch.CloudWatchMetricsQuery.withRegion(root.region)
          else {};
          local accountId = if std.objectHas(root, 'accountId') then
            grafana.query.cloudWatch.CloudWatchMetricsQuery.withAccountId(root.accountId)
          else {};
          local datasource = if std.objectHas(root, 'datasource') then
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
