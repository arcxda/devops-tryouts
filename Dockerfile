# Stage 1: Builder
FROM php:8.0-fpm as builder

# Instalar dependencias necesarias para la construcción
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        git \
        unzip

# Copiar los archivos de la aplicación
WORKDIR /app
COPY . /app

# Instalar las dependencias de PHP
RUN composer install --ignore-platform-reqs --no-scripts --no-autoloader

# Stage 2: Desarrollo
FROM nginx:1.18 as development

# Copiar la configuración de Nginx
COPY docker/nginx.conf /etc/nginx/nginx.conf

# Configurar Nginx para escuchar en el puerto 8008
EXPOSE 8008

# Habilitar la ruta /info.php
RUN ln -s /app/public/info.php /var/www/html/info.php

# Dependencia de PHP
COPY --from=builder /app /var/www/html

# Stage 3: Producción
FROM nginx:1.18 as production

# Copiar la configuración de Nginx
COPY docker/nginx.conf /etc/nginx/nginx.conf

# Configurar Nginx para escuchar en el puerto 8008
EXPOSE 8008

# Habilitar la ruta /info.php
RUN ln -s /app/public/info.php /var/www/html/info.php

# Dependencia de PHP
COPY --from=builder /app /var/www/html

