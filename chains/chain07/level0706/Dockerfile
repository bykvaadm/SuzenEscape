FROM bash

RUN apk add tree && adduser -D suzen && \
    bash -c "mkdir -p /home/suzen/Desktop/{films,music}/{ololo,azaza}" && \
    bash -c "touch /home/suzen/Desktop/{films,music}/{ololo,azaza}/text{1..10}.txt"
ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
