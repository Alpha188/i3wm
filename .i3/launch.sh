#!/usr/bin/env sh
numlockx
feh --bg-scale Pictures/paper.jpg&
#compton&
#xfce4-power-manager
#xfce4-panel -d
nm-applet&
fcitx&
#redshift&
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c /home/alpha/.config/polybar/config.ini main &
