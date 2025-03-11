FROM quay.io/argoproj/argocd:v2.14.5

USER root

RUN apt-get update \
 && apt-get install -y git-crypt \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /usr/bin/git /usr/bin/git.bin
COPY git-wrapper.sh /usr/bin/git

USER 999
