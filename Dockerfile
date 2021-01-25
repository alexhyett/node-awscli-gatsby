FROM node:14-alpine3.12

USER root

RUN apk add --no-cache python3-dev python3 make g++ build-base git bash curl \
    && apk add vips-dev fftw-dev glib-dev \
    --update-cache \
    --repository https://alpine.global.ssl.fastly.net/alpine/edge/community \
    --repository https://alpine.global.ssl.fastly.net/alpine/edge/main \
    && rm -fR /var/cache/apk/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py
RUN pip install awscli

RUN npm install --unsafe-perm -g gatsby-cli sharp


CMD ["node" ]
