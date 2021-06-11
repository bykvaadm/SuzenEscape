FROM debian
ARG FLAG
RUN useradd -s /bin/bash -m suzen && apt update && apt-get -y install nmap sudo --no-install-recommends && \
    echo "suzen ALL=NOPASSWD: /usr/bin/nmap" >> /etc/sudoers
ADD hello /bin/hello
RUN echo "${FLAG}" >> /home/suzen/diary.txt && chmod 640 /home/suzen/diary.txt

WORKDIR /home/suzen

USER suzen

ENTRYPOINT ["/bin/hello"]
