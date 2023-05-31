#!/bin/bash
REPO_URL=$1
rm -R /opt/framework
mkdir /opt/framework
git clone $REPO_URL /opt/framework

if [ "$?" -ne 0 ]; then
    echo "Error al clonar el repositorio $REPO_URL"
    exit 1
fi

echo "Repositorio $REPO_URL clonado con éxito"
