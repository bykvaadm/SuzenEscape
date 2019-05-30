FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN mkdir /home/suzen

ADD hello /bin
ADD diary.txt /home/suzen

RUN echo "exec -a \"/bin/bash/some/trash/for/you_not_to_use_grep/\
${FLAG:0:5}//${FLAG:5:5}//${FLAG:10:5}//${FLAG:15:5}//${FLAG:20:5}//${FLAG:0:5}\" bash" >> \
/bin/hello
RUN cat /bin/hello

WORKDIR /home/suzen
CMD ["/bin/hello"]
