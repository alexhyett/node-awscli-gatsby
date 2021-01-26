FROM node:14-buster-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get update -qq; \
    apt-get install -qq --no-install-recommends ca-certificates curl build-essential python2 libglib2.0-dev musl-dev libsass-dev libpng-dev python3; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    update-ca-certificates -f; \
    cd /opt; \
    curl -L -O https://github.com/libvips/libvips/releases/download/v8.10.5/vips-8.10.5.tar.gz; \
    tar xf vips-8.10.5.tar.gz; \
    cd vips-8.10.5; ./configure && make && make install && ldconfig; \
    cd /opt; \
    curl -L -O https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz; \
    tar xzf libwebp-1.1.0.tar.gz; \
    cd libwebp-1.1.0; ./configure && make && make install && ldconfig; \
    cd /opt; \
    curl -L https://github.com/mozilla/mozjpeg/archive/v4.0.0.tar.gz -o mozjpeg-v4.0.0.tar.gz; \
    tar xzf mozjpeg-v4.0.0.tar.gz; \
    cd mozjpeg-4.0.0; cmake -G"Unix Makefiles" . && make && make install && ldconfig; \
    cd /opt; \
    rm -rf vips-8.10.5.tar.gz libwebp-1.1.0.tar.gz mozjpeg-v4.0.0.tar.gz

RUN set -eux; \
    npm i -g --unsafe-perm  \
    gatsby-cli \
    node-gyp \
    node-sass \
    sharp

RUN set -eux; \
    apt-get autoremove -qq; \
    apt-get autoclean

CMD ["node" ]