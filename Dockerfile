FROM php:7.4.29-fpm

RUN apt-get update && apt-get install -y git

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www