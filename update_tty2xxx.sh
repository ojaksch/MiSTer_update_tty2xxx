#!/bin/bash

cd /etc/ssl/certs
wget -Nq https://curl.se/ca/cacert.pem
cd /tmp

[ -e /media/fat/Scripts/update_tty2xxx_system.ini ] && . /media/fat/Scripts/update_tty2xxx_system.ini
[ -e /media/fat/Scripts/update_tty2xxx_user.ini ] && . /media/fat/Scripts/update_tty2xxx_user.ini

CORENAME=$(</tmp/CORENAME)
echo "000-UPDATE" > /tmp/CORENAME

runupdate() {
  [ "${CLEAR}" = "yes" ] && clear
  echo -e "${fyellow}${fblink}${fbold}RUNNING ${1}${freset}"
  "${SCRIPTPATH}/${1}"
  if [ "${PAUSE}" = "yes" ]; then
    echo -e "${fyellow}${fblink}${fbold}Press ENTER to continue.${freset}"
    read dummy
  fi
}



# Update the updater if neccessary
wget ${NODEBUG} --no-cache "${REPOSITORY_URL}/update_tty2xxx.sh" -O /tmp/update_tty2xxx.sh
cmp -s /tmp/update_tty2xxx.sh ${SCRIPTPATH}/update_tty2xxx.sh
if [ "${?}" -gt "0" ] && [ -s /tmp/update_tty2xxx.sh ]; then
    echo -e "${fyellow}Downloading Updater-Update ${fmagenta}${freset}"
    mv -f /tmp/update_tty2xxx.sh ${SCRIPTPATH}/update_tty2xxx.sh
    exec ${SCRIPTPATH}/update_tty2xxx.sh
    exit 255
else
    rm /tmp/update_tty2xxx.sh
fi



# Check and update INI files if neccessary
! [ -e ${SCRIPTPATH}/update_tty2xxx_user.ini ] && touch ${SCRIPTPATH}/update_tty2xxx_user.ini
wget ${NODEBUG} --no-cache "${REPOSITORY_URL}/update_tty2xxx_system.ini" -O /tmp/update_tty2xxx_system.ini
cmp -s /tmp/update_tty2xxx_system.ini "${SCRIPTPATH}/update_tty2xxx_system.ini"
if [ "${?}" -gt "0" ]; then
  mv /tmp/update_tty2xxx_system.ini "${SCRIPTPATH}/update_tty2xxx_system.ini"
  . ${SCRIPTPATH}/update_tty2xxx_system.ini
  . ${SCRIPTPATH}/update_tty2xxx_user.ini
fi



if [ "${i2c2oled}" = "yes" ] && [ -e ${SCRIPTPATH}/update_i2c2oled.sh ]; then
  runupdate update_i2c2oled.sh
fi
if [ "${tty2oled}" = "yes" ] && [ -e ${SCRIPTPATH}/update_tty2oled.sh ]; then
  runupdate update_tty2oled.sh
fi
if [ "${tty2tft}" = "yes" ] && [ -e ${SCRIPTPATH}/update_tty2tft.sh ]; then
  runupdate update_tty2tft.sh
fi
if [ "${tty2rpi}" = "yes" ] && [ -e ${SCRIPTPATH}/update_tty2rpi.sh ]; then
  runupdate update_tty2rpi.sh
fi
if [ "${tty2rgb}" = "yes" ] && [ -e ${SCRIPTPATH}/update_tty2rgb.sh ]; then
  runupdate update_tty2rgb.sh
fi
if [ "${update_all}" = "yes" ] && [ -e ${SCRIPTPATH}/update_all.sh ]; then
  runupdate update_all.sh
fi

echo -e "${fyellow}Done...Have fun!${fmagenta}${freset}"
echo "${CORENAME}" > /tmp/CORENAME
