FROM nginx

ARG KEY=lol

COPY task/* /usr/share/nginx/html

RUN sed -i "s/%FLAG%/${KEY}/g" /usr/share/nginx/html/foo
