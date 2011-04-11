#!/bin/bash
FILES=`svn log -vr$1 $2 | grep '/'`

CWD=`pwd`
TOUPLOAD='/home/max/work/toupload'
`rm -Rf $TOUPLOAD/*`

for FILE in $FILES;
do
    PATH=$CWD$FILE    
    PATH=${PATH//$3/$4}
    echo "try this path: "$PATH
    if [ -e $PATH ];
    then
    echo $PATH
    DIR=`/usr/bin/dirname $TOUPLOAD$FILE`
    
    if [ ! -d $DIR ];
    then
        `/bin/mkdir -p $DIR`
    fi
    
    if [ -f $PATH ];
    then
        echo ":"$PATH"->" $TOUPLOAD$FILE
#        echo ":"$TOUPLOAD$FILE
        `/bin/cp -R $PATH $TOUPLOAD$FILE`
        
    fi
    fi
    
done
