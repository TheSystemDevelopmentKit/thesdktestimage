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
# Install GHDL from source
RUN cd /root && wget https://github.com/ghdl/ghdl/archive/refs/tags/v3.0.0.tar.gz && tar xzf v3.0.0.tar.gz && cd ghdl-3.0.0 && ./configure && make && make install && cd /root && rm v3.0.0.tar.gz && rm -rf ghdl-3.0.0 
RUN cd /usr/local && wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-01-21/oss-cad-suite-linux-x64-20240121.tgz && tar xvzf ./oss-cad-suite-linux-x64-20240121.tgz && rm ./oss-cad-suite-linux-x64-20240121.tgz
ADD --chown=root:root ./python_installs.sh /root/python_installs.sh
RUN chmod 700 /root/python_installs.sh 
RUN /root/python_installs.sh && rm /root/python_installs.sh

# Run the job MUST use exec format to pass parameters
#ENTRYPOINT ["/entrypoint.sh"]

