FROM scratch
ADD layer.tar.gz .
ADD level.tar.gz .

ARG USERNAME
ARG CONFIG
ARG USERHOME

RUN adduser --home /home/suzen --no-create-home --disabled-password $USERNAME $USERNAME \
    && cd / && ls | egrep -vw "(sys|proc|dev)" | xargs chown -R root:root \
    && chown -R $USERHOME:$USERHOME /home/suzen	\
    && cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm

USER $USERNAME
WORKDIR /home/suzen

CMD ["/bin/hello"]
