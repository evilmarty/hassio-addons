# AGENTS.md

## Wrapping an upstream image

Pull the upstream image from GHCR (`FROM ghcr.io/<owner>/<image>:<tag>`) and pin the tag to the addon's `config.json` `version`. CI's version check (`.github/workflows/check.yml`) reads the `org.opencontainers.image.version` label via `scripts/get-container-label.sh`, which works against GHCR and fails against Docker Hub.
