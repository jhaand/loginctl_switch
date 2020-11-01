#!/bin/bash

TARGET_USER=jhaand
SESSION_LIST="$(loginctl  | grep $TARGET_USER | awk '{print $1}')"

TARGET_SESSION="empty"

if ! [[ -n $SESSION_LIST ]] ; then
    echo "No session found for user: $TARGET_USER "
    exit
fi

for i in $SESSION_LIST ; do
    echo "New session: $i"
    SESSION_STATE="$(loginctl show-session $i -p State |cut -d'=' -f2 )"
    SESSION_ACTIVE="$(loginctl show-session $i -p Active |cut -d'=' -f2 )"
    echo "Session State: $SESSION_STATE"
    echo "Session Active: $SESSION_ACTIVE"

    if [ "no" == $SESSION_ACTIVE ] && [ "online" == $SESSION_STATE ] ; then
        echo "Session is not active and online"
        TARGET_SESSION=$i
    fi
    echo 
done

echo "Target Session: $TARGET_SESSION"

if [ 'empty' != $TARGET_SESSION ] ; then 
    loginctl activate $TARGET_SESSION
fi


