# Use an official Python runtime as a parent image
FROM php:7.0-cli

COPY . /app
WORKDIR /app

#install phpunit
RUN wget -O phpunit https://phar.phpunit.de/phpunit-7.1.3.phar && chmod +x phpunit-7.1.3.phar && mv phpunit-7.1.3.phar /usr/local/bin/phpunit
