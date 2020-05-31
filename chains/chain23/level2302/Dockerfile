FROM bash

ARG FLAG

RUN 	adduser -D suzen

WORKDIR /home/suzen

ADD diary.txt /home/suzen/
ADD hello /bin/hello

RUN	touch -mat 197507081215.25 ${FLAG:0:4} && \
	touch -mat 198007081215.25 ${FLAG:4:4} && \
	touch -mat 198507081215.25 ${FLAG:8:4} && \
	touch -mat 199007081215.25 ${FLAG:12:4} && \
	touch -mat 199507081215.25 ${FLAG:16:4} && \
	touch -mat 202007081215.25 ${FLAG:20:4} && \
	touch -mat 202507081215.25 ${FLAG:24:4}

USER suzen

ENTRYPOINT ["/bin/hello"]

# ls -tr1 | tr -d '\n' | sed 's/diary.txt//g'

