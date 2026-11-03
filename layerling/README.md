# Home Assistant Add-on: Layerling

[Layerling](https://github.com/henmedia/layerling) is a browser-based 3D CAD editor for 3D printing.

![Supports amd64 Architecture][amd64-shield] ![Supports aarch64 Architecture][aarch64-shield]

## About

This add-on wraps the official [Layerling container image](https://github.com/henmedia/layerling/pkgs/container/layerling). The application runs as the upstream non-root user.

## Installation

1. In Home Assistant, navigate to Settings -> Add-ons -> Add-on Store.
2. Find "Layerling" and click "INSTALL".
3. Start the add-on and click "OPEN WEB UI".

## How to use

The web UI is available on port **3000**, which can be changed in the add-on's Network settings. Home Assistant ingress is not supported because Layerling requires hosting at the root of its own address.

The start page's **On the server** folder stores designs in `/data/projects`. Preview thumbnails are stored in `/data/project-thumbnails`. Both directories persist across add-on restarts and updates and are included in Home Assistant add-on backups.

New designs are saved on the server by default, with the browser's **New designs on the server** setting locked on. Existing browser designs are not moved automatically: move them to **On the server** to include them in the add-on's backup.

## Configuration

| Option | Environment variable | Description |
| ------ | -------------------- | ----------- |
| `default_theme` | `LAYERLING_DEFAULT_THEME` | `system` (default), `light`, `dark`, or `graphite`. Applies to browsers without an existing theme preference. |
| `simple_mode` | `LAYERLING_SIMPLE_MODE` | `"false"` (default), `"true"` to start new users in simplified mode, or `"always"` to enforce it for everyone. |
| `new_designs_on_server` | `LAYERLING_NEW_DESIGNS_ON_SERVER` | `"always"` (default) enforces server storage for new designs; `"true"` makes it the initial preference; `"false"` leaves it to the browser's preference. |

### Advanced settings

Enable **Show unused optional configuration options** in the add-on's Configuration tab to reveal these settings. They are unset by default; MCP remote access is disabled.

| Option | Environment variable | Description |
| ------ | -------------------- | ----------- |
| `allowed_origins` | `LAYERLING_ALLOWED_ORIGINS` | Comma-separated browser origins, such as `https://cad.example.com`, when a reverse proxy cannot preserve the original host. |
| `user_header` | `LAYERLING_USER_HEADER` | Trusted authentication proxy header, such as `X-Forwarded-Email`, used to isolate server designs per user. |
| `mcp_remote` | `LAYERLING_MCP_REMOTE` | Enables the remote MCP bridge when `true`. Requires `mcp_token`. |
| `mcp_token` | `LAYERLING_MCP_TOKEN` | Masked access token, at least 16 characters after trimming whitespace. Use a long random token and configure the same token in your MCP client. |
| `mcp_allowed_hosts` | `LAYERLING_MCP_ALLOWED_HOSTS` | Comma-separated additional hostnames for MCP, such as `cad.example.com`, without a scheme or path. |

Restart the add-on after changing its configuration.

## Network access

Layerling has no built-in authentication. Anyone who can reach the web UI can read, modify, or delete server designs. Use it only on a trusted network, or protect it with an authenticating reverse proxy; Home Assistant login does not protect the exposed port.

If using a reverse proxy, serve Layerling at the root of its own domain and forward the original `Host` and `X-Forwarded-Proto` headers so server saves pass the same-origin checks.

Only set `user_header` when the authentication proxy is the sole route to Layerling and strips or overwrites client-supplied identity headers. Direct access to the exposed port allows users to forge those headers.

Remote MCP access lets a token holder read and change open designs. Enable it only on a trusted network or behind an appropriately protected proxy, and keep the token secret. `allowed_origins` and `mcp_allowed_hosts` do not provide authentication.

The container serves the online application. Installable/offline app support requires upstream's separate static export and is not provided by this add-on.

## Support

While there is no warranty or support, you are welcome to raise an [Issue](https://github.com/evilmarty/hassio-addons/issues).

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
