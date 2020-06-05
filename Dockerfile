FROM php:7.4-apache

MAINTAINER getavares <gabriel.elias.tavares@gmail.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip libzip-dev

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libwebp-dev unzip \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-webp-dir=/usr \
    && docker-php-ext-install gd zip libmcrypt mbstrings xml
	
VOLUME /var/www/html
WORKDIR /var/www/html