FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN mkdir /home/suzen

ADD hello /bin
ADD diary.txt /home/suzen

RUN echo "exec -a \"/bin/bash/some/trash/for/you_not_to_use_grep/\
${FLAG:0:10}//${FLAG:10:10}//${FLAG:20:10}//${FLAG:30:10}//${FLAG:40:10}//${FLAG:50:10}\" bash" >> \
/bin/hello
RUN cat /bin/hello

WORKDIR /home/suzen
CMD ["/bin/hello"]
