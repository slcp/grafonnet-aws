local c = import './common.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';

local destinationPath = 'targets/context.libsonnet';

local renderLocalRoot() =
  a.bind.new(
    a.id.new('local root'),
    a.literal.new('self')
  );

local renderWithContext() =
  a.field_function.new(
    a.id.new('withContext'),
    a.forloop.new(
      a.binary_sum.new([
        a.literal.new('target'),
        a.binary_sum.new([
          a.literal.new('root.region'),
          a.literal.new('root.accountId'),
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

local renderNew() =
  a.field_function.new(
    a.id.new('new'),
    a.object.new([
      renderLocalRoot(),
      renderWithContext(),
      a.field.new(
        a.id.new('region'),
        a.literal.new('region')
      ),
      a.field.new(
        a.id.new('accountId'),
        a.literal.new('accountId')
      ),
      a.field.new(
        a.id.new('datasource'),
        a.literal.new('datasource')
      ),
    ]),
  )
  + a.field_function.withParams(
    a.params.new(
      [
        a.param.new(
          a.id.new('accountId')
        ),
        a.param.new(
          a.id.new('region')
        ),
        a.param.new(
          a.id.new('datasource')
        ),
      ]
    )
  );

{
  path: destinationPath,
  render(): c.render(
    c.renderObjectToString(
      [renderNew()]
    )
  ),
}
