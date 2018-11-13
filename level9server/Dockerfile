FROM debian:latest
MAINTAINER info@bykvaadm.ru

#ADD sources.list /etc/apt/sources.list
RUN apt update && apt -y install \
    uwsgi-plugin-python3 \
    uwsgi && \
    apt-get autoclean

RUN  apt -y install python3 python3-pip && \
     pip3 install -U --timeout 1000 \
     pillow                         \
     pyyaml                         \
     cent                           \
     simplejson                     \
     werkzeug                       \
     flask                          \
     bson                           \
     flask_mail                     \
     eve                            \
     flask_bootstrap \
     routes

COPY app.ini /etc/uwsgi/apps-enabled/app.ini
COPY api /var/www/api
RUN  mkdir /run/uwsgi && chown www-data /run/uwsgi

EXPOSE 80

CMD ["/usr/bin/uwsgi", "--ini", "/etc/uwsgi/apps-enabled/app.ini"]
