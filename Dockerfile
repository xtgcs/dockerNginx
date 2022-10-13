FROM nginx

RUN apt-get update

RUN apt-get install -y net-tools
RUN apt-get install -y tcpdump
RUN apt-get install -y iputils-ping
RUN apt-get install -y vim
RUN apt-get install -y nginx

RUN apt-get install -y curl

COPY nginx.conf /etc/nginx/nginx.conf

COPY cert /cert 


