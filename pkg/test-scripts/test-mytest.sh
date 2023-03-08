#!/usr/bin/env bash

set -eo pipefail
set -x

case $1 in
  post-install|post-upgrade)
    sleep 5s # allow time for the timer to fire (fires every 2 seconds)
    systemctl status mytest.timer
    systemctl status mytest.service || true # returns exit code 3 if active but not currently running
    journalctl --unit mytest.service | grep -F 'Hello, world! 1+2 is 3'

    # check that our package has the expected dependencies
    ID=$(grep -E '^ID=' /etc/os-release | cut -d '=' -f 2 || true)
    CODENAME=$(grep -E '^VERSION_CODENAME=' /etc/os-release | cut -d '=' -f 2 || true)

    case $ID in
      ubuntu|debian)
        case $CODENAME in
          xenial|bionic|stretch)
            apt show mytest 2>&1 | grep -E '^Depends' | grep 'rsync'
            apt show mytest 2>&1 | grep -E '^Maintainer' | grep 'Minimal Maintainer <minimal@example.com>'
            ;;

          buster)
            apt show mytest 2>&1 | grep -E '^Depends' | grep 'libssl'
            apt show mytest 2>&1 | grep -E '^Maintainer' | grep 'Some Author <some.author@example.com>'
            ;;

          jammy)
            apt show mytest 2>&1 | grep -E '^Depends' | grep 'libssl'
            apt show mytest 2>&1 | grep -E '^Maintainer' | grep 'Ubuntu Jammy Maintainer <ubuntu.jammy@example.com>'
            ;;

          *)
            apt show mytest 2>&1 | grep -E '^Depends' | grep 'libssl'
            ;;
        esac
        ;;
    esac
    ;;
  *)
    echo "OTHER: $1"
    ;;
esac
