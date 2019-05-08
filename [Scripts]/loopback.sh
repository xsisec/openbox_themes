#!/bin/bash



pacmd load-module module-null-sink sink_name=game_sink sink_properties=device.description=Game-Sink
pacmd load-module module-null-sink sink_name=Virtual1
pacmd load-module module-loopback sink_name=Virtual2
# Set up the mixed sound sink
# Set up the first loopback sink
#actl load-module module-loopback sink=MySink_Loopback
# Set up the second loopback sink
#pactl load-module module-loopback sink=MySink_Loopback_2
