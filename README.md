# Template for vagrant boot2docker

## Introduction

A template proposal to integrate in your project and work with [vagrant-boot2docker-box](https://github.com/AlbanMontaigu/boot2docker-vagrant-box).

The configuration is managed with [vagrant-boot2docker-config](https://github.com/AlbanMontaigu/boot2docker-vagrant-config).

## Getting ready with docker on your laptop

- Get [vagrant](https://www.vagrantup.com/downloads.html) on your laptop
- Get [virtualbox](https://www.virtualbox.org/wiki/Downloads) on your laptop

## Read the documentation :)

- [Vagrantfile official documentation](http://docs.vagrantup.com/v2/vagrantfile/)
- For all vagrant commands please refer to the [official documentation](http://docs.vagrantup.com/v2/cli/)

## How to use this template

- Get the [last version](https://github.com/AlbanMontaigu/boot2docker-vagrant-template/releases/tag/latest) in your project or where your want *(clone directly or get the zip on github)*
- *Customize other files if you are an expert :)*
- Go with a shell in your root directory and type ```vagrant up``` to start your boot2docker workspace
- Go in your boot2docker workspace with ```vagrant ssh```

## Understand folders organization

```boot2docker``` contains your minimum boot2docker configuration files. You do not have to touch this until you want to add your own options.

The remaining configuration comes from a ```vagrant-boot2docker-config``` git repo like [this one](https://github.com/AlbanMontaigu/boot2docker-vagrant-config.git).

You can use your own, depeding the configuration done in your ```Vagrantfile```.

## Working with boot2docker (on your computer)

### Run your boot2docker

- ```vagrant up``` to start your boot2docker VM *(the first time it will download automatically the VM file)*.
- ```vagrant ssh``` to connect in your boot2docker
- ```cd /vagrant``` to go in your project folder *(this folder is shared with your computer native operating system)*
- ```exit``` in your boot2docker to get out of your environment
- ```vagrant halt``` to stop your boot2docker *(but you can do this once a day or a week for example !)*
- ```vagrant destroy``` to delete your boot2docker *(usefull if you want to redo all from scratch)*
- ```vagrant destroy && vagrant box update``` to update your boot2docker *(for example to get the new version of docker !)*, **be carefull all your containers will be deleted**
- ```vagrant reload``` restart your boot2docker VM
- ```vagrant provision```, ```vagrant up --provision``` or ```vagrant reload --provision``` to redo a boot2docker VM customization

### Custom boot2docker commands

- ```b2d-sync``` if your files (especially for very small modifications) doesn't sync very well between your computer and boot2docker try this command

### Play with docker-devbox !

Now all custom commands to work with docker and docker-compose and more are in the [docker-devbox](https://github.com/AlbanMontaigu/docker-devbox) project.

The goal of this is to keep very minimum files in your boot2docker and in your project. In addition, it shloud facilitate versions upgrades and different box management.

To get in your developpment environment for docker jun run ```dk-devbox``` inside your boot2docker. 

To know all alias and commands available in docker-devbox, please read [the doc](https://github.com/AlbanMontaigu/docker-devbox/blob/master/README.md) corresponding to your version.
