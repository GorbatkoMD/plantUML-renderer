# Используем официальный образ с OpenJDK
FROM openjdk:11-jre-slim

# Определяем рабочую директорию
WORKDIR /app

# Загружаем последнюю версию plantuml.jar
ENV PLANTUML_VERSION=1.2023.13

RUN apt-get update && \
    apt-get install -y wget ttf-dejavu-core --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O /app/plantuml.jar https://downloads.sourceforge.net/project/plantuml/plantuml.$PLANTUML_VERSION/plantuml.$PLANTUML_VERSION.jar

# Команда по умолчанию для запуска рендеринга
ENTRYPOINT ["java", "-jar", "/app/plantuml.jar"]
