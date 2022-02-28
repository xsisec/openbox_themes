#!/bin/bash

id_current=$(cat /home/xsisec/.config/conky/conky-spotify/current/current.txt)
id_new=`/home/xsisec/.config/conky/conky-spotify/scripts/id.sh`
cover=
imgurl=

if [ "$id_new" != "$id_current" ]; then

	cover=`ls /home/xsisec/.config/conky/conky-spotify/covers | grep $id_new`

	if [ "$cover" == "" ]; then

	    imgurl=`/home/xsisec/.config/conky/conky-spotify/scripts/imgurl.sh $id_new`
	    wget -q -O /home/xsisec/.config/conky/conky-spotify/covers/$id_new.jpg $imgurl &> /dev/null
		# clean up covers folder, keeping only the latest X amount, in below example it is 10
	    rm -f `ls -t /home/xsisec/.config/conky/conky-spotify/covers/* | awk 'NR>10'`
	    rm wget-log #wget-logs are accumulated otherwise
	    cover=`ls /home/xsisec/.config/conky/conky-spotify/covers | grep $id_new`
	fi

	if [ "$cover" != "" ]; then
		cp /home/xsisec/.config/conky/conky-spotify/covers/$cover /home/xsisec/.config/conky/conky-spotify/current/current.jpg
	else
		cp /home/xsisec/.config/conky/conky-spotify/empty.jpg /home/xsisec/.config/conky/conky-spotify/current/current.jpg
	fi

	echo $id_new > /home/xsisec/.config/conky/conky-spotify/current/current.txt
fi
