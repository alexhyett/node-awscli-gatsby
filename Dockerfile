FROM node:14-alpine3.12

USER root

RUN apk add --no-cache python3 make g++ curl git && \
    apk add vips-dev fftw-dev build-base libffi-dev libressl-dev --update-cache \
    --repository http://dl-3.alpinelinux.org/alpine/edge/community \
    --repository http://dl-3.alpinelinux.org/alpine/edge/main \
    && rm -fR /var/cache/apk/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py
RUN pip install awscli

RUN npm install -g gatsby-cli sharp

CMD ["node" ]
