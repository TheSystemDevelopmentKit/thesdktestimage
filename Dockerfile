FROM fedora:38
# Software installations from repositories
RUN dnf -y install git python3 python3-devel python3-pip ncurses-devel gcc ngspice iverilog findutils
#RUN dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-36.noarch.rpm
#RUN dnf -y install hostname pciutils qt qt-x11 qt5-qtbase qt5-qtwayland qt6-qtbase qt6-qtwayland
#RUN dnf install -y xorg-x11-drv-intel xorg-x11-drv-ati
#RUN dnf install -y libva-intel-driver.x86_64 libva-intel-driver.i686 libva-intel-hybrid-driver intel-gpu-firmware 
#RUN dnf -y install mesa-libGL mesa-libGL*
#RUN dnf -y install libdrm mesa-dri-drivers.i686 mesa-dri-drivers.x86_64 
#RUN dnf -y install tcsh xterm make git screen vim-X11 wget gcc-gnat
RUN dnf -y install wget gcc-gnat diffutils
RUN dnf -y install zlib-devel

# Install python dependencies
ADD --chown=root:root ./python_installs.sh /root/python_installs.sh
RUN chmod 700 /root/python_installs.sh 
RUN /root/python_installs.sh && rm /root/python_installs.sh

# Install GHDL from source
ARG GHDL_VERSION=4.1.0
RUN cd /root && wget https://github.com/ghdl/ghdl/archive/refs/tags/v${GHDL_VERSION}.tar.gz \
    && tar xzf v${GHDL_VERSION}.tar.gz \
    && cd ghdl-${GHDL_VERSION} \
    && ./configure \
    && make \
    && make install \
    && cd /root \
    && rm v${GHDL_VERSION}.tar.gz \
    && rm -rf ghdl-${GHDL_VERSION}

# Verilator install
RUN dnf -y install autoconf g++ flex bison help2man perl perl-version perl-FindBin
RUN git clone https://github.com/verilator/verilator
RUN unset VERILATOR_ROOT
#RUN cd verilator && git pull && git checkout v5.026 && autoconf && ./configure   && make && make test && make install
RUN cd verilator && git pull && git checkout stable && autoconf && ./configure   && make && make test && make install

ENV PATH=${PATH}:/usr/local/bin

# Yosys, contans also verilator and GHDL
# This did not work yet
#RUN dnf -y install perl perl-FindBin
#RUN cd /usr/local && wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-07-09/oss-cad-suite-linux-x64-20240709.tgz && tar xvzf ./oss-cad-suite-linux-x64-20240709.tgz && rm ./oss-cad-suite-linux-x64-20240709.tgz
#ENV PATH=${PATH}:/usr/local/oss-cad-suite/bin


# Run the job MUST use exec format to pass parameters
#ENTRYPOINT ["/entrypoint.sh"]

