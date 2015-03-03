#!/usr/bin/env bash
# This script was copied from http://bkanuka.com/articles/offlineimap-mutt/

while pkill --signal 0 offlineimap
do
    sleep 2
done
nohup offlineimap a niltonvasques >> ~/.mutt/log/offlineimap.log 2>> ~/.mutt/log/log/offlineimap.log &
