#!/bin/bash
docker run -d \
  -v `pwd`/jmeter-volume/:/tmp/ \
  jmeter -n -t /tmp/performance-test.jmx -j /tmp/jmeter.log -JINFLUXDB_HOST="host.docker.internal"
