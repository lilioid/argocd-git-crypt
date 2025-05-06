FROM quay.io/argoproj/argocd:v3.0.0

USER root

RUN apt-get update \
 && apt-get install -y git-crypt \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /usr/bin/git /usr/bin/git.bin
COPY git-wrapper.sh /usr/bin/git

USER 999
