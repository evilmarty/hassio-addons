**Deprecation notice** This add-on will no longer receive updates. Please migrate to the HA community add-on.

# Home Assistant Add-on: Lidarr

Lidarr is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new albums from your favorite artists and will interface with clients and indexers to grab, sort, and rename them. It can also be configured to automatically upgrade the quality of existing files in the library when a better quality format becomes available.

![Supports amd64 Architecture][amd64-shield] ![Supports aarch64 Architecture][aarch64-shield] ![Supports armhf Architecture][armhf-shield]

## About

This add-on allows you to run Lidarr within Home Assistant.

## Migrate to community add-on

1. Stop this add-on, if it is running. **Do not** uninstall yet as you may lose data.
2. Install the Home Assistant Community add-ons version of Lidarr.
3. Start the Community version of Lidarr and then stop it. This is to ensure the add-on's folders are created.
4. SSH onto the Home Assistant server. Do not use the Terminal add-on as this may not give you access to the `addons` folder.
5. Navigate to the supervisor folder. This might be `/mnt/data/supervisor` for HAOS or something else. It should contain the `addons` and `addon_configs` folders.
6. Copy the files by running `cp -fR addons/data/22e52f96_lidarr/config/* addon_configs/a0d7b954_lidarr`
7. Start the community version of Lidarr and verify all data is there and working.
8. When comfortable with the outcome you can uninstall this version of Lidarr.

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to Supervisor -> Add-on Store.
2. Find the "Lidarr" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

Start the add-on if it is not already running and access it via the panel to configure the application. The `share`, `ssl`, and `backup` directories are mounted for your convenience.

## Configuration

Via the application's settings page.

## Support

This add-on is being deprecated and will no longer be updated. Eventually it will be removed.
