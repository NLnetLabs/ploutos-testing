#!/usr/bin/env bash

set -eo pipefail
set -x

case $1 in
  post-install|post-upgrade)
    sleep 5s # allow time for the timer to fire (fires every 2 seconds)
    systemctl status mytest.timer
    systemctl status mytest.service || true # returns exit code 3 if active but not currently running
    journalctl --unit mytest.service | grep -F 'Hello, world!'

    # check that our package has the expected dependencies
    ID=$(grep -E '^ID=' /etc/os-release | cut -d '=' -f 2 || true)
    CODENAME=$(grep -E '^VERSION_CODENAME=' /etc/os-release | cut -d '=' -f 2 || true)

    case $ID in
      ubuntu|debian)
        case $CODENAME in
          xenial|bionic|stretch)
            dpkg-deb -f mytest Depends | grep 'rsync'
            case $HOST in
              x86_64)
                dpkg-deb -f mytest Maintainer | grep 'Minimal Maintainer <minimal@example.com>'
                ;;

              *)
                dpkg-deb -f mytest Maintainer | grep 'Minimal Cross Maintainer <minimal.cross@example.com>'
                ;;
            esac
            ;;

          jammy)
            dpkg-deb -f mytest Depends | grep 'libssl'
            dpkg-deb -f mytest Maintainer | grep 'Ubuntu Jammy Maintainer <ubuntu.jammy@example.com>'
            ;;

          *)
            dpkg-deb -f mytest Depends | grep 'libssl'
            ;;
        esac
        ;;
    esac
    ;;
  *)
    echo "OTHER: $1"
    ;;
esac
