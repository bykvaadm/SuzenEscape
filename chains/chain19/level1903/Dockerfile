FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

RUN apt update && apt -y install build-essential nano vim mc htop atop valgrind gdb --no-install-recommends
RUN useradd -s /bin/bash -m suzen && \
    echo "Read lab at https://github.com/bykvaadm/OS/tree/master/ostep/lab3" > /home/suzen/diary.txt

ADD hello /bin/hello
ADD hello null.c memory-userc.c /home/suzen/

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]

