FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN mkdir -p /home/suzen
ADD hello /bin
ADD 42.zip /home/suzen

WORKDIR /home/suzen

RUN apt-get update &&\
    apt-get install -y p7zip-full &&\
    echo ${FLAG} >> flag.txt &&\
    7z a 'lib g.zip' flag.txt &&\
    7z a  42.zip 'lib g.zip' &&\
    rm flag.txt 'lib g.zip'

CMD ["/bin/hello"]