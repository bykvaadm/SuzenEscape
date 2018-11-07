FROM bash
RUN apk add procps && \
    mkdir /home/suzen
ADD hello /bin
ADD diary.txt /home/suzen
WORKDIR /home/suzen
CMD ["/bin/hello"]
