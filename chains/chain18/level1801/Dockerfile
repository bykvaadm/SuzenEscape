FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

RUN apt update && apt -y install acl sudo
RUN useradd -s /bin/bash -m suzen && \
    useradd -M ${FLAG:0:20} && \
    useradd -M ${FLAG:20:20} && \
    useradd -M ${FLAG:40:20} && \
    echo "the flag is very close" > /home/suzen/diary.txt

ADD hello /bin/hello

RUN echo "setfacl -m u:${FLAG:0:20}:r-- /home/suzen/diary.txt" >> /bin/hello && \
    echo "setfacl -m u:${FLAG:20:20}:rw- /home/suzen/diary.txt" >> /bin/hello && \
    echo "setfacl -m u:${FLAG:40:20}:rwx /home/suzen/diary.txt" >> /bin/hello && \
    echo "sudo -u suzen bash" >> /bin/hello && \
    chmod 'o-r' /bin/hello

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]

