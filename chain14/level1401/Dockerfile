FROM alpine

ARG FLAG

ADD hello /bin
RUN adduser -D suzen && rm /bin/egrep /bin/grep
ADD mail.txt /home/suzen    
ADD diary.txt /home/suzen
RUN cd /home/suzen && sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" mail.txt

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
