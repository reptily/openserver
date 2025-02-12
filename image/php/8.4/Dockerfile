FROM php:8.4-fpm

RUN apt-get update -y && apt-get install -y \
git \
curl \
libz-dev \
libmemcached-dev \
libcurl4-openssl-dev \
libxml2-dev \
libssl-dev \
libpng-dev \
libonig-dev \
libpq-dev \
librabbitmq-dev \
libzip-dev \
libevent-dev \
build-essential

RUN curl -O https://www.bytereef.org/software/mpdecimal/releases/mpdecimal-2.5.1.tar.gz
RUN tar -zxvf mpdecimal-2.5.1.tar.gz
RUN cd mpdecimal-2.5.1 && ./configure && make && make install

# PHP extension
RUN docker-php-ext-install calendar
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install gd
RUN docker-php-ext-install sockets
RUN docker-php-ext-install zip
RUN pecl install igbinary && docker-php-ext-enable igbinary

# decimal
RUN docker-php-source extract \
    && git clone --branch 1.x-php8 --depth 1 https://github.com/reptily/ext-decimal.git /usr/src/php/ext/decimal \
    && cd /usr/src/php/ext/decimal && git submodule update --init \
    && docker-php-ext-install decimal

# Xdebug
RUN pecl install xdebug-3.4.1 && docker-php-ext-enable xdebug

# Redis
RUN pecl install redis-6.1.0  && docker-php-ext-enable redis

# Memcached
RUN pecl bundle memcached-3.1.5 && cd memcached && phpize && ./configure --enable-memcached-igbinary && make && make install && docker-php-ext-enable memcached
RUN pecl install memcache-8.0 && docker-php-ext-enable memcache

# MySQL
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql

# PostgreSQL
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install pdo_pgsql

# RabbitMQ
RUN docker-php-source extract \
    && git clone --branch latest --depth 1 https://github.com/php-amqp/php-amqp.git /usr/src/php/ext/amqp \
    && cd /usr/src/php/ext/amqp && git submodule update --init \
    && docker-php-ext-install amqp

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc

CMD ["php-fpm", "-F"]

WORKDIR /var/www

EXPOSE 9000
