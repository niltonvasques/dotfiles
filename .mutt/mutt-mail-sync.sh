#!/usr/bin/env bash
# Author Nilton Vasques
# This script was inspired in http://bkanuka.com/articles/offlineimap-mutt/


# variables
LOG_FILE=$HOME/.mutt/log/offlineimap.log 
ACCOUNT=niltonvasques
MUTTRC=$HOME/.mutt/muttgmailrc

# main loop
while true      # run forever
do
  # run offlineimap and copy log to ~/mail-log
  nohup offlineimap -a $ACCOUNT > $LOG_FILE 2>> $LOG_FILE      
  # restart offlineimap if an crashes occur
  OFFLINE_PID=$(pgrep ^offlineimap)
  wait $OFFLINE_PID 2> /dev/null
  #sleep 120   # sleep 2 minutes
done &          # run loop in background

LOOP_PID=$!     # copy PID of loop
mutt -F $MUTTRC           # run mutt in foreground (and waits for mutt to exit)

# close threads and syncs
OFFLINE_PID=$(pgrep ^offlineimap)
echo 'killing offlineimap with pid='$OFFLINE_PID >> $LOG_FILE
kill $OFFLINE_PID
wait $OFFLINE_PID 2>/dev/null
echo 'killing loop with pid='$LOOP_PID >> $LOG_FILE
kill $LOOP_PID              # these two lines are a cool trick to kill the
wait $LOOP_PID 2>/dev/null  # infinite loop and hide the error that it generates

#~/.mutt/mail-sync.sh &     # sync mail once more after mutt exits
exit 0          # force script to exit "cleanly")

