# Grafonnet AWS

Grafonnet AWS is a [Jsonnet](https://jsonnet.org/) library that extends [Grafonnet](https://grafana.github.io/grafonnet/index.html) to simplify building Grafana dashboards and panels focused on AWS resources (e.g., Lambda functions, Kinesis streams). It offers a clean, easy-to-read interface that integrates with Grafonnet's CloudWatch Metrics support.

## Key Features

- **Simplified AWS integration**: Logical representations of AWS resources like Lambda, easily incorporated into dashboards.
- **Dynamic Grafana dashboards**: Supports context-sensitive targets with AWS region and account-specific data.
- **Boilerplate reduction**: Offers reusable constructs to reduce repetitive code.

> **Note**: This project is in pre-alpha, subject to breaking changes without notice. No release cycle or versioning is currently established.

## Installation

### Dependencies

- **Jsonnet**: We recommend the [Go implementation of Jsonnet](https://github.com/google/go-jsonnet) due to performance issues with the C implementation in certain contexts.
- **Grafonnet**: Ensure you have [Grafonnet](https://grafana.github.io/grafonnet/index.html) installed.

### Install Grafonnet AWS

To install Grafonnet AWS with [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler), run:

```bash
jb install github.com/slcp/grafonnet-aws/lib@main
```

## Usage

### Quick Start: AWS Lambda

The snippet below walks through creating a basic dashboard for a Lambda function. Each step is annotated to highlight the pattern:

```jsonnet
// Import Grafonnet and grafonnet-aws helpers
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local targetContext = import 'github.com/slcp/grafonnet-aws/lib/targets/context.libsonnet';
local lambda = import 'github.com/slcp/grafonnet-aws/lib/resources/lambda.libsonnet';

// Declare the Lambda resource we want to monitor
local AddNumbersLambda = lambda.new('AddNumbersLambda');

// Create a datasource variable and context (account + region)
local cloudwatchDatasource = grafana.dashboard.variable.datasource.new('cloudwatch', 'CloudWatch');
local DevContext = targetContext.new()
                + targetContext.withAccountId("11111")
                + targetContext.withRegion("eu-west-1")
                + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

// Build a panel with the Lambda invocation metric
local lambdaPanel = grafana.panel.timeSeries.new('Lambda Metrics')
              + grafana.panel.timeSeries.queryOptions.withTargetsMixin([
                    DevContext.wrap([AddNumbersLambda.targets.invocations.withSum()])
                ]);

// Assemble the dashboard
local dashboard = grafana.dashboard.new('My Dashboard')
                  + grafana.dashboard.withPanels([lambdaPanel]);

dashboard
```

This quick start shows how to define a Lambda resource, apply context (account ID and region), and create a Grafana panel to display Lambda metrics.

### Quick Start: Amazon Kinesis

Kinesis streams follow the same pattern. The example below adds a panel with Kinesis metrics:

```jsonnet
// Import helpers
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local targetContext = import 'github.com/slcp/grafonnet-aws/lib/targets/context.libsonnet';
local kinesis = import 'github.com/slcp/grafonnet-aws/lib/resources/kinesis.libsonnet';

// Define the stream to monitor
local MyStream = kinesis.new('MyStream');

// Reuse the same CloudWatch datasource and context pattern
local cloudwatchDatasource = grafana.dashboard.variable.datasource.new('cloudwatch', 'CloudWatch');
local DevContext = targetContext.new()
                + targetContext.withAccountId("11111")
                + targetContext.withRegion("eu-west-1")
                + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

// Panel with commonly used Kinesis metrics
local kinesisPanel = grafana.panel.timeSeries.new('Kinesis Metrics')
                + grafana.panel.timeSeries.queryOptions.withTargetsMixin([
                      DevContext.wrap([
                        MyStream.targets.incomingRecords.withSum(),
                        MyStream.targets.incomingBytes.withSum(),
                      ])
                  ]);

local dashboard = grafana.dashboard.new('Kinesis Dashboard')
                  + grafana.dashboard.withPanels([kinesisPanel]);

dashboard
```

The Kinesis example mirrors the Lambda workflow, demonstrating how common patterns—imports, context creation, and panel construction—carry across services.

### Resources

A **Resource** construct logically represents an actual AWS resource like a Lambda or a Kinesis stream. For instance, if a Lambda function exists called `AddNumbersLambda`, a resource instance can be created like this:

```jsonnet
local lambda = import 'github.com/slcp/grafonnet-aws/lib/resources/lambda.libsonnet';
local AddNumbersLambda = lambda.new('AddNumbersLambda');
```

With this `AddNumbersLambda` instance, you can easily access metrics (e.g., invocations, errors) and add them to a Grafana panel. For example:

```jsonnet
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';
local Panel = grafana.panel.timeSeries.new('Lambda Metrics')
              + grafana.panel.timeSeries.queryOptions.withTargetsMixin([
                    AddNumbersLambda.targets.invocations.withSum(),
                ]);
```

Resources simplify the process of adding AWS metrics to dashboards by providing convenient methods for common use cases. Resources will lack some context, see **Contexts**.

Similarly, Kinesis streams can be represented as resources:

```jsonnet
local kinesis = import 'github.com/slcp/grafonnet-aws/lib/resources/kinesis.libsonnet';
local MyStream = kinesis.new('MyStream');
```

`MyStream` exposes helpers for metrics like `incomingRecords` and `incomingBytes` that can be added to panels using the same patterns shown above.

### Contexts

**Contexts** are reusable constructs that carry AWS region, account ID, and data source information. This allows you to dynamically apply these details across multiple panels and variables, reducing redundancy and making your dashboards more flexible.

#### Target Contexts

Contexts are often used with resources to enrich targets with necessary metadata like account ID and region. For example:

```jsonnet
local DevAccountContext = targetContext.new()
                + targetContext.withAccountId("11111")
                + targetContext.withRegion("eu-west-1")
                + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

local DevAccountTargets = DevAccountContext.wrap([
    AddNumbersLambda.targets.invocations.withSum(),
    AddNumbersLambda.targets.errors.withSum(),
])
```

#### Variables Contexts

Contexts can also be combined with Grafana variables for dynamic dashboards. For instance:

```jsonnet
local TargetContext = targetContext.new()
                + targetContext.withAccountId("$accountId")
                + targetContext.withRegion("$region")
                + targetContext.withDatasourceFromVariable(cloudwatchDatasource);

local Targets = TargetContext.wrap([
    AddNumbersLambda.targets.invocations.withSum(),
    AddNumbersLambda.targets.errors.withSum(),
]);
```

This allows the targets to dynamically change based on the selected account or region in your Grafana dashboard.

#### Why Use Contexts?

Contexts help you reuse AWS region, account ID, and data source settings across multiple panels. This is particularly useful when you have several AWS accounts or regions and want consistent Grafana settings across all panels.

### Variables

**Variables** allow you to build dashboards that dynamically adjust based on AWS resource names or other data. They are especially useful when you have multiple AWS accounts with the same infrastructure.

Here’s an example of identifying a Lambda function across environments using a variable:

```jsonnet
local lambdaQuery = import 'github.com/slcp/grafonnet-aws/lib/queries/lambda.libsonnet';
local queryBase = import 'github.com/slcp/grafonnet-aws/lib/queries/base.libsonnet';
local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-latest/main.libsonnet';

local AddNumbersVariable = queryBase.new('AddNumbersLambda')
                           + lambdaQuery.invocations.byFunctionName('/.*AddNumbersLambda.*/');

local dashboard = grafana.dashboard.new('MyDashboard')
                  + grafana.dashboard.withVariablesMixin([AddNumbersVariable]);
```

Variables make dashboards more flexible by enabling resource discovery across different AWS environments. Variables will lack some context, see **Contexts**.

Variables use a regex match internally on the dimension value being queries, e.g. `FunctionName`. A valid regex must be passed.

### Targets

**Targets** define which AWS metrics are displayed on a Grafana panel. They provide methods for all available metrics for specific resource types, such as Lambda or EC2.

For example, to target Lambda invocation metrics:

```jsonnet
local lambdaTargets = import 'github.com/slcp/grafonnet-aws/lib/targets/metrics/lambda.libsonnet';
local ErrorsTarget = lambdaTargets.invocations.withFunctionName('MyFunctionName')
                     + statistics.withSum();

local Targets = TargetContext.wrap([ErrorsTarget]);
```

Targets allow for fine-grained control over which metrics are displayed in your Grafana panels. Targets will lack some context, see **Contexts**.

## Examples

For more detailed examples, including dashboards that combine Lambda and Kinesis metrics, visit the [`examples` folder](./examples) in the repository.
