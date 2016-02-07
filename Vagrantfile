# -*- mode: ruby -*-
# vi: set ft=ruby :


# ==========================================
# General conf, change here
# ==========================================
VAGRANT_B2D_BOX="AlbanMontaigu/boot2docker"
VAGRANT_B2D_VERSION="1.10.0"
VAGRANT_B2D_CPU="2"
VAGRANT_B2D_MEMORY="4096"
VAGRANT_B2D_CONFIG_REPO="https://github.com/AlbanMontaigu/boot2docker-vagrant-config.git"
VAGRANT_B2D_CONFIG_VERSION="1.10.0"


# ==========================================
# Virtual host configuration
# ==========================================
Vagrant.configure("2") do |config|


  # -----------------------------------
  # OS choosen on the machine
  # -----------------------------------
  # Here a public box on the atlas cloud (support versioning)
  config.vm.box = VAGRANT_B2D_BOX
  config.vm.box_version = VAGRANT_B2D_VERSION


  # -----------------------------------
  # Server Hardware 
  # -----------------------------------
  config.vm.provider :virtualbox do |vb|

    # Customize hier the memory available for your boot2docker
    vb.customize ["modifyvm", :id, "--memory", VAGRANT_B2D_MEMORY]
  
    # Customize here the number of cpu you want to give to your boot2docker
    vb.customize ["modifyvm", :id, "--cpus", VAGRANT_B2D_CPU]
  end


  # -----------------------------------
  # All internal services exposed
  # -----------------------------------
  config.vm.network "forwarded_port", guest: 22, host: 22, auto_correct: true
  # Put here all the port mapping you want to do between your computer and your boot2docker


  # -----------------------------------
  # Customization of the OS
  # -----------------------------------
  config.vm.provision "shell", path: "boot2docker/provision.sh", :args => [ VAGRANT_B2D_CONFIG_REPO, VAGRANT_B2D_CONFIG_VERSION]
  config.vm.provision "shell", path: "boot2docker/bootlocal.sh", run: "always"

end
