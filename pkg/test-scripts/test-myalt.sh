#!/usr/bin/env bash

set -eo pipefail
set -x

case $1 in
  post-install|post-upgrade)
    myalt
    ;;
  *)
    echo "OTHER: $1"
    ;;
esac
