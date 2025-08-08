FROM mcr.microsoft.com/devcontainers/go:1.21

RUN apt-get update && apt-get install -y --no-install-recommends nodejs npm \
    && npm install -g npm@latest \
    && go install github.com/google/go-jsonnet/cmd/jsonnet@latest \
    && go install github.com/google/go-jsonnet/cmd/jsonnetfmt@latest \
    && go install github.com/google/go-jsonnet/cmd/jsonnet-lint@latest \
    && go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest \
    && npm cache clean --force \
    && rm -rf /var/lib/apt/lists/*

ENV PATH=/go/bin:${PATH}
