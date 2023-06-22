import requests

def validar_servicio(url):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            print("El servicio está activo.")
        else:
            print("El servicio está inactivo.")
    except requests.exceptions.RequestException as e:
        print("Error al conectar con el servicio:", e)

# URL del servicio a validar
url_servicio = "https://www.google.com"

# Llamada a la función de validación
validar_servicio(url_servicio)

