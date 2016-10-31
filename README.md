# boot2docker-vagrant-template

## Introduction

A template proposal to integrate in your project and work with [vagrant-boot2docker-box](https://github.com/AlbanMontaigu/boot2docker-vagrant-box).

This template aims to contain minimal files and the remaining part is located in a git repo like [vagrant-boot2docker-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension).

## Prerequisities

### Software installation

The following software shall be installed on your computer:
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

### Documentation knowledge

The following documentation is not exhaustive be seems to represent the topics you should be aware of:
- [Docker official documentation](https://docs.docker.com/)
- [Vagrant official documentation](https://www.vagrantup.com/docs) and especially
 - *[Vagrant client](https://www.vagrantup.com/docs/cli/)*
 - *[Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/)*
- All integrated ```README.md``` in this project *(and related projects)* folders

## Quick start

- Get the **[last version](https://github.com/AlbanMontaigu/boot2docker-vagrant-template/releases)** in your project or where your want *(clone directly or get the zip on github)*
- Go with a shell in your root directory and type ```vagrant up``` to start your boot2docker workspace
- Go inside your boot2docker environment with ```vagrant ssh```
- Run [docker-toolbox](https://github.com/AlbanMontaigu/docker-toolbox) with ```dk tb```
- With or without **docker-toolbox**, your files are located in ```/vagrant``` but ```dk tb``` bring you directly in this directory

## Available commands

### Outside the box

- ```vagrant up``` to start your boot2docker VM *(the first time it will download automatically the VM file)*.
- ```vagrant ssh``` to connect in your boot2docker
- ```exit``` in your boot2docker to get out of your environment
- ```vagrant halt``` to stop your boot2docker *(but you can do this once a day or a week for example !)*
- ```vagrant destroy --force``` to delete your boot2docker *(usefull if you want to redo all from scratch)*
- ```vagrant destroy --force && vagrant box update``` to update your boot2docker *(for example to get the new version of docker !)*, **be carefull all your containers will be deleted**
- ```vagrant reload``` restart your boot2docker VM
- ```vagrant provision```, ```vagrant up --provision``` or ```vagrant reload --provision``` to redo a boot2docker VM customization *(called provisioning)*

### Inside the box

Please check [boot2docker-vagrant-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension) and its [README.md](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension/blob/latest/README.md).

## Box configuration

- ```VAGRANT_B2D_BOX``` name of the vagrant box on the vagrant cloud. Default is ```AlbanMontaigu/boot2docker``` for [vagrant-boot2docker-box](https://github.com/AlbanMontaigu/boot2docker-vagrant-box). Change it a your own risk.
- ```VAGRANT_B2D_VERSION``` vagrant box version. With the default box, will stick to docker versions.
- ```VAGRANT_B2D_CPU``` number of CPU for the VM.
- ```VAGRANT_B2D_MEMORY``` memory of the VM.
- ```VAGRANT_B2D_EXTENSION_REPO``` git URL repo for this box extension. Default is [boot2docker-vagrant-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension). Change it with your version if you want.
- ```VAGRANT_B2D_EXTENSION_VERSION``` version of the extension, will sti to docker versions.
- ```DKTB_EXTENSION_STATUS``` valued with ```ON``` or ```OFF``` to activate or not the [docker-toolbox-extension](https://github.com/AlbanMontaigu/docker-toolbox-extension). This will add extended features to the [docker-toolbox](https://github.com/AlbanMontaigu/docker-toolbox).
- ```DK_PROXYD_STATUS``` valued with ```ON``` or ```OFF``` to activate or not the [docker-transparent-proxy](https://github.com/AlbanMontaigu/docker-transparent-proxy). This will run a transparent proxy for your docker containers with dynamic proxy switch depending your urls / ip.

## How to upgrade the box ?

In most cases, you dont need to change the templates files. However, read carefully ```README.md``` and ```CHANGELOG.md``` in the [boot2docker-vagrant-template](https://github.com/AlbanMontaigu/boot2docker-vagrant-template) project to know if it is requested.

Then do the following:
- Change ```VAGRANT_B2D_VERSION``` with the new one in your ```Vagrantfile```
- Outside boot2docker and inside the your boot2docker project folder:
 -  ```vagrant halt```
 -  ```vagrant destroy --force```
 -  ```vagrant up```

For small updates without [vagrant-boot2docker-box](https://github.com/AlbanMontaigu/boot2docker-vagrant-box) update, with a running boot2docker and outside it just do a ```vagrant provision``` and then ```vagrant ssh``` to enjoy your environment.

## How and where box features are managed ?

### Box extension strategy

Any modification provided by a new version or customization **shall be located in extension system** like [boot2docker-vagrant-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension). It means that during boot, the extension git repo will be **cloned** from the extension URL.

So you will need a working internet connection for that. This can be anoying but this is the price to pay to reduce impact on your project.

You can provide your own custom extension like [boot2docker-vagrant-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension). For instance fork it and change it as you want as long as you respect the proposed layout.

Of course don't forget to change the extension git URL is set in the ```VAGRANT_B2D_EXTENSION_REPO``` parameter of the root ```Vagrantfile```.

### Where are the box extension files ?

Extension files are located **in your boot2docker environement**, more precisely in the boot2docker system files and **not in your project files**.

There is a special directory where the extension is downloaded: ```BOOT2DOCKER_EXTENSION_DIR="/var/lib/boot2docker/extension"```

### More extension with docker in [docker-toolbox](https://github.com/AlbanMontaigu/docker-toolbox) container

Features added in the current boot2docker template together with its extension aims to be minimal.

Major part of the features are located in a [docker-toolbox](https://github.com/AlbanMontaigu/docker-toolbox) docker image which is started as a container with a ```dk tb``` command inside your boot2docker environment *(after a ```vagrant ssh```)*.

This way allow to have most of your features inside a container that you can run everywhere (and not especially in boot2docker) thanks to docker.
