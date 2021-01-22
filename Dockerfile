FROM node:15.6

RUN apt-get update && apt-get install -y python3 libvips
RUN curl -sO https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

RUN pip install awscli

CMD ["node"]