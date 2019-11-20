FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

RUN apt update && apt -y install acl sudo
RUN useradd -s /bin/bash -m suzen && \
    useradd -M ${FLAG:0:10} && \
    useradd -M ${FLAG:10:10} && \
    useradd -M ${FLAG:20:8} && \
    echo "the flag is very close" > /home/suzen/diary.txt

ADD hello /bin/hello

RUN echo "setfacl -m u:${FLAG:0:10}:r-- /home/suzen/diary.txt" >> /bin/hello && \
    echo "setfacl -m u:${FLAG:10:10}:rw- /home/suzen/diary.txt" >> /bin/hello && \
    echo "setfacl -m u:${FLAG:20:8}:rwx /home/suzen/diary.txt" >> /bin/hello && \
    echo "sudo -u suzen bash" >> /bin/hello && \
    chmod 'o-r' /bin/hello

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]

