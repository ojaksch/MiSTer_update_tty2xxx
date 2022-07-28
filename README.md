# MiSTer_update_tty2xxx

Tired of running dozens of update scripts for your 25 displays? (There are **some** users using three displays!)

Then just download *update_tty2xxx.sh* and *update_tty2xxx_system.ini* to your MiSTer's script directory (/media/fat/Scripts) and run update_tty2xxx.sh

After first run there will be another INI file named *update_tty2xxx_user.ini* There you can disable one or more tty2* updater or even updater_all. To achieve that have a look into *update_tty2xxx_system.ini* and copy the corresponding line to *update_tty2xxx_user.ini* with a setting to "no" for your next update session.  
There are two other interesting settings: PAUSE and CLEAR. PAUSE pauses after each update so you can review what has been changed. CLEAR wipes the screen before next update in this run to have an uncluttered update output for each update.

Happy and relaxed updating!
