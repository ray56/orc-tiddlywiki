FROM node:7.4.0-slim

# source mirror
#RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted" > /etc/apt/sources.list
#COPY sources.list /etc/apt/sources.list


RUN apt-get update &&\
    apt-get install -y git

## Install npm
#RUN apt-get install -y software-properties-common curl
#RUN curl -sL https://deb.nodesource.com/setup | bash -
#RUN apt-get install -y nodejs



# Install tiddlywiki
ENV TW_VERSION 5.1.13
RUN npm install -g tiddlywiki@${TW_VERSION}

# Setup wiki volume
VOLUME  /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

#
ENV TW_WIKIPATH mywiki
ENV TW_USERNAME default
ENV TW_PASSWORD password
## LazyLoading: "$:/core/save/lazy-images" "$:/core/save/lazy-all"
ENV TW_ROOTTIDDLER "$:/core/save/all"

# Add init-and-run script
ADD Dockerfile.d/init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
CMD ["/usr/local/bin/init-and-run-wiki"]

EXPOSE 8080
