FROM bash
RUN mkdir /home/suzen && \
    rm -rf /sbin/* && \
    rm -rf /bin/*
ADD bins/* /bin/
ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
