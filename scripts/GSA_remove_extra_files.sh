#!/bin/sh
# Ensures extraneous files are removed or cleaned

# Remove Fstab
rm -f /etc/fstab

# Clear crontab if it exists
FILE=/etc/crontab
if test -f "$FILE"; then
  echo "Clearing File"
  crontab -r
else
  echo "Already Patched"
fi

# Remove init scripts
rm -fr /etc/init.d /lib/rc /etc/conf.d /etc/inittab /etc/runlevels /etc/rc.conf /etc/logrotate.d

# Remove kernel tunable
rm -fr /etc/sysctl* /etc/modprobe.d /etc/modules /etc/mdev.conf /etc/acpi

# Remove suid & sgid files
find /bin /etc /lib /sbin /usr -xdev -type f -a \( -perm /4000 -o -perm /2000 \) -delete

# Cleanup any broken links
find /bin /etc /lib /sbin /usr -xdev -type l -exec test ! -e {} \; -delete
