#!/bin/bash

HOSTNAME=`hostname`  
ETC_HOSTS=${1:-/etc/hosts}  
if ! grep $HOSTNAME $ETC_HOSTS > /dev/null ; then  
    if grep "127.0.0.1" $ETC_HOSTS > /dev/null ; then
        sed -i "s/127\.0\.0\.1.*$/& $HOSTNAME/" $ETC_HOSTS
    else
        echo "127.0.0.1 localhost $HOSTNAME" >> $ETC_HOSTS
    fi
fi
