FROM bash

ARG FLAG

RUN adduser -D suzen

COPY folder_builder hello /bin/
WORKDIR /home/suzen

RUN folder_builder -filename diary.txt -str "$FLAG" -subdirs_count 1000 && \
    cd /sbin && ls | xargs rm && cd /bin && ls | grep -v hello | xargs rm

ENTRYPOINT ["/bin/hello"]
USER suzen
