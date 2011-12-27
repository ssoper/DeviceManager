## What is it

A singleton class useful in determining the device and iOS version.

## Why duck typing

Comparing version strings can be dangerous. Macros aren't always guaranteed to exist.

## Example Usage

    if ([DeviceManager defaultManager].iphone &&
        [DeviceManager defaultManager].ios4)
    // Do stuff only on an iPhone running iOS4

Or

    if ([DeviceManager defaultManager].ipad &&
        [DeviceManager defaultManager].ios5)
    // Do stuff only on an iPad running iOS5

## ARC

This code is meant to be run in an ARC project. If you'd like to use it in a manually managed memory environment, switch out the `defaultManager` with [this](http://eschatologist.net/blog/?p=178).