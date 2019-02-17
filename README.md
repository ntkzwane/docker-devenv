# The lowdown

Disclaimer: This readme is not at all thorough. It assumes some basic knowledge of docker and docker-compose or vagrant.

The goal is to be able to setup any project, with all its dependencies, without installing anything other than `docker`
(and `docker-compose`) on your host machine.

# How it works
## 1. Docker
Each dependency/service/application has it's own `docker-compose` file that is responsible for bringing up the service
along with its dependencies. This can be done manually through
```
docker-compose up -f /path/to/this/repo/service-name.yml
```

or you can add the `dservice.sh` script to your path. Doing so will allow you to
start or stop a service through
```
dservice start service-name
```
or
```
dservice stop service-name
```
where `service-name` corresponds to the name of the `docker-compose` file (excluding the `.yml` signature in the
filename).
Note: In order to use `dservice.sh`, update the `DEV_ENV_DIR` in the script to point to the directory where this repository is cloned.

## 2. Vagrant
If you don't want to/can't run docker on your host machine, you can run your whole environment through a virtual
machine. Start up the VM through:
```
vagrant up
```

### Note:
Binaries that have been configured in the vagrant environment:

* Mongo: `mongo`, `mongodump`, `mongorestore`

Port forward mappings that have been configured in the vagrant environment:

* mongo:27017
