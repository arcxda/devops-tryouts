# Imagen base
FROM node:14

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app
COPY . /app


WORKDIR /app/app
# Instalar las dependencias de la aplicación
RUN npm install

# Exponer el puerto en el que la aplicación está escuchando
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "index.js"]