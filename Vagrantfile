# -*- mode: ruby -*-
# vi: set ft=ruby :


# ==========================================
# General configuration
# ==========================================

# Choose your box
B2D_BOX="AlbanMontaigu/boot2docker"

# Choose your box version, related to docker's version
B2D_VERSION="18.06.0-ce"

#  B2D VM customization
B2D_CPU="2"
B2D_MEMORY="3072"

# B2D environment extension (version related to B2D_VERSION by default)
B2D_EXTENSION_VERSION=B2D_VERSION
B2D_EXTENSION_REPO="https://github.com/AlbanMontaigu/boot2docker-vagrant-extension.git"
B2D_EXTENSION_REPO_RAWV="https://raw.githubusercontent.com/AlbanMontaigu/boot2docker-vagrant-extension/#{B2D_EXTENSION_VERSION}/vagrant"

# Enable or not docker toolbox extension ON/OFF
DKTB_EXTENSION_STATUS="OFF"

# Enable or not docker transparent proxy daemon
DK_PROXYD_STATUS="OFF"

# Enable or not regular docker images pull
CRON_DK_IPULL_STATUS="ON"
CRON_DK_IPULL_TIME="15 13 * * *"

# Enable or not regular docker images backup
CRON_DK_IBACKUP_STATUS="ON"
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


  # -------------------------------------------
  # Customization of the OS
  # -------------------------------------------
  
  #
  # 1st part (provision start and initial param)
  #
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/provision-start.sh", :args => [ B2D_EXTENSION_REPO, B2D_EXTENSION_VERSION ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'DKTB_EXTENSION_STATUS', DKTB_EXTENSION_STATUS ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'DK_PROXYD_STATUS', DK_PROXYD_STATUS ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'CRON_DK_IPULL_STATUS', CRON_DK_IPULL_STATUS ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'CRON_DK_IPULL_TIME', CRON_DK_IPULL_TIME ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'CRON_DK_IBACKUP_STATUS', CRON_DK_IBACKUP_STATUS ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param.sh", :args => [ 'CRON_DK_IBACKUP_TIME', CRON_DK_IBACKUP_TIME ]

  #
  # 2nd part (additional docker images backup)
  # Put here 1 line by image you want to add like the sample below (docker-toolbox is already included)
  #
  #config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/param-ibackup.sh", :args => [ '.*alpine_3.7.*' ]
  
  #
  # last part (finish provisioning and run bootlocal)
  #
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/provision-end.sh", :args => [ B2D_EXTENSION_REPO, B2D_EXTENSION_VERSION ]
  config.vm.provision "shell", path: "#{B2D_EXTENSION_REPO_RAWV}/bootlocal.sh", run: "always"

end
