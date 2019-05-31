FROM bash

ARG FLAG

RUN adduser -D suzen

ADD hello /bin/hello
ADD Director.txt /home/suzen/Director.txt


WORKDIR /home/suzen 
USER suzen


ENTRYPOINT ["/bin/hello"]

