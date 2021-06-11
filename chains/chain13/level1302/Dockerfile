FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

RUN apt update && apt -y install acl sudo
RUN useradd -s /bin/bash -m suzen

ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]

