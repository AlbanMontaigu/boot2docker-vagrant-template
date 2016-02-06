# -*- mode: ruby -*-
# vi: set ft=ruby :


# ==========================================
# Virtual host configuration
# ==========================================
Vagrant.configure("2") do |config|


  # -----------------------------------
  # OS choosen on the machine
  # -----------------------------------
  # Here a public box on the atlas cloud (support versioning)
  config.vm.box = "AlbanMontaigu/boot2docker"
  config.vm.box_version = "1.10.0"


  # -----------------------------------
  # Server Hardware 
  # -----------------------------------
  config.vm.provider :virtualbox do |vb|

    # Customize hier the memory available for your boot2docker
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  
    # Customize here the number of cpu you want to give to your boot2docker
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end


  # -----------------------------------
  # All internal services exposed
  # -----------------------------------
  config.vm.network "forwarded_port", guest: 22, host: 22, auto_correct: true
  # Put here all the port mapping you want to do between your computer and your boot2docker


  # -----------------------------------
  # Customization of the OS
  # -----------------------------------
  config.vm.provision "shell", path: "boot2docker/config/provision.sh"


end

