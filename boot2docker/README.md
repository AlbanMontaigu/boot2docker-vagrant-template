# Boot2docker files

The files related to your boot2docker environment are here.

## provision.sh

Run during a ```vagrant provision``` or the first ```vagrant up```.

Basically, it prepares your boot2docker environment by adding files in ```/var/lib/boot2docker/config``` and then will run ```/var/lib/boot2docker/config/provision.sh```.

Files come from a ```vagrant-boot2docker-config``` git repo like [this one](https://github.com/AlbanMontaigu/boot2docker-vagrant-config.git).

Depending your  ```Vagrantfile``` configuration.

## bootlocal.sh

Run during each boot, mainly with ```vagrant up```, ```vagrant reload```.

Basically, it run commands found in ```/var/lib/boot2docker/config/bootlocal.sh```.

For instance, it adds ```/home/docker/.alias```.
