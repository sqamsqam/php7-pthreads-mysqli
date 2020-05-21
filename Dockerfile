FROM php:zts-alpine

RUN apk add --no-cache \
        $PHPIZE_DEPS \
    && pecl install pthreads \
    && docker-php-ext-enable pthreads \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && apk del $PHPIZE_DEPS \
    && rm -rf /var/cache/apk/*
