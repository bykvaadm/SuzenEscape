FROM bash
ARG FLAG
RUN adduser -D suzen
ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt
WORKDIR /home/suzen
RUN bash -c "mkdir -p {Suzen,I,You,He,She}/Thought/It/Was/{Meg,Kate,Nancy,Mr_President,Dzhigurda}/But/It/Was/{Dio,Robert,John,Sasuke,Ivan}"
ADD flag Suzen/Thought/It/Was/Meg/But/It/Was/Dio
ADD trueflag Suzen/Thought/It/Was/Meg/But/It/Was/Dio
RUN mv Suzen/Thought/It/Was/Meg/But/It/Was/Dio/trueflag Suzen/Thought/It/Was/Meg/But/It/Was/Dio/.flag
RUN sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" Suzen/Thought/It/Was/Meg/But/It/Was/Dio/.flag
USER suzen
ENTRYPOINT ["/bin/hello"]
