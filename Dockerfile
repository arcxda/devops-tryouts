# Stage 1: Builder
FROM php:8.0-fpm as builder

# Instalar dependencias necesarias para la construcción
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        git \
        unzip \
        wget

# Copiar los archivos de la aplicación
WORKDIR /app
COPY . /app
