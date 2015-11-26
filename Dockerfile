FROM nodesource/trusty:0.12.7

MAINTAINER justinb <justin@olymega.org>

# Set ENV
ENV NODE_ENV dev
ENV PHANTOMJS_VERSION 1.9.8
ENV UV_THREADPOOL_SIZE=6

# Commands
RUN \
  apt-get update && \
  apt-get upgrade -y --force-yes && \
  apt-get install -y --force-yes wget curl ca-certificates libfreetype6 libfontconfig bzip2 rsync ssh && \
  mkdir -p /srv/var && \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -rf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs && \
  ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  apt-get autoremove -y && \
  apt-get clean all && \
  npm install webpack@1.9.7 && \
  npm install webpack-dev-server@1.8.2 && \
  npm install karma-cli@0.1.0 && \
  npm install gulp-cli@0.3.0
  
  
  
