local l = import '../lib/resources/lambda.libsonnet';
local lm = import '../lib/targets/metrics/lambda.libsonnet';
local s = import '../lib/targets/metrics/statistics.libsonnet';
local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local name = 'New dashboard';
local description = 'This is a new dashboard';

local cloudwatchDatasource = g.dashboard.variable.datasource.new('datasource', 'cloudwatch');

local exampleLambdaName = 'TelemetryCore-TelemetrySt-InfluxWriterByReadings00';
local exampleLambdaWithQuery = l.new(exampleLambdaName)
                               + l.withQuery.invocations.byFunctionName('/.*' + exampleLambdaName + '.*/');
local exampleLambdaWithoutQuery = l.new(exampleLambdaName);

local lambdaPanel = g.panel.timeSeries.new('Some lambda data')
                    + g.panel.timeSeries.standardOptions.withUnit('short')
                    + g.panel.timeSeries.options.withTooltip({ mode: 'multi' })
                    + g.panel.timeSeries.queryOptions.withTargetsMixin([
                      exampleLambdaWithQuery.targets.invocations.withSum()
                      + g.dashboard.variable.query.withDatasourceFromVariable(cloudwatchDatasource)
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withAccountId('278393477552')
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withRegion('eu-west-1')
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
                      lm.invocations.withFunctionName(exampleLambdaWithoutQuery.name)
                      + s.withSum()
                      + g.dashboard.variable.query.withDatasourceFromVariable(cloudwatchDatasource)
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withAccountId('278393477552')
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withRegion('eu-west-1')
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withMetricQueryType(0)
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withMetricEditorMode(0)
                      + g.query.cloudWatch.CloudWatchMetricsQuery.withQueryMode('Metrics'),
                    ]);

local variables = [
  exampleLambdaWithQuery.query
  + g.dashboard.variable.query.withDatasourceFromVariable(cloudwatchDatasource),
  cloudwatchDatasource,
];
local panelWidth = 24;
local panels = [lambdaPanel];

local dashboard = g.dashboard.new(name)
                  + g.dashboard.withDescription(description)
                  + g.dashboard.withVariablesMixin(variables)
                  + g.dashboard.withPanelsMixin(
                    g.util.grid.makeGrid(panels, panelWidth=panelWidth)
                  );

{
  path: 'target-helpers-dashboard.json',
  content: dashboard,
}
