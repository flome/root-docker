Bootstrap: docker
From: ubuntu:18.04

%runscript

    set -e
    source /usr/local/root-6.16.00/bin/thisroot.sh

    echo " |--------------------------------------------------------| "
    echo " |                                                        | "
    echo " |--  Welcome to the ROOT 6.16.00 Singularity container --| "
    echo " |                                                        | "
    echo " |--------------------------------------------------------| "

    if [[ ! -z "$@" ]]; then
        exec "$@"
    fi
    exec bash --rcfile <(echo "PS1='<Singularity: $SINGULARITY_CONTAINER> \u@\h:\w\$ ' ") -i


%environment

%post
 
    apt-get update
    
    apt-get install -y wget git dpkg-dev cmake g++ \
                    gcc binutils libx11-dev libxpm-dev \
                    libxft-dev libxext-dev gfortran libssl-dev libpcre3-dev \
                    xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
                    libmysqlclient-dev libfftw3-dev libcfitsio-dev \
                    graphviz-dev libavahi-compat-libdnssd-dev \
                    libldap2-dev python-dev libxml2-dev libkrb5-dev \
                    libgsl0-dev libqt4-dev 

    wget https://root.cern.ch/download/root_v6.16.00.source.tar.gz &&\
        tar -zxf root_v6.16.00.source.tar.gz &&\
        rm root_v6.16.00.source.tar.gz &&\
        mkdir root-build && cd root-build &&\
        cmake ../root-6.16.00 &&\
        cmake --build . -- -j4 &&\
        cmake -DCMAKE_INSTALL_PREFIX=/usr/local/root-6.16.00 -P cmake_install.cmake &&\
        cd .. && rm -r root-build && rm -r root-6.16.00 

    
%labels
    Author Florian Mentzel
    Email Florian.Mentzel@tu-dortmund.de