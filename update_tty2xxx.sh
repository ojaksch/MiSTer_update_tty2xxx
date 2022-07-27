#!/bin/bash

. /media/fat/Scripts/update_tty2xxx.ini

if [ "${i2c2oled}" = "yes" ] && [ -e /media/fat/Scripts/update_i2c2oled.sh ]; then
  /media/fat/Scripts/update_i2c2oled.sh
fi
if [ "${tty2oled}" = "yes" ] && [ -e /media/fat/Scripts/update_tty2oled.sh ]; then
  /media/fat/Scripts/update_tty2oled.sh
fi
if [ "${tty2tft}" = "yes" ] && [ -e /media/fat/Scripts/update_tty2tft.sh ]; then
  /media/fat/Scripts/update_tty2tft.sh
fi
if [ "${tty2rpi}" = "yes" ] && [ -e /media/fat/Scripts/update_tty2rpi.sh ]; then
  /media/fat/Scripts/update_tty2rpi.sh
fi
if [ "${tty2rgb}" = "yes" ] && [ -e /media/fat/Scripts/update_tty2rgb.sh ]; then
  /media/fat/Scripts/update_tty2rgb.sh
fi
if [ "${update_all}" = "yes" ] && [ -e /media/fat/Scripts/update_all.sh ]; then
  /media/fat/Scripts/update_all.sh
fi
