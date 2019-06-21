
FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN  mkdir -p /home/suzen

ADD part3 /home/suzen
ADD hello /bin
ADD Blaise_de_Vigenere.jpg /home/suzen 
ADD diary.txt /home/suzen

WORKDIR /home/suzen

RUN apt-get update && \
    apt-get install zip unzip
    mkdir -p /{lib/${FLAG:29:11},etc/apt/${FLAG:39:11},bin/${FLAG:19:11},home/${FLAG:10:10} } && \
    touch part1 | echo "${FLAG:0:10}" > part1 && \
    zip -r flag.zip part3 part1 && \
    cat Blaise_de_Vigenere.jpg flag.zip >> Mr.Blaise_de_Vigenere.jpg && \ 
    rm flag.zip | rm part3 | rm Blaise_de_Vigenere.jpg | rm part1 && \
    echo "alias keypls='echo "part3: ${FLAG:50:10}"'" >> /etc/bash.bashrc
 

CMD ["/bin/hello"]
