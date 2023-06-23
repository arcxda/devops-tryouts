#!/bin/bash

# Nombre de la imagen de Docker que deseas depurar
imagen_docker="nombre_de_la_imagen"

# Etiqueta de la imagen de Docker que deseas depurar
etiqueta="etiqueta_de_la_imagen"

# Nombre del contenedor que se creará para la depuración
nombre_contenedor="nombre_del_contenedor"

# Directorio de trabajo en el contenedor
directorio_trabajo="/ruta/de/directorio/en/el/contenedor"

# Comando de depuración que deseas ejecutar en el contenedor
comando_depuracion="comando_depuracion"

# Crea un contenedor temporal a partir de la imagen de Docker
docker run -it --name $nombre_contenedor $imagen_docker:$etiqueta /bin/bash

# Copia el comando de depuración al contenedor
docker cp $comando_depuracion $nombre_contenedor:$directorio_trabajo

# Ejecuta el comando de depuración en el contenedor
docker exec -it $nombre_contenedor $directorio_trabajo/$comando_depuracion

# Elimina el contenedor una vez finalizada la depuración
docker rm $nombre_contenedor

