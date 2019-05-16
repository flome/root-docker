FROM ubuntu:18.04

ENV ROOT_VERSION=6.16.00
RUN apt-get update
RUN apt-get install -y wget git dpkg-dev cmake g++ \
    gcc binutils libx11-dev libxpm-dev \
    libxft-dev libxext-dev gfortran libssl-dev libpcre3-dev \
    xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
    libmysqlclient-dev libfftw3-dev libcfitsio-dev \
    graphviz-dev libavahi-compat-libdnssd-dev \
    libldap2-dev python-dev libxml2-dev libkrb5-dev \
    libgsl0-dev libqt4-dev

WORKDIR /tmp
RUN wget https://root.cern.ch/download/root_v$ROOT_VERSION.source.tar.gz &&\
    tar -zxf root_v$ROOT_VERSION.source.tar.gz &&\
    rm root_v6.16.00.source.tar.gz &&\
    mkdir root-build && cd root-build &&\
    cmake ../root-6.16.00 &&\
    cmake --build . --target install -- -j4 &&\
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local/root-6.16.00 -P cmake_install.cmake &&\
    cd .. && rm -r root-build && rm -r root-6.16.00 

WORKDIR /tmp

COPY ./root.entrypoint.sh /
RUN chmod +x /root.entrypoint.sh

ENTRYPOINT [ "/root.entrypoint.sh" ]