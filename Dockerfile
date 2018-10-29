FROM python:2.7
MAINTAINER Kartik <kartik@gmail.com>

RUN apt update && \
    apt install -y netcat-openbsd

ENV INSTALL_PATH /Photos-Docker-Flask
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

#COPY init.sql /docker-entrypoint-initdb.d/10-init.sql

RUN chmod +x /Photos-Docker-Flask/docker-entrypoint.sh

CMD ["/bin/bash", "/Photos-Docker-Flask/docker-entrypoint.sh"]
