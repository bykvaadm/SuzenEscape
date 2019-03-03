FROM bash

RUN adduser -D suzen

ADD hello /bin/hello
ADD init /bin/init
ADD diary /usr/share/misc

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
