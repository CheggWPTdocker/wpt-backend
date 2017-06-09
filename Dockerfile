FROM cheggwpt/php7-nginx-office:1.1.6
MAINTAINER jgilley@chegg.com

# Statsd Liberato ENVs
ENV DEBUG 1
ENV librato_version 2.0.4
ENV nodejs_version 6.10.0-r0
ENV statsd_version master

# Tideways ENVs
ENV TIDEWAYS_PORT_UDP 8135
ENV TIDEWAYS_PORT_TCP 9135
ENV tideways_version 1.5.3

# Install needed packages
# our final app requires make, curl, and git
RUN apk --update --no-cache add wget \
		make \
		curl \
		openssh-client \
		nodejs \
		git

RUN mkdir /statsd && \
	cd /statsd && \
	git clone --depth 1 --branch ${statsd_version} https://github.com/etsy/statsd.git . && \
	npm install --no-optional && \
	npm install statsd-librato-backend@${librato_version}

RUN cd /tmp && \
	wget https://s3-eu-west-1.amazonaws.com/tideways/daemon/${tideways_version}/tideways-daemon-v${tideways_version}-alpine.tar.gz && \
	tar -zxf tideways-daemon-v${tideways_version}-alpine.tar.gz && \
	mv build/dist/tideways-daemon /usr/bin && \
	ls -l /usr/bin/tideways-daemon && \
	mkdir -p /var/run/tideways && \
	rm -rf build/ tideways-daemon-v${tideways_version}-alpine.tar.gz

RUN rm -rf /var/cache/apk/*

# Add the files
COPY container_confs /
