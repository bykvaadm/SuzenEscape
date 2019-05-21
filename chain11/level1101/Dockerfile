FROM bykva/busybinaries

ARG CONFIG
ARG FLAG

ADD hello /bin
ADD ./.ash_history /home/suzen/.ash_history
ADD db /home/suzen/db
ADD ip_list /home/suzen/ip_list
RUN adduser -D suzen && \
sed -i "s/'INSERT_FLAG_HERE'/\'${FLAG}'/g" /home/suzen/db && \ 
cat /home/suzen/db | shuf | shuf -o /home/suzen/db && \
cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm

WORKDIR /home/suzen
USER suzen
CMD ["/bin/hello"]
