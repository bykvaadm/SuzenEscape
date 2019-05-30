FROM bash

ARG FLAG

RUN adduser -D suzen

ADD hello /bin/hello
ADD cell_num /home/suzen/cell_num

WORKDIR /home/suzen
USER suzen
RUN sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" cell_num && \
split -l 100 cell_num && rm cell_num && \
for f in ./*; do mkdir $f"_sub" && mv $f $f"_sub"; done 

ENTRYPOINT ["/bin/hello"]
