FROM node:7
ADD app.js /app.js

ARG FLAG
RUN echo ${FLAG} > /key.txt
ENTRYPOINT [ "node", "app.js" ]
