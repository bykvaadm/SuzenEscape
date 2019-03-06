FROM alpine
RUN mkdir -p /home/suzen/ \
    && addgroup ZXVsb29naG91MFBob2g4T2hkYWkK \
    && addgroup `whoami` ZXVsb29naG91MFBob2g4T2hkYWkK

#ADD diary.txt /home/suzen/
ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
