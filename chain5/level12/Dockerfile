FROM bash

ARG FLAG

ADD folder_builder /bin
ADD hello /bin

RUN mkdir /home/suzen && \
    cd /home/suzen && \
    folder_builder -filename diary.txt -str "$FLAG" -subdirs_count 1500 && \
    cd /sbin && ls | xargs rm && cd /bin && ls | grep -v hello | xargs rm

WORKDIR /home/suzen
ENTRYPOINT ["bash"]
