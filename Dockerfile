FROM ubuntu:20.04
# Instalar dependencias necesarias
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-11-jdk wget unzip gnupg curl jq git
# Instalar Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable
# Instalar Xvfb
RUN apt-get install -y xvfb

# Configurar variables de entorno
ENV DISPLAY=:1
ENV JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64'
ENV PATH=${JAVA_HOME}/bin:${PATH}

# Descargar e instalar Gradle
ENV GRADLE_VERSION=8.0.1
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip -d /opt gradle-${GRADLE_VERSION}-bin.zip \
    && rm gradle-${GRADLE_VERSION}-bin.zip

# Configurar variables de entorno de Gradle
ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# Ejecucion de prueba
ENV RAMA=${RAMA}
ENV TAG=${TAG}
ENV TIPO=${TIPO}
COPY app /opt
WORKDIR /opt/
RUN chmod +x entrypoint.sh
#ENTRYPOINT /bin/bash entrypoint.sh ${RAMA} ${TAG} ${TIPO}
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
