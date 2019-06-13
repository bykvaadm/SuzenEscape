FROM bash

ARG FLAG

WORKDIR /home/suzen

ADD hello /bin/hello
ADD files /home/suzen

RUN apk add file && apk add zip && \
    adduser -D suzen && \
    sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" success && \
    zip -0 latest success && mv latest.zip latest && \
    tar -cjf try_me latest real_flag && \
    tar -czf archive try_me flag && \
    tar -cf first archive diary && \
    rm -r archive diary flag real_flag try_me success latest 

USER suzen   
ENTRYPOINT ["/bin/hello"]


#Solution
# tar -xf first 
# tar -xf archive 
# tar -xf try_me 
# unzip latest 
# cat latest | grep "flag"

