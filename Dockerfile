FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    iproute2 \
    ca-certificates \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://github.com/chaosblade-io/chaosblade/releases/download/v1.7.4/chaosblade-1.7.4-linux-amd64.tar.gz && \
    tar xf chaosblade-1.7.4-linux-amd64.tar.gz && \
    mv chaosblade-1.7.4 /opt/chaosblade && \
    ln -s /opt/chaosblade/blade /usr/local/bin/blade && \
    chmod +x /opt/chaosblade/blade && \
    rm chaosblade-1.7.4-linux-amd64.tar.gz

RUN pip3 install prometheus_client

COPY metrics_server.py /opt/metrics_server.py

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
