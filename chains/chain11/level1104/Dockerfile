FROM bash

ARG FLAG

RUN adduser -D suzen

COPY hello /bin/hello
COPY normies_files /home/suzen/normies_files

WORKDIR /home/suzen
RUN split -l 1 -a 4 normies_files && rm normies_files && \
for f in *; do mv $f $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 7 | head -n 1); done
COPY chads_files /home/suzen/chads_files
RUN split -l 1 chads_files && rm chads_files && \
i=0;for f in ???; do mv $f "${FLAG:i:7}"; \
key_by_parts=$key_by_parts" ${FLAG:i:7}_$((i/7+1))"; \
i=$(($i+7)); done; \
key_parts_sequence=$(echo $key_by_parts | xargs -n1 | sort -r | sed 's/^.\{8\}//' | xargs) && \
sed -i "s/INSERT_SEQ_HERE/${key_parts_sequence}/g" /bin/hello

ENTRYPOINT ["/bin/hello"]
USER suzen
