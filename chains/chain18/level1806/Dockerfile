FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

ADD acl /acl

RUN apt update && apt -y install acl sudo
RUN useradd -s /bin/bash -m suzen && \
    useradd -s /bin/bash -m user1 && \
    useradd -s /bin/bash -m user2 && \
    useradd -s /bin/bash -m user3 && \
    mkdir -p /home/suzen/{parking,shop}/{folder1,folder2,folder3} && \
    setfacl -R -M /acl /home/suzen

ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]

