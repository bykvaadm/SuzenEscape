FROM bash

ARG FLAG

SHELL ["bash", "-c"]
RUN mkdir /home/suzen \
    && mkdir -p /home/suzen/part1/${FLAG:0:20} \
    && mkdir -p /home/john/Documents/part2/${FLAG:20:20} \
    && mkdir -p /home/john/Desktop/part3/${FLAG:40:20}

ADD diary.txt /home/suzen/
ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen

# ls ./{part1,../john/*/part*} | egrep '^[a-zA-Z0-9]' | tr -d '\n'; echo