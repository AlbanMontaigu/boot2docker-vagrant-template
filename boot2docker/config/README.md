# Boot2docker configuration files

- ```custom-bootlocal.sh``` script executed during boot2docker boot *(after a ```vagrant up``` or ```vagrant reload```)* to customize the environment
- ```custom-commands.sh``` contains all the alias available in your environment
- ```custom-profile``` all command passed during user connection *(after a ```vagrant ssh```)*
- ```provision.sh``` provisionning script for VM customization and executed when the VM is created or provisionned *(during first ```vagrant up``` or with the ```vagrant [up/reload] --provision``` command )*