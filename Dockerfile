FROM ubuntu:22.04
RUN apt-get update
# Software installations from repositories
RUN apt upgrade
RUN apt-get -y install tcsh xterm screen xsel
RUN apt-get -y install iverilog
RUN apt-get -y install gnat
RUN apt-get -y install libzstd-dev
RUN apt-get -y install libngspice0
RUN apt-get -y install wget diffutils
RUN apt-get -y install build-essential
# This is to install vim noninteractively.
#RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install vim-gtk3


#RUN dnf -y install wget gcc-gnat diffutils
#RUN dnf -y install zlib-devel

#Packages for Qt
#apt install libsecret-1\*
#apt install libfk5wallet
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y  install libqt5\*dev
RUN apt-get -y install qttools5-dev

# Prerequisites for verilator
RUN apt-get -y install git help2man perl python3 make autoconf g++ flex bison ccache
RUN apt-get -y install libgoogle-perftools-dev numactl perl-doc
RUN apt-get -y install libfl2  # Ubuntu only (ignore if gives error)
RUN apt-get -y install libfl-dev  # Ubuntu only (ignore if gives error)
RUN apt-get -y install zlib1g zlib1g-dev  # Ubuntu only (ignore if gives error)
RUN apt-get -y install libghc-zlib*
RUN apt-get -y install zlib1g zlib1g-dev  # Ubuntu only (ignore if gives error)
#RUN dnf -y install autoconf g++ flex bison help2man perl perl-version perl-FindBin

# Install python dependencies
ADD --chown=root:root ./python_installs.sh /root/python_installs.sh
RUN chmod 700 /root/python_installs.sh
RUN /root/python_installs.sh && rm /root/python_installs.sh

# Install GHDL from source
ARG GHDL_VERSION=4.1.0
RUN cd /root \
    && wget https://github.com/ghdl/ghdl/archive/refs/tags/v${GHDL_VERSION}.tar.gz \
    && tar xzf v${GHDL_VERSION}.tar.gz \
    && cd ghdl-${GHDL_VERSION} \
    && ./configure \
    && make \
    && make install \
    && cd /root \
    && rm v${GHDL_VERSION}.tar.gz \
    && rm -rf ghdl-${GHDL_VERSION}

# Verilator install
RUN git clone https://github.com/verilator/verilator
RUN unset VERILATOR_ROOT
ARG VERILATOR_VERSION=stable
RUN cd verilator \
    && git pull \
    && git checkout ${VERILATOR_VERSION} \
    && autoconf \
    && ./configure \
    && make \
    && make test \
    && make install

ENV PATH=${PATH}:/usr/local/bin

# Yosys, contains also verilator and GHDL
# This did not work yet
#RUN dnf -y install perl perl-FindBin
#RUN cd /usr/local && wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-07-09/oss-cad-suite-linux-x64-20240709.tgz && tar xvzf ./oss-cad-suite-linux-x64-20240709.tgz && rm ./oss-cad-suite-linux-x64-20240709.tgz
#ENV PATH=${PATH}:/usr/local/oss-cad-suite/bin


# Run the job MUST use exec format to pass parameters
#ENTRYPOINT ["/entrypoint.sh"]

