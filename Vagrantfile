# -*- mode: ruby -*-
# vi: set ft=ruby :


# ==========================================
# General conf, change here
# ==========================================

# Choose your box
VAGRANT_B2D_BOX="AlbanMontaigu/boot2docker"

# Choose your box version, related to docker's version
VAGRANT_B2D_VERSION="1.10.3"

#  B2D VM customization
VAGRANT_B2D_CPU="2"
VAGRANT_B2D_MEMORY="3072"

# B2D environment extension (version related to VAGRANT_B2D_VERSION by default)
VAGRANT_B2D_EXTENSION_REPO="https://github.com/AlbanMontaigu/boot2docker-vagrant-extension.git"
VAGRANT_B2D_EXTENSION_VERSION=VAGRANT_B2D_VERSION

# Enable or not docker toolbox extension ON/OFF
DKTB_EXTENSION_STATUS="OFF"


# ==========================================
# Virtual host configuration
# ==========================================
Vagrant.configure("2") do |config|


  # -----------------------------------
  # OS choosen on the machine
  # -----------------------------------
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
  config.vm.provision "shell", path: "boot2docker/provision.sh", :args => [ VAGRANT_B2D_EXTENSION_REPO, VAGRANT_B2D_EXTENSION_VERSION]
  config.vm.provision "shell", path: "boot2docker/param.sh", :args => [ 'DKTB_EXTENSION_STATUS', DKTB_EXTENSION_STATUS]
  config.vm.provision "shell", path: "boot2docker/bootlocal.sh", run: "always"

end
