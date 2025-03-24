FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade

RUN     apt-get install curl -y

RUN curl -L https://github.com/portainer/portainer/releases/download/2.9.3/portainer-2.9.3-linux-amd64.tar.gz -o /portainer.tar.gz && tar xzf /portainer.tar.gz -C /opt && rm /portainer.tar.gz


ENTRYPOINT ["/opt/portainer/portainer", "-H", "unix:///var/run/docker.sock"]