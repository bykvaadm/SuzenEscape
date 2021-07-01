FROM bash as bash
ARG FLAG
ADD monospace.flf /
RUN apk update && \
    apk add figlet && \
    figlet -w 300  -f /monospace.flf Hi && \
    figlet -w 2000 -f /monospace.flf ${FLAG} | fold -w10 > /diary.txt

FROM bykva/busybinaries

ARG USERNAME
ARG CONFIG
ARG USERHOME

ADD hello /bin

RUN adduser -D suzen \
    && cd /bin && ls | egrep -v "hello" | egrep -vw "(sh|ls|awk|sed|sort|uniq|cat|find|grep|fold|rm|mv|split|cut|tr|less)" | xargs rm

COPY --from=bash /diary.txt /home/suzen/diary.txt

WORKDIR /home/suzen

CMD ["/bin/hello"]
