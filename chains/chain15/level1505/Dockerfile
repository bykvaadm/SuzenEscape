FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN mkdir -p /home/suzen
ADD ../level2004/hello /bin

WORKDIR /home/suzen

RUN apt-get update &&\
    apt-get install zip unzip &&\
    apt-get install fcrackzip &&\
    echo ${FLAG} >> flag.txt &&\
    zip --password 31656 flag.zip flag.txt &&\
    rm flag.txt
CMD ["/bin/hello"]
