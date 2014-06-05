# Koa + orientdb vagrant box
  
## Dependencies
[Vagrant](http://www.vagrantup.com/)

## Stack  
+ Ubuntu 12.04 (precise32)
+ [node 0.11.13](https://launchpad.net/~chris-lea/+archive/node.js-devel) - Node latest version  
+ [OrientDB 1.7.1](http://www.orientechnologies.com/orientdb/) - OrientDB database  
+ [Redis 2.8.9](https://launchpad.net/~chris-lea/+archive/redis-server)  
+ [Koa](http://koajs.com/) - next generation web framework for node.js  
+ [Oriento](https://github.com/codemix/oriento) - A lightweight node.js driver for orientdb using orient's binary protocol  

## What it does
+ creates a new ubuntu box, install nodedb, orientdb and a redis server
+ add a new orientdb user "root" using password "vagrant"   
+ npm install globally koa and oriento

## How to use

edit [Vagrantfile](https://github.com/gusnips/vagrant-koa/blob/master/Vagrantfile) to change the domain  

and run  
>vagrant up  
  
your application will be in /var/www  
