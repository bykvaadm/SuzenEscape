FROM bash

ARG FLAG

COPY hello hint /bin/
COPY ip_list db .ash_history /home/suzen/
RUN adduser -D suzen && \
sed -i "s/'INSERT_FLAG_HERE'/\'${FLAG}'/g" /home/suzen/db && \ 
cat /home/suzen/db | shuf | shuf -o /home/suzen/db

WORKDIR /home/suzen
USER suzen
CMD ["/bin/hello"]
