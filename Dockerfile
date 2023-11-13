FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    python3 \
    pip

RUN pip install rich requests

WORKDIR /root
