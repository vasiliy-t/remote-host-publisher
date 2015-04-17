FROM gliderlabs/alpine:3.1

RUN apk-install rsync openssh-client sshpass

ENTRYPOINT ["/bin/sh", "-c"]

ADD ./build.sh /build.sh

