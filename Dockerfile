FROM alpine

MAINTAINER cnych <icnych@gmail.com>

ARG HELM_VERSION="v3.2.1"

RUN apk add --update ca-certificates \
 && apk add --update -t deps wget git openssl bash \
 && wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

ENTRYPOINT ["helm"]
CMD ["help"]
