
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
