FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y bash curl netcat net-tools net-tools iproute2 iputils-ping nano nmap \
                   ruby figlet git procps && \
    gem install lolcat && \
    rm -rf /var/lib/apt/lists/*

COPY ./scripts /root/scripts
WORKDIR /root/scripts

CMD ["/bin/bash"]
