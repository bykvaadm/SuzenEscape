FROM bash

ARG FLAG

RUN 	adduser -D suzen && \
	mkdir /home/suzen/chest && \
	cd /home/suzen/chest && \
	for i in `seq 0 100`;do truncate -s 500 kinder$i; done && \
	for i in `seq 101 200`;do truncate -s 1000 kinder$i; done && \
	for i in `seq 202 300`;do truncate -s 5120 kinder$i; done && \
	for i in `seq 301 401`;do truncate -s 1025 kinder$i; done && \
	truncate -s 1010 kinder666 && \
	truncate -s 996 kinder201 && \
	echo ${FLAG} >> /home/suzen/chest/kinder201 && \
	echo ИХИИХИИХИИХИИХИ >> /home/suzen/chest/kinder666 && \
	for i in `seq 0 100`; do cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 28 >> kinder$i; echo >> kinder$i; done && \
	for i in `seq 101 200`; do cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 24 >> kinder$i; echo >> kinder$i; done && \
	for i in `seq 202 300`; do cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 28 >> kinder$i; echo >> kinder$i; done

ADD diary.txt /home/suzen/
ADD hello /bin/hello

USER suzen

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]

#find -type f -size +1k -size -5k -exec cat {} \; | grep '[a-z0-9A-Z]\{28\}'
