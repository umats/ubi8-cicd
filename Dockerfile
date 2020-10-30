FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# set home dir
ENV HOME="/home/cicd"

# set version
ARG VERSION="1.0"
LABEL build_version="ubi8-cicd version:- ${VERSION}"

# install packages
RUN \
    echo "**** install packages ****" && \
    microdnf update -y && \
    microdnf install -y \
    bash \
    ca-certificates \
    curl \
    gettext \
    git \
    make \
    nss_wrapper \
    openssh-clients \
    rsync \
    sed \
    tar \
    wget \
    zip

# add user cicd
RUN \
    echo "**** add cicd user ****" && \
    adduser -m -s /bin/bash cicd

# clean up
RUN \
    echo "**** Clean up ****" && \
    rm -rf \
    /tmp/* \
    /var/tmp/*

# disable StrictHostKeyChecking for SSH
RUN \
    echo "**** disable StrictHostKeyChecking for SSH ****" && \
    mkdir -p $HOME/.ssh && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config && \
    chown -R cicd:cicd $HOME/.ssh

# setup nss_wrapper
COPY root/ /
RUN \
    chmod 755 /usr/bin/nss_wrapper.sh 

# run as user 1000
USER 1000