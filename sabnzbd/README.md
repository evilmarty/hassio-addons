**Deprecation notice** This add-on will no longer receive updates. Please migrate to the HA community add-on.

# Home Assistant Add-on: SABnzbd

SABnzbd is an Open Source Binary Newsreader written in Python.

![Supports amd64 Architecture][amd64-shield] ![Supports aarch64 Architecture][aarch64-shield] ![Supports armhf Architecture][armhf-shield]

## About

This add-on allows you to run SABnzbd within Home Assistant. It is based off of [linuxserver.io's Docker image](https://github.com/linuxserver/docker-sabnzbd).

## Migrate to community add-on

1. Stop this add-on, if it is running. **Do not** uninstall yet as you may lose data.
2. Install the Home Assistant Community add-ons version of SABnzbd.
3. Start the Community version of SABnzbd and then stop it. This is to ensure the add-on's folders are created.
4. SSH onto the Home Assistant server. Do not use the Terminal add-on as this may not give you access to the `addons` folder.
5. Navigate to the supervisor folder. This might be `/mnt/data/supervisor` for HAOS or something else. It should contain the `addons` and `addon_configs` folders.
6. Copy the files by running `cp -fR addons/data/22e52f96_sabnzbd/config/* addon_configs/a0d7b954_sabnzbd`
7. Start the community version of SABnzbd and verify all data is there and working.
8. When comfortable with the outcome you can uninstall this version of SABnzbd.

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to Supervisor -> Add-on Store.
2. Find the "SABnzbd" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

Start the add-on if it is not already running and access it via the panel to configure the application. The `share` and `ssl` directories are mounted for your convenience.

## Configuration

Via the application's settings page.

## Support

While there is no warranty or support, you are welcome to raise an [Issue](https://github.com/evilmarty/hassio-addons/issues).
