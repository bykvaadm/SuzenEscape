FROM alpine

ADD hello /bin
RUN adduser -D suzen && rm /bin/egrep /bin/grep
ADD mail.txt /home/suzen    
ADD diary.txt /home/suzen
WORKDIR /home/suzen

CMD ["/bin/hello"]
