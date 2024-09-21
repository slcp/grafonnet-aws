#!/bin/bash

find -f \
    generator/*.jsonnet \
    generator/*.libsonnet \
    generator/**/*.jsonnet \
    generator/**/*.libsonnet \
    lib/**/*.libsonnet \
    examples/*.jsonnet \
    examples/*.libsonnet \
-exec jsonnet-lint -J vendor {} \;