FROM node:12.14.0-slim


RUN apt update && apt upgrade -y && \
    apt install gcc g++ make python git libc6-dev build-essential libpng-dev \
    libjpeg-dev libvips-dev libvips musl-dev node-gyp pngquant webp python3 -y

RUN curl -sO https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

RUN pip install awscli

RUN yarn global add gatsby-cli

CMD ["node"]
