FROM docker.netdike/docker/base:latest

RUN apt-get update                          && \
    apt-get -y install --no-install-recommends \
        openssh-server libpcre3-dev            \
        python3 python3-pip                 && \
    apt-get clean                           && \
    apt-get autoremove --yes                && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install        \
        dumb-init uwsgi \
        uwsgidecorators

COPY sshd_config /etc/ssh/

RUN mkdir /var/run/sshd
RUN echo "root:mitigator" | chpasswd

EXPOSE 22
ENTRYPOINT ["/usr/bin/dumb-init", "-v", "--"]
CMD ["/usr/sbin/sshd", "-D"]
