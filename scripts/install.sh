#!/usr/bin/env bash
set -euo pipefail

go install github.com/google/go-jsonnet/cmd/jsonnet@latest
go install github.com/google/go-jsonnet/cmd/jsonnetfmt@latest
go install github.com/google/go-jsonnet/cmd/jsonnet-lint@latest
go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest

npm install
