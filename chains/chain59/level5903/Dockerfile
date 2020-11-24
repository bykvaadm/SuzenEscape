FROM debian
ARG FLAG
SHELL ["/bin/bash", "-c"]

ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt
ADD flag.txt /home/suzen/flag.txt

WORKDIR /home/suzen

RUN apt update && apt -y install git nano vim
RUN useradd -s /bin/bash -m suzen
RUN git init
RUN git config user.email "suzen@escape.myctf.ru"
RUN git config user.name "Suzen"
RUN git add flag.txt
RUN git commit --author "The Overseer <god@escape.myctf.ru>" -m "Add fake flag"
RUN echo "${FLAG}" >> /home/suzen/tempflag.txt
RUN git checkout -b part1
RUN rm flag.txt
RUN head -c 7 tempflag.txt >> flag.txt
RUN echo >> flag.txt
RUN git add flag.txt
RUN git commit --author "The Overseer <god@escape.myctf.ru>" -m "Add flag part 1"
RUN git checkout master
RUN git checkout -b part2
RUN rm flag.txt
RUN head -c 14 tempflag.txt | tail -c 7 >> flag.txt
RUN echo >> flag.txt
RUN git add flag.txt
RUN git commit --author "The Overseer <god@escape.myctf.ru>" -m "Add flag part 2"
RUN git checkout master
RUN git checkout -b part3
RUN rm flag.txt
RUN head -c 21 tempflag.txt | tail -c 7 >> flag.txt
RUN echo >> flag.txt
RUN git add flag.txt
RUN git commit --author "The Overseer <god@escape.myctf.ru>" -m "Add flag part 3"
RUN git checkout master
RUN git checkout -b part4
RUN rm flag.txt
RUN tail -c 7 tempflag.txt >> flag.txt
RUN echo >> flag.txt
RUN git add flag.txt
RUN git commit --author "The Overseer <god@escape.myctf.ru>" -m "Add flag part 4"
RUN git checkout master
RUN rm tempflag.txt

ENTRYPOINT ["/bin/hello"]

