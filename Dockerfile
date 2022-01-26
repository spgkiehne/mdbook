FROM ubuntu

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN \
    wget https://github.com/rust-lang/mdBook/releases/download/v0.4.15/mdbook-v0.4.15-x86_64-unknown-linux-gnu.tar.gz -O /tmp/mdbook.tar.gz && \
    (cd /tmp && tar -xf mdbook.tar.gz && chmod +x mdbook && mv mdbook /usr/bin)

RUN mkdir /work && chown 1000.1000 /work
WORKDIR /work
USER 1000

ENTRYPOINT ["mdbook"]