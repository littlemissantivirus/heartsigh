#!/usr/bin/env sh

# Terminate all currently running polybar instances
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		            MONITOR=$m polybar -c ~/.config/polybar/config.ini top &
			            MONITOR=$m polybar -c ~/.config/polybar/config.ini bottom &
				        done
				else
					    polybar -c ~/.config/polybar/config.ini top &
					        polybar -c ~/.config/polybar/config.ini bottom &
fi
