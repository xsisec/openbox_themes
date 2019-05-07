#!/bin/sh
sleep 2
conky -q -c /home/xsisec/.config/conky/conky-gmail/run_conkyrc &
conky -q -c /home/xsisec/.config/conky/conky-news/run_conkyrc_news_1 &
conky -q -c /home/xsisec/.config/conky/conky-news/run_conkyrc_news_2 &
conky -q -c /home/xsisec/.config/conky/conky-shortcuts/run_conkyrc &
conky -q -c /home/xsisec/.config/conky/conky-spotify/run_conkyrc &
conky -q -c /home/xsisec/.config/conky/conky-topbar/run_conkyrc & 
