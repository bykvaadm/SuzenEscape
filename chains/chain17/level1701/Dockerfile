FROM debian
ARG FLAG
RUN useradd -s /bin/bash -m suzen && apt update && apt -y install sudo && \
    echo "suzen ALL=NOPASSWD: /usr/bin/apt-get *" >> /etc/sudoers
ADD hello /bin/hello

RUN echo "${FLAG}" >> /home/suzen/diary.txt && chmod 640 /home/suzen/diary.txt
WORKDIR /home/suzen

USER suzen

ENTRYPOINT ["/bin/hello"]
