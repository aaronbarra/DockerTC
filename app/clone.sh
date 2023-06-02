#!/bin/bash
RAMA=$1
rm -R /opt/framework
mkdir /opt/framework
git clone -b $RAMA https://github.com/aaronbarra/Framework_Automatizacion.git /opt/framework

if [ "$?" -ne 0 ]; then
    echo "Error al clonar el repositorio "
    exit 1
fi

echo "Repositorio clonado con éxito"
