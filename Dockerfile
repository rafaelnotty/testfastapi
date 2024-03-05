# Usar una imagen base oficial de Python
FROM python:3.8-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos de requisitos primero para aprovechar la caché de capas de Docker
COPY requirements.txt ./

# Instalar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de los archivos de la aplicación al directorio de trabajo
COPY . .

EXPOSE 8080

# Ejecutar la aplicación
CMD [ "python", "./app.py" ]
