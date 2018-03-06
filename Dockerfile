FROM cheggwpt/php7-nginx-office:2.0.0

# Statsd Liberato ENVs
ENV DEBUG 1
ENV librato_version 2.0.14
ENV nodejs_version 6.10.0-r0
ENV statsd_version master

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

RUN rm -rf /var/cache/apk/*

# Add the files
COPY container_confs /

