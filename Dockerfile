FROM php:7.2-cli-alpine

RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
    git \
    imagemagick-dev \
    zlib-dev \
    autoconf

RUN curl -s https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN docker-php-source extract \
    && docker-php-ext-configure zip --with-zlib \
    && docker-php-ext-install zip \
    && docker-php-source delete

RUN set -ex \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick \
    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
    && apk del .phpize-deps

WORKDIR /escpos-tools

RUN git clone https://github.com/receipt-print-hq/escpos-tools.git tools \
    && cd tools \
    && composer install

RUN sed -i '1s/^/#!\/usr\/local\/bin\/php\n/' /escpos-tools/tools/esc2html.php
RUN ln -s /escpos-tools/tools/esc2html.php /usr/local/bin/esc2html \
    && chmod u+x /usr/local/bin/esc2html

RUN apk del .build-deps
