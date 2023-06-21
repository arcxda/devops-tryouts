##Contact Developer
* Juan Carlos Arce
  * Devops Engineer
  * 
# DevOps Challenge

Prueba diseñada para ver tus habilidades en el mundo DevOps. Se evaluará las herramientas fundamentales que utilizamos
tales como docker, Nomad/Consul, CI/CD y Terraform. 

¡Te deseamos mucho éxito!

## Reglas
* Se debe de enviar un agregar commit luego de clonar el repositorio.
  * Solo se debe de agregar un archivo con extension ***.md**
  * El archivo debe de contener tus datos de contacto.
* Luego de concluir cada tarea debes de agregar un commit.
  * **No se permite un unico commit con todas las tareas**.
  * Una tarea puede tener multiples commits si asi lo consideras adecuado.
* Puedes realizar las tareas en el orden que creas conveniente.
* Puedes obviar algunas de las sub-tareas de las tareas.
* Cada tarea debe de ir en una carpeta
  * Docker > docker
  * CI/CD > pipeline
  * IaC > terraform
  * Scripting > scripts

## Tareas
* Docker
  * Dockerizar la aplicacion dentro de la carpeta app
    * Usar multistage (development y production)
  * Crear un docker-compose que contenga: **PHP 8.0**, **Nginx 1.8**, **MySQL 8.0**
    * Nginx debe escuchar en el puerto **8008** y habilitar la ruta `/info.php` (PHP Info)
    * Nginx depende de PHP y MySQL
    * Agregar una red para estas imagenes
    * Se debe de habilitar el healthcheck para PHP y MySQL
* CI/CD
  * Crear un pipeline para hacer build de una imagen docker (usar el codigo de la carpeta `app`)
    * Correr los tests si fuese el caso
    * Hacer build de la imagen
* Orquestacion
  * Crear un Nomad job
  * Crear un Nomad job de tipo service con 2 tasks
  * Crear un Nomad job de tipo batch que se ejecute cada hora 
* IaC 
  * Crear una instancia EC2 basada en Amazon Linux 2 usando terraform
    * EBS de 30Gb
    * instancia t3a.micro
    * Agregar una IP elastica
  * Crear un ALB
    * Agregar 2 listeners
      * Limitar por IP
      * Limitar por Metodo (POST)
    * Agregar la opcion de forzar HTTPS (HTTP -> HTTPS)
* Scripting (bash, python, perl, php, etc.)
  * hacer un script para descargar un archivo de S3
  * hacer un script para validar que un servicio este activo
  * hacer un script para depurar imagenes docker
  * Hacer un script para obtener datos de Consul
# devops-tryouts
