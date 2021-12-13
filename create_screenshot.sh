#!/usr/bin/env bash

function shout()
{
echo -en "Normal Row\nAlternateRow\nNormal Row active\nAlternateRow Active\nNormal Row urgent\nAlternateRow urgent"
echo -en "\nSelected Row"
echo -en "\nAlternate Row number 1\nNormal Row number 2\nAlternate Row number 3\n4\n5"
}

sleep 1
( shout | rofi -location 0 -no-hide-scrollbar -columns 1 -location 0 -u 2,3 -a 4,5 -dmenu -p "Prompt" -selected-row 6 ) &
P=$!

if [ "$(xdotool -v $1 > /dev/null 2>&1 ; echo $? )" -eq 0 ]; then
    sleep 1
    xdotool type  "Row"
fi

sleep 1
import -w root png:- > ./$(date +%Y_%m_%dT%H_%M_%S_%N).png
sleep 1
killall rofi
wait $P
