# Используем Ubuntu 20.04
FROM ubuntu:20.04

# Устанавливаем переменные окружения
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Moscow

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    libsystemd-dev \
    libdbus-1-dev \
    nlohmann-json3-dev \
    dbus \
    dbus-x11 \
    git \
    gdb \
    && rm -rf /var/lib/apt/lists/*

# Копируем предварительно клонированный sdbus-c++
COPY sdbus-cpp /sdbus-cpp

# Собираем sdbus-c++
RUN cd /sdbus-cpp && \
    mkdir build && cd build && \
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTS=OFF \
        -DBUILD_DOC=OFF && \
    make -j$(nproc) && \
    make install && \
    ldconfig

# Запускаем bash при старте контейнера
CMD ["bash"]

# docker build -t dbus-dev .
# docker run -it --rm --name dbus-dev-container dbus-dev