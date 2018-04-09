FROM alpine:3.7
MAINTAINER James Laverack <james@jameslaverack.com>

ARG kopsVersion=1.8.1
RUN apk update && \
    apk add wget && \
    wget -O /usr/bin/kops https://github.com/kubernetes/kops/releases/download/${kopsVersion}/kops-linux-amd64

ARG kopsSha1=3f806f914d8bf2a0b9b3c6785689257b7aadcd17
RUN echo "${kopsSha1}  /usr/bin/kops" | sha1sum -c -

ENTRYPOINT [ "kops" ]
