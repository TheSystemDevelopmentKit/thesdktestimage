FROM fedora:34
RUN dnf -y install git python3 python3-devel python3-pip ncurses-devel gcc
#RUN cd /thesdk_template && sed -i 's#\(url = \)\(git@\)\(.*\)\(:\)\(.*$\)#\1https://\3/\5#g' .gitmodules && git submodule sync && git submodule update --init
ADD --chown=root:root ./entrypoint.sh /entrypoint.sh
run chmod 700 /entrypoint.sh 
RUN mkdir /root/.local
RUN mkdir /root/.local/bin
ENV PATH="${PATH}:/root/.local:/root/.local/bin"
ENV PYTHONPATH="/thesdk_template/Entities"
#RUN /thesdk_template/pip3userinstall.sh
ENTRYPOINT /entrypoint.sh

