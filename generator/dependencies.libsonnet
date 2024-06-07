local destinationPath = 'jsonnetfile.json';
local jsonIndent = "  ";

{
  path: destinationPath,
  render(): std.manifestJsonEx({
    version: 1,
    dependencies: [
      {
        source: {
          git: {
            remote: 'https://github.com/grafana/grafonnet.git',
            subdir: 'gen/grafonnet-latest',
          },
        },
        version: 'main',
      },
    ],
    legacyImports: true,
  }, jsonIndent),
}
