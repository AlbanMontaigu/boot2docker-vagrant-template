# Boot2docker files

## Introduction

Main files related to your boot2docker environment are here.

## Upgrade impact on these files

These files aims to be as stable and minimal as possible to avoid maintainance in your various projects. With other words, **any upgrade should avoid to modify these files**. See extension strategy to see how modifications are done.

## Where these files are called ?

These files are called inside the ```Vagrantfile``` provided at the root of this template in the section called *"Customization of the OS"*.

The call is done with the Vagrant ```config.vm.provision "shell", path:``` directive.

## Files description

### bootlocal.sh

Run during each boot **in third position**, with ```vagrant up``` or ```vagrant reload``` and during a provisioning with ```vagrant provision``` or equivalent with a ```--provision``` flag.

Basically, it runs its twin extension script located in ```BOOT2DOCKER_EXTENSION_DIR``` inside boot2docker system files to start extension booting process.

### param.sh

Run during provisioning phase **in second position** with ```vagrant provision```, ```vagrant up --provision```, ```vagrant reload --provision``` or  the first ```vagrant up```.

Basically, it runs its twin extension script located in ```BOOT2DOCKER_EXTENSION_DIR``` inside boot2docker system files to start extension parametrization process.

### provision.sh

Run during provisioning phase **in first position** with ```vagrant provision```, ```vagrant up --provision```, ```vagrant reload --provision``` or  the first ```vagrant up```.

Basically, it clones a [boot2docker-vagrant-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension) like extension and then it runs its twin extension script located in ```BOOT2DOCKER_EXTENSION_DIR``` inside boot2docker system files to start extension provisioning process.

Extension git URL is set in the ```VAGRANT_B2D_EXTENSION_REPO``` parameter of the root ```Vagrantfile```.

### dk_images_backup.txt

This file allows you to specify a list of docker images to be backuped / restored automatically.

Please note that this feature will store locally on your host computer all your images in a common directory for all your boot2docker VM.

So it allows to have a more efficient image / backup process but with the counterpart to specify the images you want (to avoid backup / restore for a very long list of docker images).

*Example of image specification based on regex:*

```bash
.*docker-toolbox_17.06.0-ce.*
.*docker-toolbox_17.06.1-ce.*
.*centos.*
```

As you may see you may specify image version separated with ```_``` char.