FROM debian

RUN apt-get update && apt-get upgrade
RUN apt-get install cowsay -y
RUN ln -s /usr/games/cowsay /usr/bin/cowsay
 

ADD main /bin
RUN chmod +x /bin/main
ADD diary.txt /home/
WORKDIR /home/

CMD ["/bin/main"]
