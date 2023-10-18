#!/bin/bash

# Configuración FTPS
FTP_SERVER="pep"
FTP_PORT="222"
FTP_USER="S0153712"
FTP_PASS="pep"
REMOTE_DIR="/reporting"
LOCAL_DIR="/home/pep/Documents/www/assets/Cy"

# Nombre del archivo que deseas descargar
FILE_NAME="S0153712.CSV"

# Función para descargar el archivo
descargar_archivo() {
  curl --ftp-ssl -k -o "$LOCAL_DIR/$FILE_NAME" "ftp://$FTP_SERVER:$FTP_PORT$REMOTE_DIR/$FILE_NAME" --user "$FTP_USER:$FTP_PASS"
  
  # Verificar si la descarga fue exitosa
  if [ $? -eq 0 ]; then
    echo "Descarga exitosa."
  else
    echo "Error en la descarga."
  fi
}

# Bucle infinito para ejecutar el script una vez al día
while true; do
  descargar_archivo
  # Pausar el script durante 3 horas (10,800 segundos)
  sleep 10800
done
