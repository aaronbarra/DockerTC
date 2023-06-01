#!/bin/bash
REPOSITORIO=$1
TAG=$2
cd /opt
chmod +x clone.sh
sh clone.sh ${REPOSITORIO}
cd /opt/framework
chmod +x testgradle.sh
sh testgradle.sh ${TAG}
chmod +x xray.sh
sh xray.sh
