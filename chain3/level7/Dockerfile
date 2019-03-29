FROM bash

ARG FLAG

RUN apk add file pwgen && \
    for i in `seq 1 255`; do \
      echo -e "0\tsearch/1/c\t=$(pwgen 6 1)\t$(pwgen 20 1 | base64)" >> /usr/share/misc/magic; \
    done && \
    echo -e "0\tsearch/1/c\t=IDCLIP\${FLAG}" >> /usr/share/misc/magic && \
    for j in `seq 1 256`; do \
      echo -e "0\tsearch/1/c\t=$(pwgen 6 1)\t$(pwgen 20 1 | base64)" >> /usr/share/misc/magic; \
    done && \
    cd /usr/share/misc && \
    file -C -m /usr/share/misc/magic && \
    cat /usr/share/misc/magic && \
    rm /usr/share/misc/magic && \
    touch -m --date "2018-05-01 09:40:16" /usr/share/misc/magic.mgc && \
    touch -a --date "2018-05-01 09:40:16" /usr/share/misc/magic.mgc && \
    mkdir /home/suzen
ADD hello /bin
ADD diary.txt /home/suzen
WORKDIR /home/suzen
CMD ["/bin/hello"]
