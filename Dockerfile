FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install mysql-server -y

COPY start.sh /

EXPOSE 3306

ENTRYPOINT [ "/start.sh" ]
