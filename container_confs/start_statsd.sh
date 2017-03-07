#!/bin/sh
echo "starting statsd-librato-daemon, with: /statsd/config.js"
cd /statsd
/usr/bin/node /statsd/node_modules/.bin/statsd-librato /statsd/config.js
