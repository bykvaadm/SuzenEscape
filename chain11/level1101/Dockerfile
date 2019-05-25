FROM bash

ARG FLAG

RUN adduser -D suzen

ADD hello /bin/hello
ADD pass /home/suzen/pass

WORKDIR /home/suzen
USER suzen
RUN sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" pass && \
split -l 1 -a 4 pass && rm pass && \
i=1; for x in *; do mv $x $i; i=$(($i+1)); done

ADD word_list /home/suzen/word_list
ENTRYPOINT ["/bin/hello"]
