local c = import '../../common.libsonnet';
local mc = import './common.libsonnet';
local configs = import './config.json';

{
  [name]:
    local cfg = configs[name];
    {
      path: 'targets/metrics/' + name + '.libsonnet',
      render(): c.render(
        c.renderObjectToString(
          [mc.renderNamespace(cfg.namespace)]
          + [
            mc.renderMetrics(cfg.metrics),
            mc.renderDimensions(cfg.dimensions),
          ] + mc.renderHelpers(cfg.metrics, cfg.dimensions)
        ), { renderCloudwatchMetrics: true, renderGrafana: true }
      ),
      metrics: cfg.metrics,
      dimensions: cfg.dimensions,
    }
  for name in std.objectFields(configs)
}
