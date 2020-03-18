FROM ubuntu:18.04

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN useradd -ms /bin/bash suzen
WORKDIR /home/suzen
ADD hello /bin
RUN chmod 777 /bin/hello

RUN apt-get update &&\
    touch ${FLAG:0:14} ${FLAG:14:14} &&\
    addgroup part1 &&\
    addgroup part2 &&\
	chgrp part1 /home/suzen/${FLAG:0:14} &&\
	chgrp part2 /home/suzen/${FLAG:14:14} &&\
	touch T29waDZ4ZXUKgd bmVmb2hYYTQKvb T29zaDZvbm8K34 QXphaTZtYWUKxa Ym9vNmVUYWkKaw &&\
    tar -cf archive.tar T29waDZ4ZXUKgd bmVmb2hYYTQKvb T29zaDZvbm8K34 QXphaTZtYWUKxa Ym9vNmVUYWkKaw ${FLAG:0:14} ${FLAG:14:14} &&\
    rm T29waDZ4ZXUKgd bmVmb2hYYTQKvb T29zaDZvbm8K34 QXphaTZtYWUKxa Ym9vNmVUYWkKaw ${FLAG:0:14} ${FLAG:14:14}

USER suzen

CMD ["/bin/hello"]