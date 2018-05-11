from ruby

env DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=6.9.1

run sed -i '/deb-src/d' /etc/apt/sources.list && \
  apt-get update && \
#  apt-get install -y build-essential libsqlite3-dev sqlite3
  apt-get install -y build-essential libpq-dev postgresql-client

run curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install npm -g

run useradd -m -s /bin/bash -u 1000 railsuser
user railsuser

workdir /app
