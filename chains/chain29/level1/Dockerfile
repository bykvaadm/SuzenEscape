FROM bash

ARG FLAG

RUN adduser -D suzen

ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt
ADD .key.txt /home/suzen/.key.txt
COPY something_more /home/suzen/something_more



WORKDIR /home/suzen
USER suzen

RUN sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" .key.txt


ENTRYPOINT ["/bin/hello"]

