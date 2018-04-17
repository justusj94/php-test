# Use an official Python runtime as a parent image
FROM php:7.0-cli

COPY . /app
WORKDIR /app

#install phpunit
RUN apt-get update && apt-get -y install wget && wget -O phpunit https://phar.phpunit.de/phpunit-7.0.phar && chmod +x phpunit && mv phpunit /usr/local/bin/phpunit