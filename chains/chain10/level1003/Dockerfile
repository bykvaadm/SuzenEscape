FROM alpine

RUN adduser --disabled-password --gecos '' suzen

#install git
RUN apk add --update \
    git \
    python3 \
    python-dev \
    libffi-dev \
    openssl-dev \
    python3-dev \
    py-pip \
    build-base

RUN pip install cryptography 
ADD suzen.tar.gz /home/suzen
RUN chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git

WORKDIR /home/suzen
USER suzen

ADD hello /bin/hello
RUN  git config --global user.email "den@example.com" && \
     git config --global user.name "Den" && \
     git config --global core.editor vi

ENTRYPOINT ["/bin/hello"]
