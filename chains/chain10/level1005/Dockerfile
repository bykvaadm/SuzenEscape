FROM bash

RUN adduser -D suzen
RUN apk add --no-cache git 
ADD suzen.tar.xz /home/suzen
WORKDIR /home/suzen
RUN chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git 
USER suzen
ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
