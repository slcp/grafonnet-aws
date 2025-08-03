# AGENTS Instructions

This repository contains the Jsonnet-based `grafonnet-aws` library. Use the following steps to prepare a development environment and verify it is ready.

## Setup

1. **Install tooling**
   Ensure Go and Node/NPM are available. Then install the Jsonnet toolchain and bundler:

   ```bash
   go install github.com/google/go-jsonnet/cmd/jsonnet@latest
   go install github.com/google/go-jsonnet/cmd/jsonnetfmt@latest
   go install github.com/google/go-jsonnet/cmd/jsonnet-lint@latest
   go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest
   ```

   The executables are placed in `$(go env GOPATH)/bin` (commonly `~/go/bin`). Make sure this directory is included in your `PATH`.

2. **Install repository dependencies**
   Fetch bundled Jsonnet libraries and npm metadata:

   ```bash
   npm install
   ```

   `npm install` runs `jb install`, which populates the `vendor/` directory.

## Validation

After installation, confirm the environment is ready by running the tests and rebuilding the library:

```bash
npm test
npm run generate:lib
```

`npm test` executes Jsonnet unit tests. `npm run generate:lib` regenerates the contents of the `lib/` directory from `generator/`. Both commands should finish without errors and leave `git status` clean.
