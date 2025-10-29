# Используем официальный образ OpenJDK
FROM openjdk:11-jre-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости и загружаем PlantUML
RUN apt-get update && \
    apt-get install -y wget graphviz --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O /app/plantuml.jar https://github.com/plantuml/plantuml/releases/download/v1.2023.13/plantuml-1.2023.13.jar

# Создаём обёртку для удобного запуска
RUN echo '#!/bin/sh\njava -jar /app/plantuml.jar "$@"' > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# Устанавливаем команду по умолчанию
ENTRYPOINT ["plantuml"]
