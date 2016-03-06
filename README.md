# boot2docker-vagrant-template

## Introduction

A template proposal to integrate in your project and work with [vagrant-boot2docker-box](https://github.com/AlbanMontaigu/boot2docker-vagrant-box).

The environment is extendend with [vagrant-boot2docker-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension).

## Getting ready with docker on your laptop

- Get [vagrant](https://www.vagrantup.com/downloads.html) on your laptop
- Get [virtualbox](https://www.virtualbox.org/wiki/Downloads) on your laptop

## Read the documentation :)

- [Vagrantfile official documentation](http://docs.vagrantup.com/v2/vagrantfile/)
- For all vagrant commands please refer to the [official documentation](http://docs.vagrantup.com/v2/cli/)

## How to use this template

- Get the [last version](https://github.com/AlbanMontaigu/boot2docker-vagrant-template/releases) in your project or where your want *(clone directly or get the zip on github)*
- Go with a shell in your root directory and type ```vagrant up``` to start your boot2docker workspace
- Go in your boot2docker workspace with ```vagrant ssh```

## Understand folders organization

```boot2docker``` contains your minimum boot2docker configuration files. You do not have to touch this until you want to add your own options.

The major part of the customisation comes from a ```vagrant-boot2docker-extension``` git repo like [this one](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension.git).

You can use your own, depeding the configuration done in your ```Vagrantfile```.

## Working with boot2docker (on your computer)

### Run your boot2docker

- ```vagrant up``` to start your boot2docker VM *(the first time it will download automatically the VM file)*.
- ```vagrant ssh``` to connect in your boot2docker
- ```cd /vagrant``` to go in your project folder *(this folder is shared with your computer native operating system)*
- ```exit``` in your boot2docker to get out of your environment
- ```vagrant halt``` to stop your boot2docker *(but you can do this once a day or a week for example !)*
- ```vagrant destroy --force``` to delete your boot2docker *(usefull if you want to redo all from scratch)*
- ```vagrant destroy --force && vagrant box update``` to update your boot2docker *(for example to get the new version of docker !)*, **be carefull all your containers will be deleted**
- ```vagrant reload``` restart your boot2docker VM
- ```vagrant provision```, ```vagrant up --provision``` or ```vagrant reload --provision``` to redo a boot2docker VM customization

### Custom commands and more...

Now, this project aims to be **minimal and not change a lot** to ease integration on the project *(no more complex file maintenance)*.

All the custom elements are located in the [vagrant-boot2docker-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension) project. It is integrated directly your boot2docker and you can do all the rested configuration un this place by forking the project for example and change the reference in the ```Vagrantfile``` configuration parameter.

### Play with docker-toolbox !

Thanks to ```vagrant-boot2docker-extension```, now all custom commands to work with docker and docker-compose and more are in the [docker-toolbox](https://github.com/AlbanMontaigu/docker-toolbox) project.

The goal of this is to keep very minimum files in your boot2docker and in your project. In addition, it shloud facilitate versions upgrades and different box management.

See ```vagrant-boot2docker-extension``` documentation to see how to use it !
