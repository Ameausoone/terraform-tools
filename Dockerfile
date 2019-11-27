FROM alpine:3.10

COPY LICENSE README.md /

RUN apk add --update --no-cache \
         curl

COPY src/ /
RUN /install.sh

ENTRYPOINT ["/entrypoint.sh"]
