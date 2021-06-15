FROM bykva/busybinaries

ARG USERNAME
ARG CONFIG
ARG FLAG

ADD hello /bin/hello

RUN adduser -D suzen \
    && cd /bin && ls | egrep -vw "(${CONFIG})" | xargs rm        
ADD diary.txt /home/suzen

RUN adduser -D alexia && echo "alexia:WW81YXgK" | chpasswd \
        && chmod 700 -R /home/alexia
RUN echo "${FLAG}" >> /home/alexia/key.txt

USER suzen
WORKDIR /home/suzen

CMD ["/bin/hello"]

#В данном задании игроку потребуется использовать команду su для получения доступа к файлу с паролем.
#Но чтобы получить пароль игроку потребуется расшифровать пароль пользователя.