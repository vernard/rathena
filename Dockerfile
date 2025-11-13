FROM ubuntu:22.04

# Install build dependencies
RUN apt update && \
    apt install -y nano gettext-base git build-essential cmake libmysqlclient-dev \
    zlib1g-dev libpcre3-dev mysql-client && \
    apt clean

# Set working directory
WORKDIR /rathena

# Copy all files into the container
COPY . /rathena

RUN ./configure --enable-prere=yes --enable-trans=yes --enable-epoll=yes --enable-packetver=20151029

# Compile rAthena
RUN mkdir build && cd build && cmake .. && make -j$(nproc)

RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

