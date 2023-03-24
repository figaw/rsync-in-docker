#!/bin/sh

. logs.sh

ERRORS=0

if [[ -z "${R_DEST}" ]]; then
  error "R_DEST not configured"
  ERRORS=`expr $ERRORS + 1`
else
    info "using R_DEST $R_DEST"
fi

if [[ -z "${R_SRC}" ]]; then
  error "R_SRC not configured"
  ERRORS=`expr $ERRORS + 1`
else
    info "using R_SRC $R_SRC"
fi

if [[ -z "${R_INTERVAL}" ]]; then
    info "R_INTERVAL not configured"
    R_INTERVAL=60
fi
info "using R_INTERVAL $R_INTERVAL"

touch /tmp/healthy

if [[ $ERRORS -gt 0 ]]; then
    info "started, will never be ready"

    if [[ ! -z "${R_STAYALIVE}" ]]; then
        info "staying alive"
        while true; do sleep 86400; done
    fi

else
    info "started successfully"
    touch /tmp/ready


    while true; do

        diff -r $R_SRC $R_DEST > /dev/null
        if [[ $? -eq 0 ]]; then
            info "source and destination are identical"
        else
            info "synchronizing folders"
            rsync -a -r /mnt/src/ /mnt/dest/
            info "synchronized folders"
        fi
        sleep $R_INTERVAL
    done

fi
