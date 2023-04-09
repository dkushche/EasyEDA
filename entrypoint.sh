#!/usr/bin/env bash

set -x

dbus_info=`dbus-daemon --session --print-address --fork`

export DBUS_SESSION_BUS_ADDRESS=`echo $dbus_info | cut -d , -f 1`

./easyeda-linux-x64/easyeda
