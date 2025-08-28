#!/bin/sh

cava_cfg="/tmp/polybar_vis_config"

trap "rm -f \"$cava_cfg\"" EXIT

# write cava config
cat <<EOF >$cava_cfg
[general]
bars = 12
framerate = 24

[input]
method = fifo
source = /tmp/mpd.fifo

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
channels = mono
ascii_max_range = 8
bar_delimiter =
EOF

cava -p $cava_cfg | sed -u 'y/012345678/ ▁▂▃▄▅▆▇█/'
