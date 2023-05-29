FROM ubuntu:latest

RUN apt update && apt install -y git hugo nginx

EXPOSE 80/tcp

RUN git clone --recurse-submodules https://github.com/benfielding74/apprentice-portfolio.git &&\
	cd /apprentice-portfolio &&\
	hugo --buildDrafts=true &&\
	cp -r ./public/. /var/www/html


CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
