#!/bin/sh

# Really basic script to make DualSense work by emulating a Xbox360 controller

echo "Enter to make DualSense controller work as 360 controller"
sudo hciconfig hciX up
sudo ds4drv --emulate-xpad
