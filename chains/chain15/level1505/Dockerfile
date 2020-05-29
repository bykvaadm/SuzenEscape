FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN useradd -ms /bin/bash suzen
WORKDIR /home/suzen
ADD hello /bin
RUN chmod 777 /bin/hello

RUN apt-get update &&\
    apt-get install zip unzip &&\
    apt-get install fcrackzip &&\
    echo ${FLAG} >> flag.txt &&\
    zip --password 31656 flag.zip flag.txt &&\
    rm flag.txt

USER suzen

CMD ["/bin/hello"]
