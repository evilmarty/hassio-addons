# Home Assistant Add-on: IPMI

The Intelligent Platform Management Interface (IPMI) is a set of computer interface specifications for an autonomous computer subsystem that provides management and monitoring capabilities independently of the host system's CPU, firmware (BIOS or UEFI) and operating system. IPMI defines a set of interfaces used by system administrators for out-of-band management of computer systems and monitoring of their operation. For example, IPMI provides a way to manage a computer that may be powered off or otherwise unresponsive by using a network connection to the hardware rather than to an operating system or login shell.

![Supports amd64 Architecture][am64-shield]

## About

This exposes the sensor information provided by IPMI to Home Assistant using the MQTT Discovery protocol.

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to Supervisor -> Add-on Store.
2. Find the "IPMI" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

To use this add-on, your system must support IPMI. The simpliest method is to check whether `/dev/ipmi0` exists.

## Configuration

Add-on configuration:

```yaml
interval: 5
discovery_prefix: homeassistant
```

### Option: `interval`

The number of seconds between queries. Default is `5`.

### Option: `discovery_prefix`

The MQTT topic prefixed used by Home Assistant for [discovery](https://www.home-assistant.io/docs/mqtt/discovery/#discovery_prefix).

## Support

While there is no warranty or support, you are welcome to raise an [Issue](https://github.com/evilmarty/hassio-addons/issues).
