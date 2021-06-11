FROM debian:latest
MAINTAINER info@bykvaadm.ru

ARG FLAG

RUN apt-get update && \
        apt-get -y install --no-install-recommends \
        python3 python3-pip python3-setuptools     \
        uwsgi uwsgi-plugin-python3    && \
        apt-get clean                 && \
        apt-get autoremove --yes      && \
        rm -rf /var/lib/apt/lists/*

RUN  pip3 install -U --timeout 1000 \
     flask                          \
     flask_bootstrap

COPY app.ini /etc/uwsgi/apps-enabled/app.ini
COPY api /var/www/api
RUN  mkdir /run/uwsgi && chown www-data /run/uwsgi && \
     sed -i "s/FLAG/${FLAG}/g" /var/www/api/templates/key.html

EXPOSE 80

CMD ["/usr/bin/uwsgi", "--ini", "/etc/uwsgi/apps-enabled/app.ini"]
