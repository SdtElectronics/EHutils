#Forward serial tty console to display
script -f /dev/tty0

#mountdebugfs
mount -t debugfs none /sys/kernel/debug

#mount tf card and permit running executables
mount -t vfat -o umask=0000 /dev/block/mmcblk0 /mnt/sdcard
