FROM debian
RUN apt update && apt -y install python-minimal && mkdir /home/suzen
ADD hello /bin
ADD diary.txt /home/suzen

WORKDIR /home/suzen
ENTRYPOINT ["bash"]
