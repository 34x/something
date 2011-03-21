#!/bin/bash
#Ищет по коммитам фразу
#gitgrep.sh pattern N где N лимит логов
echo 'Start'

LOGS=`git log -n$2 | grep -E '[0-9a-zA-Z]{40}'`

for  LOG in $LOGS ;
do
    if [ "commit" != $LOG ];
    then
    git checkout -b searching$LOG $LOG
    MATCH=`git grep $1`
    echo -e "\033[01;32m$MATCH\033[00m"
    git checkout master
    git branch -d searching$LOG
    
    fi
done;