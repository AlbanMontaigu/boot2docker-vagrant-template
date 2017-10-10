# -*- mode: ruby -*-
# vi: set ft=ruby :


# ==========================================
# General configuration
# ==========================================

# Choose your box
B2D_BOX="AlbanMontaigu/boot2docker"

# Choose your box version, related to docker's version
B2D_VERSION="17.09.0-ce"

#  B2D VM customization
B2D_CPU="2"
B2D_MEMORY="3072"

# B2D environment extension (version related to B2D_VERSION by default)
B2D_EXTENSION_VERSION=B2D_VERSION
B2D_EXTENSION_REPO="https://github.com/AlbanMontaigu/boot2docker-vagrant-extension.git"
B2D_EXTENSION_REPO_RAWV="https://raw.githubusercontent.com/AlbanMontaigu/boot2docker-vagrant-extension/master/vagrant"

# Enable or not docker toolbox extension ON/OFF
DKTB_EXTENSION_STATUS="OFF"

# Enable or not docker transparent proxy daemon
DK_PROXYD_STATUS="OFF"

# Enable or not regular docker images pull
CRON_DK_IPULL_STATUS="OFF"
CRON_DK_IPULL_TIME="15 13 * * *"

# Enable or not regular docker images backup
CRON_DK_IBACKUP_STATUS="OFF"
CRON_DK_IBACKUP_TIME="30 13 * * *"


# ==========================================
# Virtual host configuration
# ==========================================
Vagrant.configure("2") do |config|


  # -----------------------------------
  # OS chosen on the machine
  # -----------------------------------
  config.vm.box = B2D_BOX
  config.vm.box_version = B2D_VERSION


  # -----------------------------------
  # Server Hardware 
  # -----------------------------------
  config.vm.provider :virtualbox do |vb|

    # Customize hier the memory available for your boot2docker
    vb.customize ["modifyvm", :id, "--memory", B2D_MEMORY]
  
    # Customize here the number of cpu you want to give to your boot2docker
    vb.customize ["modifyvm", :id, "--cpus", B2D_CPU]
  end


  # -----------------------------------
  # All internal services exposed
  # -----------------------------------
  config.vm.network "forwarded_port", guest: 22, host: 22, auto_correct: true
  # Put here all the port mapping you want to do between your computer and your boot2docker


  # -----------------------------------
  # Customization of the OS
  # -----------------------------------
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/provision.sh", :args => [ B2D_EXTENSION_REPO, B2D_EXTENSION_VERSION ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'DKTB_EXTENSION_STATUS', DKTB_EXTENSION_STATUS ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'DK_PROXYD_STATUS', DK_PROXYD_STATUS ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'CRON_DK_IPULL_STATUS', CRON_DK_IPULL_STATUS ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'CRON_DK_IPULL_TIME', CRON_DK_IPULL_TIME ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'CRON_DK_IBACKUP_STATUS', CRON_DK_IBACKUP_STATUS ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'CRON_DK_IBACKUP_TIME', CRON_DK_IBACKUP_TIME ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/bootlocal.sh", run: "always"

end
