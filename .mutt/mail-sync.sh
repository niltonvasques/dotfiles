#!/usr/bin/env bash
# This script was copied from http://bkanuka.com/articles/offlineimap-mutt/

while pkill --signal 0 offlineimap
do
    sleep 2
done
offlineimap > ~/.mutt/log/mail-log 2>&1 &