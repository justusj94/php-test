# Use an official Python runtime as a parent image
FROM php:7.0-cli

COPY . /app
WORKDIR /app

#install phpunit
RUN apt-get update && apt-get -y install wget && wget -O phpunit https://phar.phpunit.de/phpunit-7.phar
RUN chmod +x phpunit
RUN mv phpunit /usr/local/bin/phpunit
RUN phpunit --version