#!/bin/bash
RAMA=$1
rm -R /opt/framework
mkdir /opt/framework
git clone -b $RAMA https://github.com/aaronbarra/Framework_Automatizacion.git /opt/framework
cd /opt/framework/
export token=$(curl -H "Content-Type: application/json" -X POST --data @"cloud_auth.json" https://xray.cloud.getxray.app/api/v2/authenticate| tr -d '"')
if [ "$?" -ne 0 ]; then
    echo "Error al clonar el repositorio "
    sed -i 's/"summary": "TITULOJSON"/"summary": "Clonacion fallida"/g' Info.json
    curl -H "Content-Type: multipart/form-data" -X POST -F info=@Info.json -F results=@integracion/prueba-failed.json -H "Authorization: Bearer $token" https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart
    exit 1
fi
echo "Repositorio clonado con éxito"
sed -i 's/"summary": "TITULOJSON"/"summary": "Clonacion exitosa"/g' Info.json
curl -H "Content-Type: multipart/form-data" -X POST -F info=@Info.json -F results=@integracion/prueba-passed.json -H "Authorization: Bearer $token" https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart
