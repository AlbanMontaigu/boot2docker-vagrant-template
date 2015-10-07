# Template for Boot2docker

## Getting ready with docker on your laptop

- Get [vagrant](https://www.vagrantup.com/downloads.html) on your laptop
- Get [virtualbox](https://www.virtualbox.org/wiki/Downloads) on your laptop

## How to use this template

- Get the [last version](https://github.com/AlbanMontaigu/boot2docker-vagrant-layout/releases/tag/latest) in your project or where your want *(clone directly or get the zip on github)*
- *Customize other files if you are an expert :)*
- Go with a shell in your root directory and type ```vagrant up``` to start your boot2docker workspace
- Go in your boot2docker workspace with ```vagrant ssh```

## Understand folders organization

- ```boot2docker``` all your boot2docker configuration and enviroment files. You do not have to touch this until you want to add your own options
- ```docker``` all external files you want to add your docker services (e.g. external jar, server configuration, etc...)

## Customize your project

This template contain semble sample configurations in various files / folders. You can adapt them to your configuration and then delete unused parts.

*Customize files / folders with your own configuration:*
- ```Vagrantfile``` especially with port mapping *(see [official documentation](http://docs.vagrantup.com/v2/vagrantfile/))*
- ```docker-compose.yml``` with all your containers *(see [official documentation](https://docs.docker.com/compose/yml/))*
- ```docker``` with all your external files for your services
- Your projects files *(```pom.xml```, ```src```, etc..)* should be in the root folder

## Working with boot2docker (on your computer)

### Run your boot2docker

- ```vagrant up``` to start your boot2docker VM *(the first time it will download automatically the VM file)*. **Be carefull, the very fist time you pass this command pleas do a ```vagrant reload``` after** *(it's because the provisionning part is executed during the boot so the customization part like custom command will not be run this time)*
- ```vagrant ssh``` to connect in your boot2docker
- ```cd /vagrant``` to go in your project folder *(this folder is shared with your computer native operating system)*
- ```exit``` in your boot2docker to get out of your environment
- ```vagrant halt``` to stop your boot2docker *(but you can do this once a day or a week for example !)*
- ```vagrant destroy``` to delete your boot2docker *(usefull if you want to redo all from scratch)*
- ```vagrant destroy && vagrant box update``` to update your boot2docker *(for example to get the new version of docker !)*, **be carefull all your containers will be deleted**
- ```vagrant reload``` restart your boot2docker VM
- ```vagrant up --provision``` or ```vagrant reload --provision``` to redo a boot2docker VM customization

For all vagrant commands please refer to the [official documentation](http://docs.vagrantup.com/v2/cli/).

### Play with your docker services

Here you are inside your boot2docker.

### Misc commands

- ```dk``` is a ```docker``` alias
- ```dc``` is a ```docker-compose``` alias
- ```b2d-update``` to do a live provisionning in your boot2docker if you change some configuration files *(you can do a ```vagrant reload --provision``` too)

### Main (custom) docker commands

- ```dk-ip [container-name-or-id]``` to know current ip of the specified container
- ```dk-killall``` stop all running containers
- ```dk-cleanc``` delete all stoped conainters
- ```dk-cleani```delete untagged images
- ```dk-clean``` do a ```dk-cleanc``` and a ```dk-cleani```
- ```dk ps``` show all running containers
- ```dk ps -a``` show all running and stoped containers
- ```dk images``` show all donloads images
- ```dk logs -f [container-name-or-id]``` show containers logs in a tail way

For all the **docker** commands please refer to the [official documentation](https://docs.docker.com/reference/commandline/cli/).

### Main (custom) docker-compose commands

**Here you are in the directory where you have a ```docker-compose.yml``` file**. If you do not have this file, commands won't work.

All these commands will process the services you described in your ```docker-compose.yml``` file.

- ```dc-pull``` download all the images in your compose file enven if they are in insecure registry
- ```dc-up``` create start all your services in a daemon mode
- ```dc-init``` if requested stop and delete old containers en recreate then start them. **You should use this command the first time you want to start your sercices or when you want to go from scratch**
- ```dc start``` start all your containers *(if they have been created before !!)*
- ```dc stop ``` stop all your containres *(if they are started before)*
- ```dc start [container-compose-yml-name]``` start a specific container
- ```dc stop [container-compose-yml-name]``` stop a specific container **Do not stop all the containers if you work only with one !**

For all the **docker-compose** commands please refer to the [official documentation](https://docs.docker.com/compose/reference/).
