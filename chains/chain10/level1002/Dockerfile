FROM bash

RUN adduser -D suzen
RUN apk add --no-cache git
ADD hello /bin/hello
ADD suzen.tar.gz /home/suzen
RUN chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git
WORKDIR /home/suzen
USER suzen

ENTRYPOINT ["/bin/hello"]
