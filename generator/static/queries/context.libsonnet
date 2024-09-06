local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local cloudwatchMetrics = grafana.query.cloudWatch.CloudWatchMetricsQuery;

{
  new():
    {
      local root = self,
      wrap(queries)::
        [
          local region = if std.objectHas(root, 'region') then {
            query+: {
              region: root.region,
            },
          }
          else {};
          local accountId = if std.objectHas(root, 'accountId') then {
            query+: {
              accountId: root.accountId,
            },
          }
          else {};
          local datasource = if std.objectHas(root, 'datasource') then
            grafana.dashboard.variable.query.withDatasourceFromVariable(root.datasource)
          else {};

          query
          + region
          + datasource
          + accountId
          for query in queries
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
