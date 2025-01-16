#!/bin/bash

killall -KILL polybar

declare -A bars=(
	['eDP-1']='primary'
	['HDMI-1-0']='secondary'
    ['DP-1-0.2']='secondary'
    ['DP-1-0.3']='secondary'
)

run_bar() {
	if [ -n "${bars[$1]}" ]; then
		MONITOR=$1 polybar --reload "${bars[$1]}" &
		unset 'bars[$1]'
	fi
}

# run bars on active monitors
for monitor in $(bspc query -M --names); do
  run_bar "$monitor"
done

# run bars on new monitors
bspc subscribe monitor_add | while read -r _ _ monitor _; do
	run_bar "$monitor"
done
