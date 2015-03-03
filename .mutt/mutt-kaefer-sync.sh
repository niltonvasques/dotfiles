#!/usr/bin/env bash
# This script was copied from http://bkanuka.com/articles/offlineimap-mutt/
while true      # run forever
do
    nohup offlineimap -a niltonkaefer > ~/.mutt/log/offlineimapkaefer.log 2> /dev/null  # run offlineimap and copy log to ~/mail-log
    sleep 120   # sleep 2 minutes
done &          # run loop in background
LOOP_PID=$!     # copy PID of loop
mutt -F ~/.mutt/muttkaeferrc           # run mutt in foreground (and waits for mutt to exit)

kill $LOOP_PID              # these two lines are a cool trick to kill the
wait $LOOP_PID 2>/dev/null  # infinite loop and hide the error that it generates

~/.mutt/kaefer-sync.sh &     # sync mail once more after mutt exits
exit 0          # force script to exit "cleanly")

