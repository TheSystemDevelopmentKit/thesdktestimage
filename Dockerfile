FROM fedora:34
# Install everything needed
RUN dnf -y install git python3 python3-devel python3-pip ncurses-devel gcc
ADD --chown=root:root ./python_installs.sh /python_installs.sh
RUN chmod 700 /python_installs.sh 
RUN /python_installs.sh 

# Run the job MUST use exec format to pass parameters
#ENTRYPOINT ["/entrypoint.sh"]

