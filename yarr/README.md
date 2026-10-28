# Home Assistant Add-on: yarr

[yarr](https://github.com/nkanaev/yarr) (yet another rss reader) is a web-based feed aggregator.

![Supports amd64 Architecture][amd64-shield] ![Supports aarch64 Architecture][aarch64-shield]

## About

This add-on runs yarr within Home Assistant. It wraps the official [yarr container image](https://github.com/nkanaev/yarr/pkgs/container/yarr) and maps the add-on options to yarr's `YARR_*` environment variables.

## Installation

1. Navigate in your Home Assistant frontend to Settings -> Add-ons -> Add-on Store.
2. Find the "yarr" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

Start the add-on and open the web UI. By default the SQLite database is stored in the add-on's `/data` directory.

## Configuration

| Option | Env var | Description |
| ------ | ------- | ----------- |
| `username` / `password` | `YARR_AUTH` | Enables basic authentication. Both must be set. |
| `base_path` | `YARR_BASE` | Path prefix for the service URL, e.g. `/news`. |
| `database` | `YARR_DB` | SQLite database path (default `/data/yarr.db`) or a PostgreSQL URL, e.g. `postgres://user:pass@host:5432/dbname?sslmode=disable`. |
| `client_timeout` | `YARR_CLIENT_TIMEOUT` | Timeout for feed and site fetches, e.g. `30s` or `2m`. |
| `ssl` | | Serve over HTTPS using the files below. |
| `certfile` / `keyfile` | `YARR_CERTFILE` / `YARR_KEYFILE` | Certificate and key file names within `/ssl`. |

## Support

While there is no warranty or support, you are welcome to raise an [Issue](https://github.com/evilmarty/hassio-addons/issues).

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
