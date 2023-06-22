import boto3

def descargar_archivo_s3(bucket_name, archivo_s3, archivo_local):
    s3 = boto3.resource('s3')
    try:
        s3.Bucket(bucket_name).download_file(archivo_s3, archivo_local)
        print(f"El archivo {archivo_s3} se ha descargado correctamente como {archivo_local}")
    except Exception as e:
        print(f"Ocurrió un error al descargar el archivo: {e}")

# Especifica el nombre del bucket de S3, el nombre del archivo en S3 y la ubicación local para descargarlo
nombre_bucket = 'nombre_del_bucket'
nombre_archivo_s3 = 'nombre_del_archivo_en_s3'
ubicacion_local = 'ruta_local/del_archivo'

# Llama a la función para descargar el archivo
descargar_archivo_s3(nombre_bucket, nombre_archivo_s3, ubicacion_local)

