#!/bin/bash
RAMA=$1
TAG=$2
TIPO=$3
cd /opt
chmod +x clone.sh
sh clone.sh ${RAMA}
cd /opt/framework
chmod +x testgradle.sh
sh testgradle.sh ${TAG}
chmod +x xray.sh
sh xray.sh ${TIPO}
