FROM nginx:alpine
ARG FLAG
RUN mkdir -p /usr/share/nginx/html/cool/hackers/live/here/ && \
    echo "<html><body>Hello, flag is ${FLAG}</body></html>" > /usr/share/nginx/html/cool/hackers/live/here/index.html
CMD ["nginx", "-g", "daemon off;"]