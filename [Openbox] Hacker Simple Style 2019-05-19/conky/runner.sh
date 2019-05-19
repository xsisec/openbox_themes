#!/bin/bash
conky -c ~/.config/conky/.conkyrc_clock &
conky -c ~/conky_weatherbox/conky_weatherbox &
conky -c ~/.config/conky/.conkyrc_sys &
conky -c ~/.config/conky/.conkyrc_net &
conky -c ~/.config/conky/.conkyrc_disk &
conky -c ~/.config/conky/conky-news/.conky_news_1 &
conky -c ~/.config/conky/conky-news/.conky_news_2 &
conky -c ~/.config/conky/conky-news/.conky_news_3 &
conky -c ~/.config/conky/conky-news/.conky_news_4 &
conky -c ~/.config/conky/.conkyrc_spotify
