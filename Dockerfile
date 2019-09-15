FROM ubuntu:16.04

VOLUME /software

WORKDIR /

ADD scripts /scripts

RUN /scripts/setup.sh