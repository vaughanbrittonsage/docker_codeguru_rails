FROM codeguru/ruby:2.3

RUN set -ex \
	&& apk add --no-cache --virtual .gem-builddeps \
		autoconf \
		bison \
		bzip2 \
		bzip2-dev \
		ca-certificates \
		coreutils \
		curl \
		gcc \
		gdbm-dev \
		glib-dev \
		libc-dev \
		libedit-dev \
		libffi-dev \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		ncurses-dev \
		openssl-dev \
		procps \
		yaml-dev \
		zlib-dev \
	&& gem install -N nokogiri -- --use-system-libraries \
	&& gem install -N rails --version "4.2.5.1" -- --use-system-libraries \
	&& apk del .gem-builddeps

RUN apk add --update libxslt && rm -rf /var/cache/apk/*
RUN gem install tzinfo-data