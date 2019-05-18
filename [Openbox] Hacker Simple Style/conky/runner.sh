#!/bin/bash
conky -c ~/.config/conky/.conkyrc_clock &
conky -c ~/conky_weatherbox/conky_weatherbox &
conky -c ~/.config/conky/.conkyrc_sys &
conky -c ~/.config/conky/.conkyrc_net &
conky -c ~/.config/conky/.conkyrc_disk &
conky -c ~/.config/conky/.conkyrc_spotify
