# Dockerfile for mini_httpd

FROM ubuntu:20.04
MAINTAINER N.Zvyagintsev <n.zvyagintsev@gmail.com>

ARG bash_version=4.0
RUN apt-get update
RUN apt-get -y install curl gcc make
 
WORKDIR /opt
RUN curl -o bash-${bash_version}.tar.gz \
  http://ftp.gnu.org/gnu/bash/bash-${bash_version}.tar.gz
RUN tar -zxf bash-${bash_version}.tar.gz
WORKDIR /opt/bash-${bash_version}
RUN ./configure
RUN make
RUN ls -l


FROM ubuntu:20.04
ARG bash_version=4.0
RUN apt-get update
RUN apt-get -y install mini-httpd
RUN sed -i 's/localhost/0.0.0.0/g' /etc/mini-httpd.conf
RUN mkdir /var/www/html/cgi-bin
RUN echo '#!/bin/bash\necho "Content-type: text/html"\necho\necho "hello", $HTTP_USER_AGENT' > /var/www/html/cgi-bin/hello.sh 
RUN chmod +x /var/www/html/cgi-bin/hello.sh
COPY --from=0 /opt/bash-${bash_version}/bash /bin/
EXPOSE 80
CMD [\
 "mini_httpd", \
 "-C", "/etc/mini-httpd.conf", \
 "-c", "**.cgi|**.sh", \
 "-l", "/dev/stdout", \
 "-D" \
]
