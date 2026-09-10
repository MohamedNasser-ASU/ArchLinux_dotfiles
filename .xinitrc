dwmblocks &
setxkbmap -option '' -layout us,ara -option grp:win_space_toggle
export PATH="/usr/local/bin:$PATH"
mount -t ntfs-3g /dev/nvme0n1p3 /mnt/windows
systemctl --user restart xdg-desktop-portal xdg-desktop-portal-gtk
systemctl --user import-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY WAYLAND_DISPLAY
nitrogen --restore &
dunst &
exec dbus-launch dwm
exec dwm
