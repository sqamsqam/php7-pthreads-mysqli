FROM php:7.0-zts-alpine

RUN apk add --no-cache \
        $PHPIZE_DEPS \
        libmcrypt-dev \
    && pecl install pthreads \
    && docker-php-ext-enable pthreads \
    && docker-php-ext-install mysqli pdo pdo_mysql mcrypt \
    && apk del $PHPIZE_DEPS \
    && rm -rf /var/cache/apk/*
