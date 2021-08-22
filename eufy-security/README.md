# Home Assistant Add-on: Eufy Security

Eufy Security to MQTT Gateway intended for use with Home Assistant or other platforms that use the MQTT discovery mechanism.

![Supports amd64 Architecture][amd64-shield] ![Supports aarch64 Architecture][aarch64-shield] ![Supports armhf Architecture][armhf-shield]

## About

This add-on integrates Eufy Security devices with Home Assistant using the MQTT broker.

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to Supervisor -> Add-on Store.
2. Find the "Eufy Security" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

Start the add-on if it is not already running and access it via the panel to configure the application.

## Configuration

Add-on configuration:

```yaml
username: ...
password: ***
mqttRetain: true
hassTopicRoot: homeassistant
selfTopicRoot: eufysecurity
reconnectPeriod: 300
country: us
language: en
logLevel: info
debug: false
experimental: false
```

### Option: `username` (required)
This is your Eufy Security account username/email address.

### Option: `password` (required)
This is your Eufy Security account password.

### Option: `country`
The Eufy Security country code.

### Option: `language`
The Eufy Security language code.

### Option: `mqttRetain`
Retain MQTT messages from gateway.

### Option: `hassTopicRoot`
The hassio root topic. Change this if MQTT discovery needs a different root topic otherwise leave as default.

### Option: `selfTopicRoot`
The gateway's root topic. This should only be changed in case of collision or debugging purposes.

### Option: `reconnectPeriod`
The wait time after being disconnected should the gateway reconnect.

### Option: `logLevel`
Change the log level to get more details from the gateway. Useful for debugging.

### Option: `debug`
Adds additional logging information from the Eufy Security client.

### Option: `experimental`
Toggle experimental gateway features.

## Support

While there is no warranty or support, you are welcome to raise an [Issue](https://github.com/evilmarty/hassio-addons/issues).
