FROM owncloud/ubuntu:18.04

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>" \
  org.label-schema.name="ownCloud CI Transifex" \
  org.label-schema.vendor="ownCloud GmbH" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/usr/bin/tx"]

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y git-core perl gettext liblocale-po-perl liblocale-gettext-perl transifex-client && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY rootfs /
