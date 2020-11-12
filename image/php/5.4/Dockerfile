FROM php:5.4-fpm

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
libmpdec-dev \
libzip-dev \
libevent-dev

# PHP extension
RUN docker-php-ext-install calendar
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install gd
RUN docker-php-ext-install sockets
RUN docker-php-ext-install zip

# Xdebug
RUN pecl install xdebug-2.2.1 && docker-php-ext-enable xdebug

# Redis
RUN pecl install redis-2.2.7  && docker-php-ext-enable redis

# Memcached
RUN pecl bundle memcached-2.2.0 && cd memcached && phpize && ./configure && make && make install && docker-php-ext-enable memcached

# MySQL
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql

# PostgreSQL
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install pdo_pgsql

# RabbitMQ
RUN pecl install amqp-1.4.0 && docker-php-ext-enable amqp

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc

CMD ["php-fpm", "-F"]

WORKDIR /var/www

EXPOSE 9000
