#!/bin/sh
env=${TIDEWAYS_ENV:-development}
extra="--hostname=tideways"
extra="${extra} --env=${env}"
extra="${extra} --address=0.0.0.0:${TIDEWAYS_PORT_TCP}"
extra="${extra} --udp=0.0.0.0:${TIDEWAYS_PORT_UDP}"
echo "starting tideways-daemon, with: ${extra}"
/usr/bin/tideways-daemon $extra
