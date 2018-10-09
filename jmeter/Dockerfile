FROM alpine:latest

MAINTAINER Auke Noppe<auke@noppe.nl>

ARG JMETER_VERSION="5.0"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_DOWNLOAD_URL  http://mirrors.ocf.berkeley.edu/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_INFLUX_WRITER_DOWNLOAD_URL https://github.com/NovaTecConsulting/JMeter-InfluxDB-Writer/releases/download/v-1.2/JMeter-InfluxDB-Writer-plugin-1.2.jar

ARG TZ="UTC"
RUN    apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add --update openjdk8-jre tzdata curl unzip bash \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies  \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /opt  \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
	&& rm -rf /tmp/dependencies \
  && curl -L --silent ${JMETER_INFLUX_WRITER_DOWNLOAD_URL} > ${JMETER_HOME}/lib/ext/jmeter-influx-writer.jar

# Set global PATH such that "jmeter" command is found
ENV PATH $PATH:$JMETER_BIN

# Entrypoint has same signature as "jmeter" command
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR	${JMETER_HOME}

ENTRYPOINT ["/entrypoint.sh"]
