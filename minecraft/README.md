# Home Assistant Add-on: Minecraft

Minecraft servers allow players to play online or via a local area network with other people. Internally, the game runs a server for single-player games, this was done in order to make the single-player game experience consistent with the multiplayer experience and make it so that changes made to the game such as bug fixes apply to both single-player games and multiplayer games.

![Supports amd64 Architecture][amd64-shield]

## About

This add-on allows you to run Minecraft: Java Edition server within Home Assistant.

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to Supervisor -> Add-on Store.
2. Find the "Minecraft" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

Before you start the add-on you must accept the EULA in the configuration page. Then you can start the add-on. The `share` directories are mounted for your convenience.

## Configuration

Via the application's settings page. Aside from the EULA all the other options change the [`server.properties`](https://minecraft.wiki/w/Server.properties).

## Support

While there is no warranty or support, you are welcome to raise an [Issue](https://github.com/evilmarty/hassio-addons/issues).
