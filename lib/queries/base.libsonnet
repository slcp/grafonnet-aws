local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

{
  local base = {
    // Capture a reference to the to the query object, self in bind() will refer an object in an unknown scope
    local root = self,
    bind(propertyName):: { [propertyName]: '$' + root.name },
    // Force query to not be a string, grafana.dashboard.variable.query.new(std.md5(queryVariableName)) sets it as a string
    query: {},
  },
  // std.md5 is used manage the length of the variable name
  new(queryVariableName): grafana.dashboard.variable.query.new(std.md5(queryVariableName))
                          + { label: queryVariableName }
                          + base,
}
