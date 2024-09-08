# Grafonnet AWS

Grafonnet AWS is a [jsonnet](https://jsonnet.org/) library that is intended to be used with [Grafonnet](https://grafana.github.io/grafonnet/index.html) to help build Grafana dashboards and panels that are predominantly oriented around AWS resource instances (e.g. a Lambda). The intention of the library is to provide a an easy to read interface for producing Grafana assets, it is build on top of the existing provision in Grafonnet for interacting with Cloudwatch Metrics.

This project is very new and should be considered pre-alpha. There is no release cycle. There will be breaking changes with no warning. There is no versioning.

Having said that, if you want to give it a whirl please do! And let me know how you get on.

## Getting started

### Installation

Jsonnet is required, the [Go implementation of `jsonnet`](https://github.com/google/go-jsonnet) is recommended as the standard C implementation has some significant, and known, performance issues in certain contexts.

Grafonnet AWS is expected to be installed with [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler). To do so, make sure you have `jsonnet-bundler` and run the following:

- `jb install github.com/slcp/grafonnet-aws/lib@main`

## Usage

Grafonnet AWS provides a series of constructs that can be used individually but will provide most benefit when used together to build out dashboards. Each construct is a logical representation of either an AWS resource (e.g. a Lambda) or a Grafana dashboard entity (e.g. a Variable). When used together these constructs are intended to provide a convenient interface when building Grafana dashboards. They are not intended to replace Grafonnet but to compliment it providing boilerplate and deduplication where it makes sense in the scope of Grafana and AWS.

### Resources

A Resource construct is used to logically represent an actual AWS resource like a Lambda or a Kinesis Stream. For example, if a lambda exists called `AddNumbersLambda` a Resource instance can be created like this:

```js
local lambda = import 'github.com/slcp/grafonnet-aws/lib';

local AddNumbersLambda = lambda.new('AddNumbersLambda');
```

At this stage `AddNumbersLambda` has access to all Lambda metrics and their dimensions that can be used as panel targets, these convenience methods all default to using the `FunctionName` dimension. For example, to add the sum of invocations for `AddNumbersLambda` to a panel it can be done like this:

```js
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local Panel = grafana.panel.timeSeries.new('Some lambda data')
              + grafana.panel.timeSeries.queryOptions.withTargetsMixin([
                    exampleLambda.targets.invocations.withSum(),
                ]);
```

Resource constructs like `AddNumbersLambda` can be used with Target constructs instead for more fine grained control, see Targets. Resource constructs consume Target constructs internally to provide panel target convenience methods with some sensible defaults.

In the above usage of the `AddNumbersLambda` instance to create panel targets, the panel targets will be lacking some desirable context like the account id or region for the AWS account that the metric data is being sourced from. A Target Context construct can be used to supply this, a resource construct can be used with multiple Context constructs depending on the needs a of a particular panel. For more information see Contexts. A simple example of using a Target Context with a Resource is:

```js
local DevAccountContext = targetContext.new()
                + targetContext.withAccountId("11111")
                + targetContext.withRegion("eu-west-1")
                + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

local DevAccountTargets = DevAccountContext.wrap([exampleLambda.targets.invocations.withSum()])
```

### Contexts

Context constructs work with both Target and Variable constructs to allow them to be reusable in different use cases. The responsibility of a Context is to carry the knowledge of AWS region, AWS account ID and Grafana Data Source, a Context is then able to enrich a Target or Variable at the point of use so that they are complete and meaningful.

#### Target Contexts

An example - a Context may be used with a Resource to target just a single account like this:

```js
local lambda = import 'github.com/slcp/grafonnet-aws/lib';
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local cloudwatchDatasource = grafana.dashboard.variable.datasource.new('datasource', 'cloudwatch');
local AddNumbersLambda = lambda.new('AddNumbersLambda');

local DevAccountContext = targetContext.new()
                + targetContext.withAccountId("11111")
                + targetContext.withRegion("eu-west-1")
                + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

local DevAccountTargets = DevAccountContext.wrap([
    AddNumbersLambda.targets.invocations.withSum(),
    AddNumbersLambda.targets.errors.withSum(),
    AddNumbersLambda.targets.duration.withSum(),
])
```

Using Contexts in a static way like above is a valid use case but often something more dynamic will be required.

An example - combining a Context with the use of Grafana variables is a powerful way to begin to be able to represent Targets dynamically in response to the changes in value of the variables. This is not new Grafana behaviour but Contexts are also intended to to be used in this scenario:

```js
local TargetContext = targetContext.new()
                + targetContext.withAccountId("$accountId")
                + targetContext.withRegion("$region")
                + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

local Targets = TargetContext.wrap([
    AddNumbersLambda.targets.invocations.withSum(),
    AddNumbersLambda.targets.errors.withSum(),
    AddNumbersLambda.targets.duration.withSum(),
])
```

#### Variable Contexts

TODO

### Variables

Variable constructs are for constructing queries that represent dashboard variables. In Grafonnet AWS the inspiration for this construct is using them to identify a logical resource in different environments or AWS accounts. For example if you have multiple AWS accounts (e.g. Development and Production) with the same infrastructure in (e.g. an `AddNumbers` Lambda) but with non-identical names a dashboard variable can help dynamically locate this resource across each account from the same dashboard. An example is identifying this lambda by invocations and Function Name in a Cloudwatch Metrics query:

```js
local lambdaQuery = import 'github.com/slcp/grafonnet-aws/lib/queries/lambda.libsonnet';
local queryBase = import 'github.com/slcp/grafonnet-aws/lib/queries/base.libsonnet';
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

// This creates a dashboard variable with an identifier of $<hash of 'AddNumbersLambda'>
// This creates a dashboard variable with an label of AddNumbersLambda
local AddNumbersVariable = queryBase.new('AddNumbersLambda')
                           + lambdaQuery.invocations.byFunctionName('/.*AddNumbersLambda.*/');

local dashboard = grafana.dashboard.new('MyDashboard')
                  + grafana.dashboard.withVariablesMixin([AddNumbersVariable])
```

Variables internally will query by regex so a valid regex should be passed if for the value of the dimension be queried, in the above example this is Function Name. This expectation of a regex needs to change as the library develops further, it has been chosen as a default as it provides the most power when using the library. A query can return zero or more results, the use case above and that inspired Variable constructs is that they are expected to return 1 result.

On their own Variable instances construct valid but incomplete dashboard variables, use Variable Contexts to enrich and complete them as required.

```js
local queryContext = import 'github.com/slcp/grafonnet-aws/lib/queries/context.libsonnet';

local AccountContext = queryContext.new()
                          + queryContext.withAccountId('$accountId')
                          + queryContext.withRegion('$region')
                          + queryContext.withDatasourceFromVariable(cloudwatchDatasource);

local AddNumbersVariable = queryBase.new('AddNumbersLambda')
                           + lambdaQuery.invocations.byFunctionName('/.*AddNumbersLambda.*/');

local dashboard = grafana.dashboard.new('MyDashboard')
                  + grafana.dashboard.withVariablesMixin(AccountContext.wrap([AddNumbersVariable]))
```

Through the use of Variable Contexts Variable instances can be reused if required and enriched at the point of use with a Context.

Variable Constructs are powerful when bound with Resources. When a Variable Construct is bound with a Resource a user configurable property can be overwritten on the resource with the Variable identifier. This means that the dynamic results of the Variable can be used natively with Resources in things like panel targets. For example:

```js
local AccountContext = queryContext.new()
                          // $accountId is the identifier for a dashboard variable created with raw grafonnet
                          // The selected value of $accountId is likely controlled by the dashboard viewer
                          + queryContext.withAccountId('$accountId')
                          + queryContext.withRegion('$region')
                          + queryContext.withDatasourceFromVariable(cloudwatchDatasource);

local AddNumbersVariable = queryBase.new('AddNumbersLambda')
                           + lambdaQuery.invocations.byFunctionName('/.*AddNumbersLambda.*/');
local AddNumbersLambda = lambda.new('AddNumbersLambda')
                         // The `name` property will be of the Resource will overwritten
                         // The `name` property is used when a target is created using the default FunctionName dimension 
                         + AddNumbersVariable.bind('name')

local Targets = [
    AddNumbersLambda.targets.invocations.withSum(),
    AddNumbersLambda.targets.errors.withSum(),
    AddNumbersLambda.targets.duration.withSum(),
]

local dashboard = grafana.dashboard.new('MyDashboard')
                  + grafana.dashboard.withVariablesMixin(AccountContext.wrap([AddNumbersVariable]))
                  + grafana.panel.timeSeries.queryOptions.withTargetsMixin(Targets)
```

### Targets

Target constructs provide convenience methods that produce panel targets. They provide methods for all metrics and across all dimensions for a particular resource type and/or Cloudwatch Metrics namespace. It is important to note that Targets by themselves will lack some context, see Contexts. To produce panel targets for some lambda metrics it would look like this:

```js
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local lambdaTargets = import 'github.com/slcp/grafonnet-aws/lib/targets/metrics/lambda.libsonnet';
local statistics = import 'github.com/slcp/grafonnet-aws/lib/targets/metrics/statistics.libsonnet';

local FunctionName = 'MyFunctionName';
local ErrorsTarget = lambdaTargets.invocations.withFunctionName(FunctionName)
                     + statistics.withSum()

local Targets = TargetsContext.wrap([ErrorsTarget])
```

Targets are valid constructs by themselves and intended to provide a high level of control with minimal internal defaults.

## Examples

Please see the `./examples` folder for this information.