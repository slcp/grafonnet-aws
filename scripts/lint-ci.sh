#!/bin/bash

## Linting multiple files at the same time with jsonnet-lint has known bug
## https://github.com/google/go-jsonnet/issues/591
find . -type f \
    generator/*.jsonnet \
    generator/*.libsonnet \
    generator/**/*.jsonnet \
    generator/**/*.libsonnet \
    lib/**/*.libsonnet \
    examples/*.jsonnet \
    examples/*.libsonnet \
-exec jsonnet-lint -J vendor {} \;