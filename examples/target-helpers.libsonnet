local qbase = import '../lib/queries/base.libsonnet';
local queryContext = import '../lib/queries/context.libsonnet';
local kinesisQuery = import '../lib/queries/kinesis.libsonnet';
local lambdaQuery = import '../lib/queries/lambda.libsonnet';
local kinesis = import '../lib/resources/kinesis.libsonnet';
local lambda = import '../lib/resources/lambda.libsonnet';
local targetContext = import '../lib/targets/context.libsonnet';
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local name = 'New dashboard';
local description = 'This is a new dashboard';

local cloudwatchDatasource = grafana.dashboard.variable.datasource.new('datasource', 'cloudwatch');
local accountId = '111111111';
local region = 'eu-west-1';

local TargetAccountContext = targetContext.new()
                           + targetContext.withAccountId(accountId)
                           + targetContext.withRegion(region)
                           + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

local QueryAccountContext = queryContext.new()
                          + queryContext.withAccountId(accountId)
                          + queryContext.withRegion(region)
                          + queryContext.withDatasourceFromVariable(cloudwatchDatasource);

// Lambda
local LambdaName = 'MyLambda';
local LambdaQuery = qbase.new('LambdaQueryVariable')
                           + lambdaQuery.invocations.byFunctionName('/.*' + LambdaName + '.*/');
local Lambda = lambda.new(LambdaName)
                      // Binding to `name` here will use the query output whenever resource name (eg. withFunctionName) is going to be used
                      + LambdaQuery.bind('name');

local LambdaPanel = grafana.panel.timeSeries.new('Some lambda data')
                    + grafana.panel.timeSeries.standardOptions.withUnit('short')
                    + grafana.panel.timeSeries.options.withTooltip({ mode: 'multi' })
                    + grafana.panel.timeSeries.queryOptions.withTargetsMixin(TargetAccountContext.wrap([
                      Lambda.targets.invocations.withSum(),
                      Lambda.targets.errors.withSum(),
                      Lambda.targets.duration.withAverage(),
                    ]));

// Kinesis Stream
local KinesisName = 'MyKinesisStream';
local KinesisQuery = qbase.new('KinesisQueryVariable')
                            + kinesisQuery.incomingRecords.byStreamName('/.*' + KinesisName + '.*/');
local Kinesis = kinesis.new(KinesisName)
                       // Binding to `name` here will use the query output whenever resource name (eg. withFunctionName) is going to be used
                       + KinesisQuery.bind('name');

local KinesisPanel = grafana.panel.timeSeries.new('Some kinesis data')
                     + grafana.panel.timeSeries.standardOptions.withUnit('short')
                     + grafana.panel.timeSeries.options.withTooltip({ mode: 'multi' })
                     + grafana.panel.timeSeries.queryOptions.withTargetsMixin(TargetAccountContext.wrap([
                       Kinesis.targets.incomingRecords.withSum(),
                       Kinesis.targets.incomingBytes.withSum(),
                     ]));


local variables = QueryAccountContext.wrap(
  [
    LambdaQuery,
    KinesisQuery,
  ]
) + [cloudwatchDatasource];
local panelWidth = 24;
local panels = [LambdaPanel, KinesisPanel];

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
