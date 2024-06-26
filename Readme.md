# Grafonnet AWS

Grafonnet AWS is a [jsonnet](https://jsonnet.org/) library that is intended to be used with [Grafonnet](https://grafana.github.io/grafonnet/index.html) to help simplify building Grafana dashboards and panels. The intention of the library is to provide a an easy to read interface for producing Grafana assets, it is build on top of the existing provision in Grafonnet for interacting with Cloudwatch.

This project is very new and should be considered pre-alpha. There is no release cycle. There is some but not a lot of tests in place. There will be breaking changes with no warning. There is no versioning.

Having said that, if you want to give it a whirl please do!

## Getting started

### Installation

Grafonnet AWS is expected to be installed with [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler). To do so, make sure you have jsonnet-bundler installed and run the following:

- `jb install github.com/slcp/grafonnet-aws/lib@main`

## Usage

Please see the examples folder for this information.

Grafonnet AWS provides a series of constructs that are intended to represent AWS resources, e.g. Lambda. These constructs are intended to provide a consistent and convenient interface to building Panel Targets and Dashboard Queries for a resource

### Resources

```
local exampleLambda = l.new(exampleLambdaName)
// By itself this does not have enough data to be a valid panel target - see Contexts
local exampleLambdaInvocationTarget = exampleLambda.targets.invocations.withSum()
```

### Contexts

Using resource constructs to interact with Cloudwatch metrics and statistics for resource is user friendly and concise interface. But resources by themselves do not have enough information to produce a valid panel target. This is what the Context construct is for, they are used to enrich entities like targets and queries to target accounts/regions/etc.

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

### Full Example

```
local cloudwatchDatasource = g.dashboard.variable.datasource.new('datasource', 'cloudwatch');
local accountId = g.query.cloudWatch.CloudWatchMetricsQuery.withAccountId('111111');
local region = g.query.cloudWatch.CloudWatchMetricsQuery.withRegion('eu-west-1');

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
