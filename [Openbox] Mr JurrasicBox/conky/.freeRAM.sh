#!/bin/bash
a=`nvidia-smi -a | grep MB | grep Free | awk '{print $3}'`
let c=$a+1
echo $c
exit 0
