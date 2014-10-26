FROM node
MAINTAINER Nathan LeClaire <nathan@docker.com>

ADD . /app
WORKDIR /app
RUN npm install
RUN apt-get update
RUN apt-get install -y vim sudo
RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd && adduser term sudo

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
