#!/usr/bin/env bash

set -eo pipefail
set -x

case $1 in
  post-install)
    echo "POST INSTALL"
    ;;
  post-upgrade)
    echo "POST UPGRADE"
    ;;
  *)
    echo "OTHER: $1"
    ;;
esac
