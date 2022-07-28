#!/bin/bash

. /media/fat/Scripts/update_tty2xxx.ini

runupdate() {
  echo "${fyellow}${fblink}${fbold}RUNNING ${1}${freset}"
  "/media/fat/Scripts/${1}"
  if [ "${PAUSE}" = "yes" ]; then
    echo "${fyellow}${fblink}${fbold}Press ENTER to continue.${freset}"
    read dummy
  fi
  [ "${CLEAR}" = "yes" ] && clear
}

wget ${NODEBUG} --no-cache "${REPOSITORY_URL}/update_tty2xxx.sh" -O /tmp/update_tty2xxx.sh
cmp -s /tmp/update_tty2xxx.sh /media/fat/Scripts/update_tty2xxx.sh
if [ "${?}" -gt "0" ] && [ -s /tmp/update_tty2xxx.sh ]; then
    echo -e "${fyellow}Downloading Updater-Update ${fmagenta}${freset}"
    mv -f /tmp/update_tty2xxx.sh /media/fat/Scripts/update_tty2xxx.sh
    exec /media/fat/Scripts/update_tty2xxx.sh
    exit 255
else
    rm /tmp/update_tty2xxx.sh
fi

if [ "${i2c2oled}" = "yes" ] && [ -e /media/fat/Scripts/update_i2c2oled.sh ]; then
  runupdate update_i2c2oled.sh
fi
if [ "${tty2oled}" = "yes" ] && [ -e /media/fat/Scripts/update_tty2oled.sh ]; then
  runupdate update_tty2oled.sh
fi
if [ "${tty2tft}" = "yes" ] && [ -e /media/fat/Scripts/update_tty2tft.sh ]; then
  runupdate update_tty2tft.sh
fi
if [ "${tty2rpi}" = "yes" ] && [ -e /media/fat/Scripts/update_tty2rpi.sh ]; then
  runupdate update_tty2rpi.sh
fi
if [ "${tty2rgb}" = "yes" ] && [ -e /media/fat/Scripts/update_tty2rgb.sh ]; then
  runupdate update_tty2rgb.sh
fi
if [ "${update_all}" = "yes" ] && [ -e /media/fat/Scripts/update_all.sh ]; then
  runupdate update_all.sh
fi
