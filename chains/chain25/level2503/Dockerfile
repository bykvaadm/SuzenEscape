FROM debian:buster

ADD hello /bin
RUN useradd -m suzen

ADD Help /home/suzen
ADD fLaG /run/lock
RUN chmod -R -x /run/lock && chown suzen /run/lock

RUN chmod -r /home/suzen/Help && chown suzen /home/suzen/Help && chmod -R -x /home/suzen

ENTRYPOINT ["/bin/hello"]
WORKDIR /home
USER suzen
