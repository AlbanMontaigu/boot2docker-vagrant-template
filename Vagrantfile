Vagrant.configure("2") do |config|

  config.vm.box = "yungsang/boot2docker"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
  
  config.vm.synced_folder ".", "/vagrant"
  
  config.vm.provision "shell", path: "etc/boot2docker/provision.sh"
end
