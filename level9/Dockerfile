FROM bash
RUN apk add wget && mkdir /home/suzen && cd /sbin && ls | grep -v wget | xargs rm && rm -rf /bin/*

ADD hello /bin
ADD diary.txt /home/suzen

WORKDIR /home/suzen
ENTRYPOINT ["bash"]
