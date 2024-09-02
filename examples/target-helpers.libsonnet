local q = import '../lib/queries/lambda.libsonnet';
local l = import '../lib/resources/lambda.libsonnet';
local c = import '../lib/targets/context.libsonnet';
local lm = import '../lib/targets/metrics/lambda.libsonnet';
local s = import '../lib/targets/metrics/statistics.libsonnet';
local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local name = 'New dashboard';
local description = 'This is a new dashboard';

local cloudwatchDatasource = g.dashboard.variable.datasource.new('datasource', 'cloudwatch');
local accountId = '278393477552';  // OR $accountId
local region = 'eu-west-1';  // OR §region

local context = c.new()
                + c.withAccountId(accountId)
                + c.withRegion(region)
                + c.withDatasourceFromVariable(cloudwatchDatasource);

local exampleLambdaName = 'MyLambda';
local exampleLambda = l.new(exampleLambdaName)
                      // TODO: This is not great
                      + l.withQuery.invocations.byFunctionName('/.*' + exampleLambdaName + '.*/')
                      // TODO: Can we follow the context.wrap pattern here?
                      + q.withAccountId('278393477552');
local exampleLambdaWithoutQuery = l.new(exampleLambdaName);

local lambdaPanel = g.panel.timeSeries.new('Some lambda data')
                    + g.panel.timeSeries.standardOptions.withUnit('short')
                    + g.panel.timeSeries.options.withTooltip({ mode: 'multi' })
                    + g.panel.timeSeries.queryOptions.withTargetsMixin(context.wrap([
                      exampleLambda.targets.invocations.withSum(),
                      exampleLambda.targets.errors.withSum(),
                      exampleLambda.targets.duration.withAverage(),
                    ]));

local variables = [
  exampleLambda.query
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
