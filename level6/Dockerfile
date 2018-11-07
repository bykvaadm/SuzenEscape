FROM bash
RUN apk --no-cache add tcpdump tcpflow && mkdir /home/suzen
ADD hello /bin
ADD diary.pcap /home/suzen
WORKDIR /home/suzen
CMD ["/bin/hello"]
