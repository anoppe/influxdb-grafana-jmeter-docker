## Visualise JMeter results using InfluxDB, Grafana and Docker

Start InfluxDB and Grafana using this docker compose command:

`docker-compose up -d`

When both Grafana and InfluxDB are started, you can start JMeter to perform the loadtest:

`sh run-jmeter.sh`

The JMeter container is started with `jmeter-volume` mounted to `/tmp` inside the container.
The `run-jmeter.sh` script assumes that the test plan is named `performance-test.jmx` and is present in the folder `jmeter-volume`.

The JMeter logfile is available in `jmeter-volume` for debugging purposes.

And example test plan is available in the folder `jmeter-volume`
