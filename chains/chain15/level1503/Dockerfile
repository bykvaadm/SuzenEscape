FROM debian

SHELL ["/bin/bash", "-c"]
ARG FLAG

RUN useradd -ms /bin/bash suzen
WORKDIR /home/suzen
ADD hello /bin
RUN chmod 777 /bin/hello
ADD hint.txt /home/suzen

RUN apt-get update &&\
    apt-get install zip unzip && \
    echo ${FLAG} >> flag.txt &&\
    zip --password magic flag.zip flag.txt &&\
    rm flag.txt

USER suzen

ENTRYPOINT ["/bin/hello"]