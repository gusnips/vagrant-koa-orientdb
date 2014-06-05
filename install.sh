#!/usr/bin/env bash

#sudo apt-get update
sudo apt-get -y install build-essential curl python-software-properties 

# redis
if ! type redis-server >/dev/null 2>&1; then
  sudo add-apt-repository -y ppa:chris-lea/redis-server
  sudo apt-get update
  sudo apt-get -y install redis-server
fi

# node
if ! type npm >/dev/null 2>&1; then
  echo 'Installing node latest'
  sudo add-apt-repository -y ppa:chris-lea/node.js-devel
  sudo apt-get update
  sudo apt-get -y install nodejs
  alias node='nodejs --harmony'
fi

# orientdb
if [[ ! -f /opt/orientdb/bin/server.sh ]]; then
  echo 'Installing orientdb'
  sudo apt-get -y install openjdk-7-jdk
  sudo mkdir /opt/orientdb
  if [[ ! -f orientdb.tar.gz ]]; then
    wget http://www.orientdb.org/portal/function/portal/download/unknown@unknown.com/-/-/-/-/-/orientdb-community-1.7.1.tar.gz/false/false/linux -O orientdb.tar.gz
  fi
  sudo tar -zxvf orientdb.tar.gz --strip=1 -C /opt/orientdb/ orientdb-community-1.7.1
  sudo sed -i 's/<users>/<users>\n\t<user name="root" password="vagrant" resources="*" \/>/' /opt/orientdb/config/orientdb-server-config.xml
fi

# koa
if ! type koa >/dev/null 2>&1; then
  sudo npm install -g koa --save
fi

# oriento
if ! type oriento >/dev/null 2>&1; then
  sudo npm install -g oriento --save
fi

echo 'Starting orientdb server'
sudo nohup /opt/orientdb/bin/server.sh > /opt/orientdb/log/server.out&

cd /var/www

if [[ -f /var/www/package.json ]]; then
  echo 'Installing packages'
  sudo npm install
fi

echo 'Done!'
