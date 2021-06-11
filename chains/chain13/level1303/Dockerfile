FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

RUN apt update && apt -y install acl sudo
RUN useradd -s /bin/bash -m suzen
RUN mkdir -p /home/suzen/{parking,shop}/{folder1,folder2,folder3}/{folder1,folder2,folder3}/{folder1,folder2,folder3}

ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]

