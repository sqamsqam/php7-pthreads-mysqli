FROM php:zts-alpine

RUN apk add --no-cache \
        $PHPIZE_DEPS \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && git clone https://github.com/krakjoe/pthreads -b master /tmp/pthreads \
    && docker-php-ext-configure /tmp/pthreads --enable-pthreads \
    && docker-php-ext-install /tmp/pthreads \
    && apk del $PHPIZE_DEPS \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*
