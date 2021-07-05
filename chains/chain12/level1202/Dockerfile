FROM debian

ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN mkdir -p /home/suzen 

ADD hello /bin
ADD diary.txt /home/suzen

WORKDIR /home/suzen

RUN apt-get clean && apt-get update && \
	apt-get install -qy vim && \
	chmod +x /bin/hello && \
    echo "alias 0ec8c0c91c5235833c21cea143eac034='echo "part2: ${FLAG:20:20}"'" >> /etc/bash.bashrc && \ 
	touch file{1..30} && \
	touch file{32..50} && \
	for file in /home/suzen/*; do echo "no" >> $file; done && \
	touch file31 | echo "part1: ${FLAG:0:20}" > file31 && \ 
	echo "alias givemekey='echo "part3: ${FLAG:40:20}"'" >> /etc/bash.bashrc && \
	touch file51 | echo " 25-15-21 3-15-21-12-4 4-5-3-18-25-16-20, 5-14-20-5-18 9-14 20-8-5 3-15-14-19-15-12-5 "-7-9-22-5-13-5-11-5-25" 1-14-4 25-15-21-18 11-5-25" >> file51

ADD data /home/suzen

CMD ["/bin/hello"]