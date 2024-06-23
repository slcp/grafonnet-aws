local c = import './common.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local destinationPath = 'targets/context.libsonnet';

local renderLocalRoot() =
  a.bind.new(
    a.id.new('local root'),
    a.literal.new('self')
  );

local renderWrap() =
  a.field_function.new(
    a.id.new('wrap'),
    a.forloop.new(
      a.binary_sum.new([
        a.literal.new('target'),
        a.binary_sum.new([
          a.functioncall.new(a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery.withRegion'))
          + a.functioncall.withArgs([
            a.id.new('root.region'),
          ]),
          a.functioncall.new(a.literal.new('grafana.query.cloudWatch.CloudWatchMetricsQuery.withAccountId'))
          + a.functioncall.withArgs([
            a.id.new('root.accountId'),
          ]),
          a.functioncall.new(a.literal.new('grafana.dashboard.variable.query.withDatasourceFromVariable'))
          + a.functioncall.withArgs([
            a.id.new('root.datasource'),
          ]),
        ]),
      ]),
      a.forspec.new(
        a.id.new('target'),
        a.literal.new('targets')
      )
    ),
  )
  + a.field_function.withParams(
    a.params.new(
      [
        a.param.new(
          a.id.new('targets')
        ),
      ]
    )
  );

local renderWithAccountId() =
  a.field_function.new(
    a.id.new('withAccountId'),
    a.object.new([
      a.field.new(
        a.id.new('accountId'),
        a.literal.new('value')
      ),
    ])
  )
  + a.field_function.withParams(
    a.params.new(
      [
        a.param.new(
          a.id.new('value')
        ),
      ]
    )
  );

local renderWithRegion() =
  a.field_function.new(
    a.id.new('withRegion'),
    a.object.new([
      a.field.new(
        a.id.new('region'),
        a.literal.new('value')
      ),
    ])
  )
  + a.field_function.withParams(
    a.params.new(
      [
        a.param.new(
          a.id.new('value')
        ),
      ]
    )
  );

local renderWithDatasourceFromVariable() =
  a.field_function.new(
    a.id.new('withDatasourceFromVariable'),
    a.object.new([
      a.field.new(
        a.id.new('datasource'),
        a.literal.new('value')
      ),
    ])
  )
  + a.field_function.withParams(
    a.params.new(
      [
        a.param.new(
          a.id.new('value')
        ),
      ]
    )
  );

local renderNew() =
  a.field_function.new(
    a.id.new('new'),
    a.object.new([
      renderLocalRoot(),
      renderWrap(),
    ]),
  );

{
  path: destinationPath,
  render(): c.render(
    c.renderObjectToString(
      [
        renderNew(),
        renderWithAccountId(),
        renderWithRegion(),
        renderWithDatasourceFromVariable(),
      ]
    )
  ),
}
