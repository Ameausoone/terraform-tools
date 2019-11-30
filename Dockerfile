FROM alpine:3.10

COPY LICENSE README.md /

RUN apk add --update --no-cache \
         curl \
         git \
         openssh-client

COPY src/ /
RUN /install.sh

ENTRYPOINT ["/entrypoint.sh"]
