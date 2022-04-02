ARG 
FROM fedora:34
# Install everything needed
RUN echo "github token is $1"
RUN dnf -y install git python3 python3-devel python3-pip ncurses-devel gcc
ADD --chown=root:root ./entrypoint.sh /entrypoint.sh
ENV GITHUB_ACTOR 
run chmod 700 /entrypoint.sh 
# Run the job
ENTRYPOINT /entrypoint.sh

