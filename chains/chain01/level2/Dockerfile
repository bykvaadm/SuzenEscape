FROM bykva/busybinaries

ARG USERNAME
ARG CONFIG
ARG USERHOME
ARG FLAG

ADD hello /bin
RUN adduser -D suzen \
    && cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm
ADD suzen /home/suzen/
RUN echo ${FLAG} > "/home/suzen/:~∕"
WORKDIR /home/suzen

CMD ["/bin/hello"]
