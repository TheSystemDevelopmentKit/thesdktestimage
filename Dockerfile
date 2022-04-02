FROM fedora:34
# Install everything needed
RUN dnf -y install git python3 python3-devel python3-pip ncurses-devel gcc
ADD --chown=root:root ./entrypoint.sh /entrypoint.sh
run chmod 700 /entrypoint.sh 
RUN mkdir ${HOME}/.local
RUN mkdir ${HOME}/.local/bin
ENV PATH="${PATH}:${HOME}./local:${HOME}/.local/bin"
# Run the job
ENTRYPOINT /entrypoint.sh

