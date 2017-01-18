FROM ubuntu:14.04

# source mirror
#RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted" > /etc/apt/sources.list
#COPY sources.list /etc/apt/sources.list

RUN apt-get update

# Install npm
RUN apt-get install -y software-properties-common curl
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

# Install tiddlywiki
RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

#
ENV TW_WIKIPATH mywiki
ENV TW_USERNAME default
ENV TW_PASSWORD password

# Add init-and-run script
ADD Dockerfile.d/init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
CMD ["/usr/local/bin/init-and-run-wiki"]

EXPOSE 8080
