#!/bin/bash

# FUNCS

DISPLAY_NOTIFICATION(){
~/Library/Application\ Support/UpdateSharing/terminal-notifier.app/Contents/MacOS/terminal-notifier -title "Update SharingD" -subtitle "${SUBTITLE}" -message "${MESSAGE}" 
}

MESSAGE_START(){
        if [[ $loc = "ru" ]]; then
        SUBTITLE="Сервис обновления sharingd запущен"
        MESSAGE="Интервал обновления $timer секунд"
        DISPLAY_NOTIFICATION &
        else
        SUBTITLE="SharingD Updating Service Started"
        MESSAGE="Refresh interval is $timer seconds"
        DISPLAY_NOTIFICATION &
        fi
}

# INIT
loc=`defaults read -g AppleLocale | cut -d "_" -f1`; if [[ ! $loc = "ru" ]]; then loc="en"; fi 
if [[ -f ~/Library/Application\ Support/UpdateSharing/timer.txt ]]; then 
    timer=$( cat ~/Library/Application\ Support/UpdateSharing/timer.txt )
else
    timer=10
fi

MESSAGE_START

# MAIN
    
  while true
do 

pkill sharingd; sleep $timer

done