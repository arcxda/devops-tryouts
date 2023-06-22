import consul

def obtener_datos_consul():
    # Conectarse a Consul
    cliente = consul.Consul(host='localhost', port=8500)

    # Obtener información de un servicio específico
    servicio = 'nombre_del_servicio'
    (_, servicio_info) = cliente.catalog.service(servicio)
    
    # Obtener información de todos los nodos registrados en Consul
    (_, nodos_info) = cliente.catalog.nodes()

    # Procesar los datos obtenidos
    # ...

    # Cerrar la conexión con Consul
    cliente.close()

    # Devolver los datos procesados
    return datos_procesados

# Ejecutar la función para obtener los datos de Consul
datos = obtener_datos_consul()

# Hacer ......
