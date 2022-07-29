#!/bin/sh

vol() {

	vol=`amixer get Master | awk -F'[][]' 'END{ print $2 }' | sed 's/on://g'`

	echo -e "VOL: $vol"

}

spot() {

	if ! pgrep -x spotify >/dev/null; then

		echo ""; exit

	fi

	meta=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify \
		/org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata)

	artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1  | sed 's/\&/\\&/g' | sed 's#\/#\\/#g')

	album=$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1| sed 's/\&/\\&/g'| sed 's#\/#\\/#g')

	title=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1 | sed 's/\&/\\&/g'| sed 's#\/#\\/#g')

	echo "${*:-[%artist% - %title%]}" | sed "s/%artist%/$artist/g;s/%title%/$title/g;s/%album%/$album/g"i | sed "s/\&/\&/g" | sed "s#\/#\/#g"
}

bat_per() {
	cat /sys/class/power_supply/BAT0/capacity
}

while true; do
	echo "$(spot) [$(vol)] [B:$(bat_per)%]"    
	sleep 0.25
done
