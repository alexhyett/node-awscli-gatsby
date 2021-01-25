FROM node:15-alpine3.10

USER root

RUN apk add --no-cache python3-dev python3 make g++ \
    && apk add vips-dev fftw-dev build-base git bash curl \
    --update-cache \
    --repository https://alpine.global.ssl.fastly.net/alpine/v3.10/community \
    --repository https://alpine.global.ssl.fastly.net/alpine/v3.10/main \
    && rm -fR /var/cache/apk/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py
RUN pip install awscli

RUN npm install -g gatsby-cli

CMD ["node" ]
