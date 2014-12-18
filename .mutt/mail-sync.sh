#!/usr/bin/env bash

while pkill --signal 0 offlineimap
do
    sleep 2
done
offlineimap > ~/.mutt/log/mail-log 2>&1 &
