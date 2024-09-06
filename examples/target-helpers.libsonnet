local lambdaQuery = import '../lib/queries/lambda.libsonnet';
local qbase = import '../lib/queries/base.libsonnet';
local lambda = import '../lib/resources/lambda.libsonnet';
local targetContext = import '../lib/targets/context.libsonnet';
local queryContext = import '../lib/queries/context.libsonnet';
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local name = 'New dashboard';
local description = 'This is a new dashboard';

local cloudwatchDatasource = grafana.dashboard.variable.datasource.new('datasource', 'cloudwatch');
local accountId = '278393477552';  // OR $accountId
local region = 'eu-west-1';  // OR §region

local builtTargetContext = targetContext.new()
                + targetContext.withAccountId(accountId)
                + targetContext.withRegion(region)
                + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

local builtQueryContext = queryContext.new()
                     + queryContext.withAccountId(accountId)
                     + queryContext.withRegion(region)
                     + queryContext.withDatasourceFromVariable(cloudwatchDatasource);


local exampleLambdaName = 'MyLambda';
// exampleLambdaQueryVariable will be used as the variable label but the variable name will be hashed - why?
local exampleLambdaQuery = qbase.new('exampleLambdaQueryVariable')
                            + lambdaQuery.invocations.byFunctionName('/.*' + exampleLambdaName + '.*/');
local exampleLambda = lambda.new(exampleLambdaName)
                      // Binding to `name` here will use the query output whenever resource name (egrafana. withFunctionName) is going to be used
                      + exampleLambdaQuery.bind('name');

local lambdaPanel = grafana.panel.timeSeries.new('Some lambda data')
                    + grafana.panel.timeSeries.standardOptions.withUnit('short')
                    + grafana.panel.timeSeries.options.withTooltip({ mode: 'multi' })
                    + grafana.panel.timeSeries.queryOptions.withTargetsMixin(builtTargetContext.wrap([
                      exampleLambda.targets.invocations.withSum(),
                      exampleLambda.targets.errors.withSum(),
                      exampleLambda.targets.duration.withAverage(),
                    ]));

local variables =  builtQueryContext.wrap([exampleLambdaQuery]) + [cloudwatchDatasource];
local panelWidth = 24;
local panels = [lambdaPanel];

local dashboard = grafana.dashboard.new(name)
                  + grafana.dashboard.withDescription(description)
                  + grafana.dashboard.withVariablesMixin(variables)
                  + grafana.dashboard.withPanelsMixin(
                    grafana.util.grid.makeGrid(panels, panelWidth=panelWidth)
                  );

{
  path: 'target-helpers-dashboard.json',
  content: dashboard,
}
