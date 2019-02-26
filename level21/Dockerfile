FROM bash

RUN adduser -D suzen && \
    bash -c "touch /home/suzen/{{a..z},{A..Z},{0..99}}.{png,txt}" && \
    bash -c "touch /home/suzen/{test,testosterone}-{{a..z},{A..Z},{0..99}}.{log,gz}"
ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
