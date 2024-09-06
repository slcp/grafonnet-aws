local q = import '../lib/queries/lambda.libsonnet';
local qbase = import '../lib/queries/base.libsonnet';
local l = import '../lib/resources/lambda.libsonnet';
local c = import '../lib/targets/context.libsonnet';
local qc = import '../lib/queries/context.libsonnet';
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

local queryContext = qc.new()
                     + qc.withAccountId(accountId)
                     + qc.withRegion(region)
                     + qc.withDatasourceFromVariable(cloudwatchDatasource);


local exampleLambdaName = 'MyLambda';
// exampleLambdaQueryVariable will be used as the variable label but the variable name will be hashed - why?
local exampleLambdaQuery = qbase.new('exampleLambdaQueryVariable')
                            + q.invocations.byFunctionName('/.*' + exampleLambdaName + '.*/');
local exampleLambda = l.new(exampleLambdaName)
                      // Binding to `name` here will use the query output whenever resource name (eg. withFunctionName) is going to be used
                      + exampleLambdaQuery.bind('name');

local lambdaPanel = g.panel.timeSeries.new('Some lambda data')
                    + g.panel.timeSeries.standardOptions.withUnit('short')
                    + g.panel.timeSeries.options.withTooltip({ mode: 'multi' })
                    + g.panel.timeSeries.queryOptions.withTargetsMixin(context.wrap([
                      exampleLambda.targets.invocations.withSum(),
                      exampleLambda.targets.errors.withSum(),
                      exampleLambda.targets.duration.withAverage(),
                    ]));

local variables =  queryContext.wrap([exampleLambdaQuery]) + [cloudwatchDatasource];
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
