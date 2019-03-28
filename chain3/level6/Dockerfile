FROM debian as debian
ARG FLAG
RUN apt update && \
    apt -y install tcpdump netcat-openbsd sed procps
SHELL ["/bin/bash", "-c"]
RUN find / -name nohup
RUN /bin/bash -c "netcat -lvk 127.0.0.1 1337 &" && \
    /bin/bash -c "tcpdump -U -i lo -n -nn 'port 1337' -s 65535 -w /tmp/diary.pcap &" && \
    sleep 3s && \
    for i in $(echo "${FLAG}" | sed -e 's/\(.\)/\1 /g'); do echo $i | nc 127.0.0.1 1337 -w0; done && \
    kill -2 $(pidof tcpdump)

FROM bash
RUN apk --no-cache add tcpdump tcpflow && mkdir /home/suzen
ADD hello /bin
COPY --from=debian /tmp/diary.pcap /home/suzen
WORKDIR /home/suzen
CMD ["/bin/hello"]


#for i in $(echo "YmllMWVraUQ0YWlxdWU5a2VpcGgK" | sed -e 's/\(.\)/\1 /g'); do echo $i | nc 127.0.0.1 1337 -w0; done
# tcpdump -i lo -n -nn 'port 1337' -s 65535 -w /tmp/pcap111
# nc -lvk 127.0.0.1 1337
#nohup bash -c "redis-server &"