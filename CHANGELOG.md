
## 17.04.0-ce (2017-04-10)
- UPDATE: update to boot2docker-vagrant-box 17.04.0-ce
- UPDATE: try to go back to docker standard version name

## 17.03.1-ce (2017-04-07)
- UPDATE: update to boot2docker-vagrant-box 17.03.1ce

## 17.03.0-ce (2017-03-13)
- UPDATE: update to boot2docker-vagrant-box 17.03.0ce (ce instead of -ce to avoid box version naming issue)

## 1.13.1 (2017-02-11)
- UPDATE: update to boot2docker-vagrant-box 1.13.1

## 1.13.0 (2017-01-29)
- UPDATE: update to boot2docker-vagrant-box 1.13.0

## 1.12.5 (2016-12-26)
- UPDATE: update to boot2docker-vagrant-box 1.12.5

## 1.12.3 (2016-11-06)
- UPDATE: bump to boot2docker-vagrant-box 1.12.3
- UPDATE: better log information in file and console
- FEATURE: added ```DK_PROXYD_STATUS``` configuration for ```dk_proxyd``` daemon usage
- FEATURE: now provisioning will display more detail during vagrant * operations
- FEATURE: now param will display more detail during vagrant * operations
- FEATURE: now bootlocal will display more detail during vagrant * operations
- FEATURE: auto and regular docker pull available
- FEATURE: auto and regular images backup available

## 1.12.2 (2016-10-25)
- Update to boot2docker-vagrant-box 1.12.2

## 1.12.1f (2016-09-19)
- Update to extension 1.12.1f
- Update to boot2docker-vagrant-box 1.12.1f 

## 1.12.1e (2016-09-01)
- Update to extension 1.12.1e

## 1.12.1d (2016-08-31)
- Update to extension 1.12.1d

## 1.12.1c (2016-08-30)
- Update to extension 1.12.1c

## 1.12.1b (2016-08-29)
- Major doc update
- Update to extension 1.12.1b

## 1.12.1 (2016-08-26)
- Update to boot2docker 1.12.1

## 1.12.0 (2016-07-29)
- Update to boot2docker 1.12.0

## 1.11.2 (2016-06-04)
- Update to boot2docker 1.11.2

## 1.11.0 (2016-04-14)
- Update to boot2docker 1.11.0
- Workaround on provision.sh to clone repo with current user and not root (with sudo) to help managing proxy env var eventually not set for root user during provisioning

## 1.10.3 (2016-03-13)
- Update to boot2docker 1.10.3
- Introducing persistent param change with ```Vagrantfile``` and ```param.sh```

## 1.10.2 (2016-03-06)
- Update to boot2docker 1.10.2
- Now default memory is 3072 Mo (4096 with too much big by default for small config)
- Switching to new [boot2docker-vagrant-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension) name

## 1.10.1 (2016-02-12)
- Update to boot2docker 1.10.1

## 1.10.0 (2016-02-07)
- Update to boot2docker 1.10.0
- Complete rework with a new extension system ([boot2docker-vagrant-extension](https://github.com/AlbanMontaigu/boot2docker-vagrant-extension))
