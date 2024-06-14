local l = import '../../lib/resources/lambda.libsonnet';

local a = l.new('test')
          + l.withQuery.invocations.byFunctionName('/.*fdgfdgfd.*/', 'varname');

// a.targets.invocations.withSum()
// a.query
{}
