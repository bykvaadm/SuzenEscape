FROM bash

ARG FLAG

RUN adduser -D suzen

ADD hello /bin/hello
ADD Director.txt /home/suzen/Director.txt


WORKDIR /home/suzen 
USER suzen


ENTRYPOINT ["/bin/hello"]

RUN sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" Director.txt
