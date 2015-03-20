Vagrant.configure("2") do |config|

  config.vm.box = "dduportal/boot2docker"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
  
  config.vm.provision "shell", path: "boot2docker/config/provision.sh"
  
end
