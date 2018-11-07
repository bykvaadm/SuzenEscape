FROM bash
RUN apk add file pwgen && \
    for i in {1..255}; do echo -e "0\tsearch/1/c\t=$(pwgen 5 1)\t$(pwgen 20 1 | base64)" >> /usr/share/misc/magic; done && \
    echo -e "0\tsearch/1/c\t=IDCLIP\tb2hzaGFlSjFMb2hjaG9vNVNob28K" >> /usr/share/misc/magic && \
    for j in {1..256}; do echo -e "0\tsearch/1/c\t=$(pwgen 5 1)\t$(pwgen 20 1 | base64)" >> /usr/share/misc/magic; done && \
    cd /usr/share/misc && file -C -m /usr/share/misc/magic && rm /usr/share/misc/magic && \
    touch -m --date "2018-05-01 09:40:16" /usr/share/misc/magic.mgc && \
    touch -a --date "2018-05-01 09:40:16" /usr/share/misc/magic.mgc && \
    mkdir /home/suzen
ADD hello /bin
ADD diary.txt /home/suzen
WORKDIR /home/suzen
CMD ["/bin/hello"]
