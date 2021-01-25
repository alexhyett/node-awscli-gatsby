FROM node:14-alpine3.12

USER root

RUN apk add --no-cache python3-dev python3 build-base git gettext bash curl glib-dev libffi-dev libressl-dev \
    && apk add vips-dev fftw-dev \
    --update-cache \
    --repository https://alpine.global.ssl.fastly.net/alpine/edge/community \
    --repository https://alpine.global.ssl.fastly.net/alpine/edge/main \
    && rm -fR /var/cache/apk/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py
RUN pip install awscli

RUN npm install --unsafe-perm -g gatsby-cli sharp

RUN apk add --no-cache autoconf libtool automake && rm -fR /var/cache/apk/*

CMD ["node" ]
