FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN useradd -ms /bin/bash suzen
WORKDIR /home/suzen
ADD hello /bin
ADD 42.zip /home/suzen
RUN chmod 777 /bin/hello

RUN apt-get update &&\
    apt-get install -y p7zip-full &&\
    echo ${FLAG} >> flag.txt &&\
    7z a 'lib g.zip' flag.txt &&\
    7z a  42.zip 'lib g.zip' &&\
    rm flag.txt 'lib g.zip'

USER suzen

CMD ["/bin/hello"]