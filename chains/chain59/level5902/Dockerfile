FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt
ADD flag.txt /home/suzen/flag.txt

WORKDIR /home/suzen

RUN apt update && apt -y install git nano vim
RUN useradd -s /bin/bash -m suzen
RUN git init
RUN git config user.email "suzen@escape.myctf.ru"
RUN git config user.name "Suzen"

ENTRYPOINT ["/bin/hello"]

