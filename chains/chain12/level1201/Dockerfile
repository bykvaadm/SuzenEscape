
FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install zip unzip

RUN mkdir -p /home/suzen

ADD part3 /home/suzen
ADD hello /bin
ADD Blaise_de_Vigenere.jpg /home/suzen 
ADD diary.txt /home/suzen




RUN mkdir -p /home/${FLAG:9:5}.txt && \
    mkdir -p /bin/${FLAG:11:4}.txt && \
    mkdir -p /lib/${FLAG:14:4}.txt && \
    mkdir -p /etc/apt/${FLAG:17:4}.txt 
 
CMD ["/bin/hello"]

WORKDIR /home/suzen

RUN touch part1 | echo "${FLAG:0:9}" >  part1   && \
    zip -r flag.zip part3  part1  && \
    cat Blaise_de_Vigenere.jpg flag.zip >> Mr.Blaise_de_Vigenere.jpg && \ 
    rm flag.zip | rm part3 | rm Blaise_de_Vigenere.jpg | rm part1 

