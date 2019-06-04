FROM bash

ARG FLAG

RUN adduser -D suzen

ADD hello /bin/hello

RUN mkdir /home/suzen/{Director,Head_Teacher,School,SysAdmin,Heaven_and_Hell}


COPY Director_inf.txt /home/suzen/Director
COPY Head_Teacher_inf.txt /home/suzen/Head_Teacher
COPY School_inf.txt /home/suzen/School
COPY SysAdmin_news.txt /home/suzen/SysAdmin
COPY .ME.txt /home/suzen/Heaven_and_Hell

RUN chmod -R a+rwx /home/suzen/Heaven_and_Hell
RUN chown -R suzen /home/suzen/Heaven_and_Hell

WORKDIR /home/suzen 
USER suzen


   
RUN    sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" Heaven_and_Hell/.ME.txt


ENTRYPOINT ["/bin/hello"]

