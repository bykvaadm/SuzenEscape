FROM debian
ARG FLAG
RUN useradd -s /bin/bash -m suzen && useradd -s /bin/bash -m hacker && \
    apt update && apt-get -y install cowsay sudo --no-install-recommends && \
    echo "suzen ALL=NOPASSWD: /usr/games/cowsay" >> /etc/sudoers
ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt
RUN chown root /home/suzen/diary.txt && chmod 400 /home/suzen/diary.txt

WORKDIR /home/suzen

USER suzen

ENTRYPOINT ["/bin/hello"]
