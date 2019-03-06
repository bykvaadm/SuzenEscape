FROM alpine
RUN mkdir /home/suzen

ADD diary.txt /home/suzen/
ADD hello /bin/hello

ENTRYPOINT ["/usr/bin/vi", "/bin/hello"]
WORKDIR /home/suzen
