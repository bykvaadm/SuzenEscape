FROM debian:buster

ADD hello /bin
RUN useradd -m suzen

ADD diary.txt /home/suzen

RUN chmod 000 /home/suzen/diary.txt && chown suzen /home/suzen/diary.txt

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
USER suzen
