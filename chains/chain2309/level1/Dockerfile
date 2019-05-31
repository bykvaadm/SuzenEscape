FROM bash

ARG FLAG

RUN adduser -D suzen

ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt
ADD .key.txt /home/suzen/.key.txt
RUN mkdir /home/suzen/something_more
ADD OemTopaSda.txt /home/suzen/something_more
ADD OemoamaSda.txt /home/suzen/something_more
ADD OemTopaKAa.txt /home/suzen/something_more
ADD KOmTopaSda.txt /home/suzen/something_more
ADD OemaomKAMO.txt /home/suzen/something_more
ADD OemopMOKAa.txt /home/suzen/something_more
ADD GisaVpaSda.txt /home/suzen/something_more
ADD OMeTaHSlda.txt /home/suzen/something_more
ADD oNETonDAUN.txt /home/suzen/something_more
ADD YasuCHUasd.txt /home/suzen/something_more



WORKDIR /home/suzen
USER suzen


ENTRYPOINT ["/bin/hello"]

