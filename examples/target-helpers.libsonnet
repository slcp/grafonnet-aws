local l = import '../lib/resources/lambda.libsonnet';
local lm = import '../lib/targets/metrics/lambda.libsonnet';
local s = import '../lib/targets/metrics/statistics.libsonnet';
local g = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local name = 'New dashboard';
local description = 'This is a new dashboard';

local sendEmailLamddaName = 'SendEmailLambda';
local sendEmailLamddaWithQuery = l.new(sendEmailLamddaName)
                                 + l.withQuery.invocations.byFunctionName('/.*' + sendEmailLamddaName + '.*/');
local sendEmailLamddaWithoutQuery = l.new(sendEmailLamddaName);

local lambdaPanel = g.panel.timeSeries.new('Some lambda data')
                    + g.panel.timeSeries.standardOptions.withUnit('short')
                    + g.panel.timeSeries.options.withTooltip({ mode: 'multi' })
                    + g.panel.timeSeries.queryOptions.withTargetsMixin([
                      sendEmailLamddaWithQuery.targets.invocations.withSum(),
                      lm.invocations.withFunctionName(sendEmailLamddaWithoutQuery.name)
                      + s.withSum(),
                    ]);

local variables = [sendEmailLamddaWithQuery.query];
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
