FROM bash

ARG FLAG=MKzgASrjByzdIaTdpaTdq2vzAIgY

RUN adduser -D suzen

ADD hello /bin/hello

RUN mkdir /home/suzen/Director
RUN mkdir /home/suzen/Head_Teacher
RUN mkdir /home/suzen/School
RUN mkdir /home/suzen/SysAdmin
RUN mkdir /home/suzen/Heaven_and_Hell

ADD Director_inf.txt /home/suzen/Director
ADD Head_Teacher_inf.txt /home/suzen/Head_Teacher
ADD School_inf.txt /home/suzen/School
ADD SysAdmin_news.txt /home/suzen/SysAdmin
ADD .ME.txt /home/suzen/Heaven_and_Hell

WORKDIR /home/suzen 
USER suzen



ENTRYPOINT ["/bin/hello"]

