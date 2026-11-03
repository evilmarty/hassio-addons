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

Designs saved in the browser remain in that browser, not in the add-on's backup. Use **On the server**, move existing designs there, or enable **New designs on the server** on the start page to keep designs in the add-on's persistent storage.

## Network access

Layerling has no built-in authentication. Anyone who can reach the web UI can read, modify, or delete server designs. Use it only on a trusted network, or protect it with an authenticating reverse proxy; Home Assistant login does not protect the exposed port.

If using a reverse proxy, serve Layerling at the root of its own domain and forward the original `Host` and `X-Forwarded-Proto` headers so server saves pass the same-origin checks.

The container serves the online application. Installable/offline app support requires upstream's separate static export and is not provided by this add-on.

## Support

While there is no warranty or support, you are welcome to raise an [Issue](https://github.com/evilmarty/hassio-addons/issues).

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
