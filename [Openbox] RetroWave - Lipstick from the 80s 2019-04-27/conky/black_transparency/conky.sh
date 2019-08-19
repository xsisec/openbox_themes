#!/bin/bash

# Kill Conky If Running
test -z "`pgrep conky`" || killall -9 conky

# The directory of conkyrcs
conky_dir="./conkyrc"

# The command for start conkys
START="conky -d -c"

# The Conkys
sleep 0.2
$START ~/.conky/black_transparency/conkyrc1
sleep 0.2
$START ~/.conky/black_transparency/prog
sleep 0.2
$START ~/.conky/black_transparency/lastfm
sleep 0.2
$START ~/.conky/black_transparency/mail
sleep 0.2
$START ~/.conky/black_transparency/quote
sleep 0.2
$START ~/.conky/black_transparency/conky_weather
sleep 0.2
$START ~/.conky/black_transparency/clock
