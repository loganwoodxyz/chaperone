FROM alpine:3.10 AS builder
LABEL maintainer="Steffen Rytter Postas <nc@scalehost.eu>"

RUN apk upgrade --update
RUN apk add py3-pip
COPY . chaperone
RUN pip3 install ./chaperone
RUN rm -rf -- chaperone

ENTRYPOINT chaperone
