#!/usr/bin/env bash

set -eo pipefail
set -x

case $1 in
  post-install)
    echo "POST INSTALL"
    sleep 70s
    systemctl status mytest.timer
    systemctl status mytest.service
    ;;
  post-upgrade)
    echo "POST UPGRADE"
    sleep 70s
    systemctl status mytest.timer
    systemctl status mytest.service
    ;;
  *)
    echo "OTHER: $1"
    ;;
esac
