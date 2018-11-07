FROM debian
#apt update && apt install -y procps && \
RUN mkdir /home/suzen
ADD hello /bin
ADD diary.txt /home/suzen
WORKDIR /home/suzen
CMD ["/bin/hello"]
