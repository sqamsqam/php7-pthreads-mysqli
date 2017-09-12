FROM php:7.0-zts-alpine

RUN apk add --no-cache \
        $PHPIZE_DEPS \
    && pecl install pthreads \
    && docker-php-ext-enable pthreads \
    && docker-php-ext-install mysqli \
    && apk del $PHPIZE_DEPS \
    && rm -rf /var/cache/apk/*
