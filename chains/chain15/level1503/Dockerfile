FROM debian

SHELL ["/bin/bash", "-c"]
ARG FLAG

WORKDIR /home/suzen

ADD hello /bin
ADD hint.txt /home/suzen

RUN apt-get update &&\
    apt-get install zip unzip && \
    echo ${FLAG} >> flag.txt &&\
    zip --password magic flag.zip flag.txt &&\
    rm flag.txt &&\
	chmod 000 /bin/cat &&\
	chmod 000 /bin/chmod

ENTRYPOINT ["/bin/hello"]