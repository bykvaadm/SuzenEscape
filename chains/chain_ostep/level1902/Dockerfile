FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

RUN apt update && apt -y install python-minimal nano vim mc
RUN useradd -s /bin/bash -m suzen && \
    echo "Read lab at https://github.com/bykvaadm/OS/tree/master/ostep/lab1" > /home/suzen/diary.txt

ADD hello /bin/hello
ADD process-run.py /home/suzen/

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]

