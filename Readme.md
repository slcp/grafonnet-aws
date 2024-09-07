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

Using resource constructs to interact with Cloudwatch metrics and statistics for a resource is a user friendly and concise interface. But resources by themselves do not have enough information to produce a valid panel target. This is what the Context construct is for, they are used to enrich entities like targets and queries to target accounts/regions/etc.

```
local cloudwatchDatasource = g.dashboard.variable.datasource.new('datasource', 'cloudwatch');
local context = c.new()
                + c.withAccountId("accountId")
                + c.withRegion("region")
                + c.withDatasourceFromVariable(cloudwatchDatasource);

local exampleLambda = l.new(exampleLambdaName)
// This can now be used as a fully valid target in a panel
local exampleLambdaInvocationTarget = context.wrap([exampleLambda.targets.invocations.withSum()])
```

### Dashboard variables

TODO

### Targets

TODO

### Full Example

```
local cloudwatchDatasource = g.dashboard.variable.datasource.new('datasource', 'cloudwatch');
local accountId = '111111';
local region = 'eu-west-1';

// Create a context object that can be used later to wrap Panel Targets
local context = c.new()
                + c.withAccountId(accountId)
                + c.withRegion(region)
                + c.withDatasourceFromVariable(cloudwatchDatasource);


local examplePartialLambdaName = 'MyPartialLambdaName';
local exampleLambda = l.new(exampleLambdaName)
                      + l.withQuery.invocations.byFunctionName('/.*' + examplePartialLambdaName + '.*/')
                      + q.withAccountId('111111');

local lambdaPanel = g.panel.timeSeries.new('Some lambda data')
                    + g.panel.timeSeries.standardOptions.withUnit('short')
                    + g.panel.timeSeries.options.withTooltip({ mode: 'multi' })
                    + g.panel.timeSeries.queryOptions.withTargetsMixin(
                        // Wrap Panel Targets with the context
                        context.wrap([
                            exampleLambda.targets.invocations.withSum(),
                            exampleLambda.targets.errors.withSum(),
                            exampleLambda.targets.duration.withAverage(),
                        ])
                    );
```

## Examples

Please see the examples folder for this information.