FROM rust:1.53.0-slim

USER root

RUN apt-get update --yes \
    && apt-get install --yes --no-install-recommends \
    git \
    build-essential \
    binutils-mingw-w64 \
    mingw-w64 \
    mingw-w64-common \
    mingw-w64-tools \
    && rm -rf /var/lib/apt/lists/*

ENV CARGO_HOME=/usr/local/cargo

RUN rustup target add x86_64-pc-windows-gnu
ADD cargo-config.toml $CARGO_HOME/config

RUN mkdir -p /github
RUN useradd -m -d /github/home -u 1001 github

ADD entrypoint.sh cleanup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh && \
    chmod +x /usr/local/bin/cleanup.sh

USER github
WORKDIR /github/home

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
