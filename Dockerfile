FROM cheggwpt/php7-nginx-office:1.0.2
MAINTAINER jgilley@chegg.com

# Install needed packages
# our final app requires make, curl, and git
RUN apk --update --no-cache add \
        make \
        curl \
        nodejs \
        openssh-client \
        git && \
	rm -rf /var/cache/apk/*
