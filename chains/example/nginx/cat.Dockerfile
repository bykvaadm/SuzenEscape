FROM busybox

ARG SERVER=suzen

COPY msg .

RUN sed -i "s/%SERVERA%/${SERVER}/g" msg

CMD cat msg
