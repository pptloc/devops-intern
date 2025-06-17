#!/bin/bash
RECIPIENT="byakugan675@gmail.com"

TIME=$(date '+%Y-%m-%d %H:%M:%S')

LOGFILE="mail_send.log"

BODY=$(./monitor.sh)

echo "$BODY" | mailx -s "Monitor Report" "$RECIPIENT"
if [ $? -eq 0 ]; then
    STATUS="SUCCESS"
else
    STATUS="FAILED"
fi

echo "$TIME | $RECIPIENT | $STATUS" >> "$LOGFILE"

