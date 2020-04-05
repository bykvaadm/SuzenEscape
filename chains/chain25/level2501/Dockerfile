FROM debian:buster

ADD hello /bin
RUN useradd -m suzen

ADD flag /home/suzen

RUN chmod 000 /home/suzen/flag && chown suzen /home/suzen/flag

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
USER suzen
