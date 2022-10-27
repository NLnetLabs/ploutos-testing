#!/usr/bin/env bash

set -eo pipefail
set -x

case $1 in
  post-install|post-upgrade)
    sleep 5s # allow time for the timer to fire (fires every 2 seconds)
    systemctl status mytest.timer
    systemctl status mytest.service || true # returns exit code 3 if active but not currently running
    systemctl status mytest.service | grep -F 'Hello, world!'
    ;;
  *)
    echo "OTHER: $1"
    ;;
esac
