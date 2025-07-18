FROM php:8.2-apache



RUN apt-get update && \
    apt-get install -y \
        iputils-ping \
        default-mysql-client && \
    docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable mysqli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*