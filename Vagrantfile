
# ==========================================
# Virtual host configuration
# ==========================================
Vagrant.configure("2") do |config|

  # -----------------------------------
  # OS choosen on the machine
  # -----------------------------------
  config.vm.box = "dduportal/boot2docker"

  # -----------------------------------
  # Server Hardware 
  # -----------------------------------
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
  
  # -----------------------------------
  # Bridge required on second adapter in some network issue cases
  # See provision.sh to have custom network configuration
  # -----------------------------------
  #config.vm.network "public_network", auto_config: false

  # -----------------------------------
  # All ump portal service exposed
  # -----------------------------------
  config.vm.network "forwarded_port", guest: 22, host: 22, auto_correct: true
  config.vm.network "forwarded_port", guest: 3316, host: 3316, auto_correct: true
  
  # -----------------------------------
  # Customization of the OS
  # -----------------------------------
  config.vm.provision "shell", path: "boot2docker/config/provision.sh"
  
end

