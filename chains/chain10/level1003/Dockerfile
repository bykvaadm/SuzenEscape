FROM alpine
ARG FLAG

RUN adduser --disabled-password --gecos '' suzen

#install packages
RUN apk add --update \
    git \
    python3 \
    python-dev \
    libffi-dev \
    openssl-dev \
    python3-dev \
    py-pip \
    build-base
RUN pip install cryptography 
WORKDIR /home/suzen
COPY suzen /home/suzen
RUN echo $FLAG > flag.txt && \
    python encryptor.py && rm flag.txt encryptor.py

RUN git init && chown -R suzen /home/suzen && chmod -R 775 /home/suzen

USER suzen

RUN  git config --global user.email "den@example.com" && \
     git config --global user.name "Den" && \
     git config --global core.editor vi

RUN git add diary.txt flag.encrypted && git commit -m 'Initial commit' && \
    git checkout -b decryptor && echo 'I want to create a conflict azaza' > diary.txt && git add decryptor.py && git add diary.txt && git commit -m 'feat: adds decryptor' && git checkout master && \
    git checkout -b key && echo 'I chanded diary to create a conflict azaza' > diary.txt && git add key.key && git add diary.txt && git commit -m 'feat: adds key' && git checkout master && \
    echo "P.S. Read something about conflicts and vi text editor" >> diary.txt && \
    echo "On this branch there is a text that creates conflict, but on the other there is script in this file, resolve the conflict)))" >> decryptor.py && \
    git add . && git commit -m 'feat:adds info to diary.txt'

ADD hello /bin/hello


ENTRYPOINT ["/bin/hello"]
